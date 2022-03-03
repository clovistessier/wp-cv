//MCP3208 Driver for ESP32
#include "MCP3208.h"

MCP3208::MCP3208(uint8_t SS) : ss(SS), clkSpd(500000)
{
    // init the instance of SPIClass attached to VSPI aka SPI3 (HSPI = SPI4)
    spi = new SPIClass(VSPI);

    // spi = new SPIClass(HSPI);

    // init vspi with default pins
    // SCLK = 18, MISO = 19, MOSI = 23, SS = 5
    // alternatively route through GPIO pins of your choice
    // spi->begin(0, 2, 4, 33); //SCLK, MISO, MOSI, SS
    // hspi default pins:
    // SCLK = 14, MISO = 12, MOSI = 13, SS = 15
    spi->begin();

    pinMode(ss, OUTPUT);
    digitalWrite(ss, HIGH);
}

void MCP3208::init()
{
    // init the instance of SPIClass attached to VSPI aka SPI3 (HSPI = SPI4)
    spi = new SPIClass(VSPI);

    // init vspi with default pins
    // SCLK = 18, MISO = 19, MOSI = 23, SS = 5
    // alternatively route through GPIO pins of your choice
    // spi->begin(0, 2, 4, 33); //SCLK, MISO, MOSI, SS
    // hspi default pins:
    // SCLK = 14, MISO = 12, MOSI = 13, SS = 15
    spi->begin();

    pinMode(ss, OUTPUT);
    digitalWrite(ss, HIGH);
}

void MCP3208::spiCommand(uint8_t *data, uint8_t size)
{
    spi->beginTransaction(SPISettings(clkSpd, MSBFIRST, SPI_MODE0));
    digitalWrite(ss, LOW);
    spi->transfer(data, size);
    digitalWrite(ss, HIGH);
    spi->endTransaction();
}

uint16_t MCP3208::readADC(uint8_t channel)
{
    // MCP3208 bit formatting:
    // first bit high is start bit
    // next bit indicates single-ended or differential reading
    // followed by ADC channel to be read

    uint8_t startBit = (1 << 2);
    uint8_t singleBit = (1 << 1);
    channel &= 0b00000111;

    uint8_t buffer[] = {(uint8_t)(startBit | singleBit) | ((channel & 0b00000100) >> 2),
                        (uint8_t)((channel & 0b00000011) << 6),
                        0};

    // Transfer the data to the ADC, the buffer is overwritten with the reading
    spiCommand(buffer, 3);

    // ADC reading is located in the last 12 bits of the buffer
    uint8_t mask = 0b00001111;
    uint16_t result = ((buffer[1] & mask) << 8) | buffer[2];
    return result;
}

MCP3208::~MCP3208()
{
    spi->end();
    delete spi;
    spi = nullptr;
}