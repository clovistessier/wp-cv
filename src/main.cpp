#include <Arduino.h>
#include <ArduinoOSC.h>
#include <SPI.h>

#ifndef CE0_PIN
#define CE0_PIN 5
#endif

#ifndef CE1_PIN
#define CE1_PIN 17
#endif

static const int clkSpd = 500000;
SPIClass *vspi = NULL;

uint16_t reading;

void vspiCommand(uint8_t *data, uint8_t size);
uint16_t readADC(uint8_t channel);

const char *ssid = "ESP32 Access Point";
const char *password = "password";

const IPAddress ip(192, 168, 1, 201);
const IPAddress gateway(192, 168, 1, 1);
const IPAddress subnet(255, 255, 255, 0);

const char *host = "192.168.1.202";
const int publish_port = 7000;
const int recv_port = 7001;
const char *args = "/trowacv/ch/1";

void setup()
{
  // put your setup code here, to run once:
  Serial.begin(115200);
  vspi = new SPIClass(VSPI);
  vspi->begin();

  pinMode(CE0_PIN, OUTPUT);
  pinMode(CE1_PIN, OUTPUT);
  digitalWrite(CE1_PIN, HIGH);
  digitalWrite(CE0_PIN, HIGH);

  WiFi.disconnect(true, true);
  delay(2000);
  WiFi.mode(WIFI_AP);
  WiFi.softAP(ssid, password);
  WiFi.softAPsetHostname(ssid);
  WiFi.softAPConfig(ip, gateway, subnet);

  Serial.println("WiFi connected");
  Serial.println("IP Address: ");
  Serial.println(WiFi.softAPIP());

  //OSC
  OscWiFi.publish(host, publish_port, args, reading);
}

void loop()
{
  // put your main code here, to run repeatedly:
  for (int i = 0; i < 16; i++)
  {
    reading = readADC(i);
    Serial.printf("%d\t", reading);
  }
  Serial.print("\n");
  OscWiFi.update();
}

void vspiCommand(uint8_t *data, const uint8_t size, const uint8_t ss)
{
  vspi->beginTransaction(SPISettings(clkSpd, MSBFIRST, SPI_MODE0));
  digitalWrite(ss, LOW);
  vspi->transfer(data, size);
  digitalWrite(ss, HIGH);
  vspi->endTransaction();
}

uint16_t readADC(uint8_t channel)
{
  // MCP3008 bit formatting:
  // first bit high is start bit
  // next bit indicates single-ended or differential reading
  // followed by ADC channel to be read
  uint8_t ss = (channel >= 8) ? CE1_PIN : CE0_PIN;

  static uint8_t startBit = 1;
  static uint8_t singleBit = (1 << 7);
  channel &= 0b00000111;

  uint8_t buffer[] = {startBit, (uint8_t)(singleBit | (channel << 4)), 0};
  // Serial.printf("buffer pre contents:  %d %d %d\n", buffer[0], buffer[1], buffer[2]);

  // Transfer the data to the ADC, the buffer is overwritten with the reading
  vspiCommand(buffer, 3, ss);

  // Serial.printf("buffer post contents: %d %d %d\n", buffer[0], buffer[1], buffer[2]);

  // ADC reading is located in the last 10 bits of the buffer
  uint8_t mask = 0b00000011;
  uint16_t result = ((buffer[1] & mask) << 8) | buffer[2];
  return result;
}
