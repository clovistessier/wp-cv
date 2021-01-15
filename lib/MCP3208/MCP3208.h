#ifndef MCP3208_H
#define MCP3208_H

#include <Arduino.h>
#include <SPI.h>

class MCP3208
{
private:
    uint8_t ss;
    uint32_t clkSpd;
    SPIClass *spi;
    void spiCommand(uint8_t *data, uint8_t size);

public:
    MCP3208(uint8_t SS);
    void init();
    uint16_t readADC(uint8_t channel);
    ~MCP3208();
};

#endif