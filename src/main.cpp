#include <Arduino.h>
#include <Oscillator.h>

#define ARDUINOOSC_ENABLE_ETHER
#include <ArduinoOSC.h>
#include <OSCBundleClient.h>

#define FRAMERATE 60
#define NUM_PARAMS 16
#define ETHER_SS_PIN 5

const char *ssid = "ESP32 Access Point";
const char *password = "password";

const IPAddress ip(192, 168, 1, 201);
const IPAddress gateway(192, 168, 1, 1);
const IPAddress subnet(255, 255, 255, 0);

uint8_t mac[] = {
    0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED};

static const String params[] = {
    "lum", "mix", "hue", "sat", "x", "y", "z", "rot",
    "bri", "flt", "res", "con", "hmod", "hoff", "hlfo", "del"};

QueueHandle_t queue;
void TaskDummyADC(void *pvParameters);
void TaskOscWiFi(void *pvParameters);
void TaskOscEther(void *pvParameters);

inline TickType_t hzToTickPeriod(const uint8_t hz);

void setup()
{
  // put your setup code here, to run once:
  Serial.begin(115200);

  // WiFi Stuff
  WiFi.disconnect(true, true); // disable wifi, erase ap info
  delay(2000);
  WiFi.mode(WIFI_AP);
  WiFi.softAP(ssid, password);
  WiFi.softAPsetHostname(ssid);
  WiFi.softAPConfig(ip, gateway, subnet);

  Serial.println("WiFi connected");
  Serial.println("IP Address: ");
  Serial.println(WiFi.softAPIP());

  // Ethernet Stuff
  Ethernet.init(ETHER_SS_PIN);
  Ethernet.begin(mac, ip);

  if (Ethernet.hardwareStatus() == EthernetNoHardware)
  {
    Serial.println("Ethernet shield was not found.  Sorry, can't run without hardware. :(");
  }
  if (Ethernet.linkStatus() == LinkOFF)
  {
    Serial.println("Ethernet cable is not connected.");
  }

  queue = xQueueCreate(5, NUM_PARAMS * sizeof(uint16_t));

  // xTaskCreatePinnedToCore(
  //     TaskOscWiFi, // pvTaskCode
  //     "OSC_send",  // name for humans
  //     2048,        // usStackDepth
  //     NULL,        // pvParameters
  //     3,           // uxPriority
  //     NULL,        // pvCreatedTask
  //     1);          // xCoreID

  xTaskCreatePinnedToCore(
      TaskDummyADC,
      "Dummy_Data",
      1024,
      NULL,
      2,
      NULL,
      1);

  xTaskCreatePinnedToCore(
      TaskOscEther, // pvTaskCode
      "OSC_send",   // name for humans
      2048,         // usStackDepth
      NULL,         // pvParameters
      3,            // uxPriority
      NULL,         // pvCreatedTask
      1);           // xCoreID
}

void TaskDummyADC(void *pvParameters)
{
  (void)pvParameters;
  static TickType_t xLastWakeTime;
  static const TickType_t xFrequency = hzToTickPeriod(FRAMERATE);
  xLastWakeTime = xTaskGetTickCount();

  Oscillator osc(1, 512, 511);
  static uint16_t vals[NUM_PARAMS];

  for (;;)
  {
    vTaskDelayUntil(&xLastWakeTime, xFrequency);
    for (uint8_t i = 0; i < NUM_PARAMS; i++)
    {
      vals[i] = osc.getValue();
    }
    xQueueSendToBack(queue, &vals, xFrequency);
    osc.update();
  }
}

void TaskOscWiFi(void *pvParameters)
{
  (void)pvParameters;
  static TickType_t xLastWakeTime;
  static const TickType_t xFrequency = hzToTickPeriod(FRAMERATE);
  xLastWakeTime = xTaskGetTickCount();
  UBaseType_t stackHighwater = 2048;
  UBaseType_t prev = stackHighwater;

  //OSC
  static const String host = "192.168.1.202";
  static const uint16_t send_port = 7000;
  static const String addr = "/wp_cv/";
  static uint16_t vals[NUM_PARAMS];

  OscBundler<WiFiUDP> bundler;
  OscMessage msg;

  for (;;)
  {
    vTaskDelayUntil(&xLastWakeTime, xFrequency);
    if (xQueueReceive(queue, &vals, 10) == pdTRUE)
    {
      bundler.begin_bundle();
      for (int i = 0; i < NUM_PARAMS; i++)
      {
        msg.init(addr + params[i]).push(vals[i]);
        bundler.encode(msg);
      }
      bundler.end_bundle();
      bundler.send(host, send_port);
    }

    //stack monitoring
    stackHighwater = min(stackHighwater, uxTaskGetStackHighWaterMark(NULL));
    if (stackHighwater != prev)
    {
      Serial.println(stackHighwater);
      prev = stackHighwater;
    }
  }
}

void TaskOscEther(void *pvParamters)
{
  (void)pvParamters;
  static TickType_t xLastWakeTime;
  static const TickType_t xFrequency = hzToTickPeriod(FRAMERATE);
  xLastWakeTime = xTaskGetTickCount();
  UBaseType_t stackHighwater = 2048;
  UBaseType_t prev = stackHighwater;

  //OSC
  static const String host = "192.168.1.202";
  static const uint16_t send_port = 7000;
  static const String addr = "/wp_cv/";
  static uint16_t vals[NUM_PARAMS];

  OscBundler<EthernetUDP> bundler;
  OscMessage msg;

  for (;;)
  {
    vTaskDelayUntil(&xLastWakeTime, xFrequency);
    if (xQueueReceive(queue, &vals, 10) == pdTRUE)
    {
      bundler.begin_bundle();
      for (int i = 0; i < NUM_PARAMS; i++)
      {
        msg.init(addr + params[i]).push(vals[i]);
        bundler.encode(msg);
      }
      bundler.end_bundle();
      bundler.send(host, send_port);
    }
    
    //stack monitoring
    stackHighwater = min(stackHighwater, uxTaskGetStackHighWaterMark(NULL));
    if (stackHighwater != prev)
    {
      Serial.println(stackHighwater);
      prev = stackHighwater;
    }
  }
}

inline TickType_t hzToTickPeriod(const uint8_t hz)
{
  return (((float)1 / hz) * 1000) / portTICK_PERIOD_MS;
}

void loop()
{
  // put your main code here, to run repeatedly:

  // Not using loop(), program is tasked based
  vTaskDelete(NULL);
}
