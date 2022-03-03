/**
 * GPIO Manager for configuring MUXs for ADC input and LED output
 * Clovis Tessier 2021
**/

#ifndef MUXMANAGER_H
#define MUXMANAGER_H

#include <driver/gpio.h>
#include <Arduino.h>

// GPIO Pin Declaration
// #define MUX_EN GPIO_NUM_1
// #define MUX_SEL_0 GPIO_NUM_1
// #define MUX_SEL_1 GPIO_NUM_1
// #define MUX_SEL_2 GPIO_NUM_1
#define CH_SEL_0 GPIO_NUM_25
#define CH_SEL_1 GPIO_NUM_33
#define CH_SEL_2 GPIO_NUM_32

#define MUX_SEL_R GPIO_NUM_27
#define MUX_SEL_G GPIO_NUM_26

#define GPIO_OUTPUT_PIN_SEL ((1ULL << MUX_SEL_R) | (1ULL << MUX_SEL_G) | (1ULL << CH_SEL_0) | (1ULL << CH_SEL_1) | (1ULL << CH_SEL_2))

#define MASK(n) 1 << n

// MUX Select Macros
typedef enum
{
    CV_IN_TOP_ROW = 0,
    CV_IN_BOTTOM_ROW,
    CV_ATT_TOP_ROW,
    CV_ATT_BOTTOM_ROW,
    LED_R_TOP_ROW,
    LED_G_TOP_ROW,
    LED_R_BOTTOM_ROW,
    LED_G_BOTTOM_ROW
} mux_select_t;

class MUXManager
{
private:
    bool enabled;
    mux_select_t currMUX;
    uint8_t currChannel;

public:
    MUXManager();
    bool isEnabled();
    void enable();
    void disable();
    void selectMUX(mux_select_t mux);
    void selectChannel(uint8_t ch);
    mux_select_t getSelectedMUX();
    uint8_t getSelectedChannel();
    ~MUXManager();
};

#endif
