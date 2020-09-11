#include <Arduino.h>
#include <ArduinoOSC.h>
#include <SPI.h>

#ifndef CE0_PIN
#define CE0_PIN 5
#endif

#ifndef CE1_PIN
#define CE1_PIN 17
#endif

uint8_t ss = 5;
static const int clkSpd = 500000;
SPIClass *vspi = NULL;

uint16_t reading;

void vspiCommand(uint8_t *data, uint8_t size);
uint16_t readADC(uint8_t channel);

void setup()
{
  // put your setup code here, to run once:
  Serial.begin(115200);
  vspi = new SPIClass(VSPI);
  vspi->begin();

  pinMode(CE0_PIN, OUTPUT);
  digitalWrite(CE0_PIN, HIGH);
}

void loop()
{
  // put your main code here, to run repeatedly:
  // for (int i = 0; i < 8; i++)
  // {
  //   reading = readADC(i);
  //   Serial.printf("%d\t", reading);
  //   delay(10);
  // }
  // Serial.print("\n");
  readADC(4);
  vTaskDelay(30 / portTICK_PERIOD_MS);

}

void vspiCommand(uint8_t *data, uint8_t size)
{
  vspi->beginTransaction(SPISettings(clkSpd, MSBFIRST, SPI_MODE0));
  digitalWrite(5, LOW);
  vspi->transfer(data, size);
  digitalWrite(5, HIGH);
  vspi->endTransaction();
}

uint16_t readADC(uint8_t channel)
{
  // MCP3008 bit formatting:
  // first bit high is start bit
  // next bit indicates single-ended or differential reading
  // followed by ADC channel to be read

  uint8_t startBit = 1;
  uint8_t singleBit = (1 << 7);
  channel &= 0b00000111;

  uint8_t buffer[] = {startBit, (uint8_t)(singleBit | (channel << 4)), 0};
  // Serial.printf("buffer pre contents:  %d %d %d\n", buffer[0], buffer[1], buffer[2]);

  // Transfer the data to the ADC, the buffer is overwritten with the reading
  vspiCommand(buffer, 3);

  // Serial.printf("buffer post contents: %d %d %d\n", buffer[0], buffer[1], buffer[2]);

  // ADC reading is located in the last 10 bits of the buffer
  uint8_t mask = 0b00000011;
  uint16_t result = ((buffer[1] & mask) << 8) | buffer[2];
  Serial.println(result);
  return result;
}
