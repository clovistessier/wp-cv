#ifndef OSCILLATOR_H
#define OSCILLATOR_H

#include <Arduino.h>

class Oscillator
{
public:
    Oscillator(const double_t _freq, const float_t _amp, const float_t _offset, const float_t _phase = 0, const uint8_t _framerate = 60);
    void update();
    uint16_t getValue();

private:
    double_t freq;
    float_t amp;
    float_t offset;
    float_t phase{0};
    uint8_t framerate{60};
    double_t angle;
    double_t inc;
    uint16_t value;
};

#endif