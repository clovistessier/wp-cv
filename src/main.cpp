#include <Arduino.h>
#include <ArduinoOSC.h>
#include <Oscillator.h>

#define FRAMERATE 60
#define NUM_PARAMS 16

const char *ssid = "ESP32 Access Point";
const char *password = "password";

const IPAddress ip(192, 168, 1, 201);
const IPAddress gateway(192, 168, 1, 1);
const IPAddress subnet(255, 255, 255, 0);

static const String params[] = {
    "lum", "mix", "hue", "sat", "x", "y", "z", "rot",
    "bri", "flt", "res", "con", "hmod", "hoff", "hlfo", "del"};

QueueHandle_t queue;
void TaskOscSend(void *pvParameters);
void TaskDummyADC(void *pvParameters);

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

  queue = xQueueCreate(5, sizeof(uint16_t));

  xTaskCreatePinnedToCore(
      TaskOscSend, // pvTaskCode
      "OSC_send",  // name for humans
      2048,        // usStackDepth
      NULL,        // pvParameters
      3,           // uxPriority
      NULL,        // pvCreatedTask
      1);          // xCoreID

  xTaskCreatePinnedToCore(
      TaskDummyADC,
      "Dummy_Data",
      1024,
      NULL,
      2,
      NULL,
      1);
}

void TaskDummyADC(void *pvParameters)
{
  (void)pvParameters;
  static TickType_t xLastWakeTime;
  static const TickType_t xFrequency = hzToTickPeriod(FRAMERATE);
  xLastWakeTime = xTaskGetTickCount();

  Oscillator osc(1, 512, 511);
  static uint16_t val;
  for (;;)
  {
    vTaskDelayUntil(&xLastWakeTime, xFrequency);
    val = osc.getValue();
    xQueueSendToBack(queue, (void *)&val, xFrequency);
    osc.update();
  }
}

void TaskOscSend(void *pvParameters)
{
  (void)pvParameters;
  static TickType_t xLastWakeTime;
  static const TickType_t xFrequency = hzToTickPeriod(FRAMERATE);
  xLastWakeTime = xTaskGetTickCount();
  UBaseType_t stackHighwater = 2048;
  UBaseType_t prev = stackHighwater;

  static uint16_t val = 0;

  //OSC
  static const String host = "192.168.1.202";
  static const uint16_t send_port = 7000;
  static const String addr = "/wp_cv/";

  for (;;)
  {
    vTaskDelayUntil(&xLastWakeTime, xFrequency);
    if (xQueueReceive(queue, &val, xFrequency) == pdTRUE)
    {
      for (int i = 0; i < NUM_PARAMS; i++)
      {
        if (i % 2 == 0)
        {
          OscWiFi.send(host, send_port, addr + params[i], val);
        }
        else
        {
          OscWiFi.send(host, send_port, addr + params[i], 1023 - val);
        }
      }
    }
    // else
    // {
    //   Serial.println("Didn't receive from the queue in time");
    // }

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
