#include "Oscillator.h"

Oscillator::Oscillator(const double_t _freq, const float_t _amp, const float_t _offset, const float_t _phase, const uint8_t _framerate) 
: freq(_freq), amp(_amp), offset(_offset), phase(_phase), framerate(_framerate), angle(phase)
{
    value = (uint16_t) (offset + (amp * sin(angle)));
    inc = (freq / framerate) * 2 * PI;
}

void Oscillator::update() {
    angle += inc;
    value = (uint16_t) (offset + (amp * sin(angle)));
}

uint16_t Oscillator::getValue() {
    return value;
}