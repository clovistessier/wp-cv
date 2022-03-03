#include "MUXManager.h"

MUXManager::MUXManager()
{

    // Configure GPIO pins

    gpio_config_t io_conf;
    // Disable interrupts
    io_conf.intr_type = GPIO_INTR_DISABLE;
    // Set as output
    io_conf.mode = GPIO_MODE_OUTPUT;
    // Bit mask of the pins to be set
    io_conf.pin_bit_mask = GPIO_OUTPUT_PIN_SEL;
    // Disable pull-down mode
    io_conf.pull_down_en = GPIO_PULLDOWN_DISABLE;
    // Disable pull-up mode
    io_conf.pull_up_en = GPIO_PULLUP_DISABLE;
    // Configure GPIO with the given settings
    gpio_config(&io_conf);

    // Deselect all MUXs
    disable();
    // selectMUX(CV_IN_TOP_ROW);
    selectChannel(0);
}

void MUXManager::disable()
{
#ifdef LS138
    if (enabled)
    {
        gpio_set_level(MUX_EN, 0);
        enabled = false;
    }
#endif

    // temporary
    // set inhibit pins of both muxes high
    gpio_set_level(MUX_SEL_R, 1);
    gpio_set_level(MUX_SEL_G, 1);
}

void MUXManager::enable()
{
#ifdef LS138
    if (!enabled)
    {
        gpio_set_level(MUX_EN, 1);
        enabled = true;
    }
#endif

    //temporary overload while there are only 2 muxes
    if (currMUX == LED_R_TOP_ROW)
    {
        gpio_set_level(MUX_SEL_R, 0);
        gpio_set_level(MUX_SEL_G, 1);
    }
    else if (currMUX == LED_G_TOP_ROW)
    {
        gpio_set_level(MUX_SEL_R, 1);
        gpio_set_level(MUX_SEL_G, 0);
    }
    else
    {
        gpio_set_level(MUX_SEL_R, 1);
        gpio_set_level(MUX_SEL_G, 1);
    }
}

bool MUXManager::isEnabled() { return enabled; }

void MUXManager::selectMUX(mux_select_t mux)
{
    if (mux > 7 || mux < 0)
    {
        return;
    }
#ifdef LS138
    gpio_set_level(MUX_SEL_0, (mux & MASK(0)));
    gpio_set_level(MUX_SEL_1, ((mux & MASK(1)) >> 1));
    gpio_set_level(MUX_SEL_2, ((mux & MASK(2)) >> 2));
#endif

    currMUX = mux;
}

void MUXManager::selectChannel(uint8_t ch)
{
    if (ch > 7 || ch < 0)
    {
        return;
    }

    gpio_set_level(CH_SEL_0, (ch & MASK(0)));
    gpio_set_level(CH_SEL_1, ((ch & MASK(1)) >> 1));
    gpio_set_level(CH_SEL_2, ((ch & MASK(2)) >> 2));

    currChannel = ch;
}

mux_select_t MUXManager::getSelectedMUX() { return currMUX; }
uint8_t MUXManager::getSelectedChannel() { return currChannel; }

MUXManager::~MUXManager()
{
    // gpio_reset_pin(MUX_EN);
    // gpio_reset_pin(MUX_SEL_0);
    // gpio_reset_pin(MUX_SEL_1);
    // gpio_reset_pin(MUX_SEL_2);
    gpio_reset_pin(MUX_SEL_R);
    gpio_reset_pin(MUX_SEL_G);
    gpio_reset_pin(CH_SEL_0);
    gpio_reset_pin(CH_SEL_1);
    gpio_reset_pin(CH_SEL_2);
}