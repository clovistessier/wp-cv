#include <Arduino.h>
#include <Oscillator.h>
#include <MCP3008.h>
#include <MCP3208.h>
#include <MUXManager.h>

#define ARDUINOOSC_ENABLE_ETHER
#include <ArduinoOSC.h>
#include <OSCBundleClient.h>

#include <driver/ledc.h>
#include <driver/i2s.h>
#include <freertos/queue.h>

#define FRAMERATE 60
#define NUM_PARAMS 16
#define ETHER_SS_PIN 17
#define I2S_BCK_PIN 26
#define I2S_WS_PIN 25
#define I2S_DOUT_PIN 22

// #define CE0_PIN 32  //sets ADCs on HSPI
// #define CE1_PIN 33

#define CE0_PIN 17 //sets ADCs on VSPI
#define CE1_PIN 5
// you'll have to change this later since the ethernet thing runs
// on VSPI

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

enum led_color
{
  green,
  red
};

MUXManager *muxManager;

SemaphoreHandle_t xSemaphoreMUX = NULL;
SemaphoreHandle_t xSemaphoreSPI = NULL;

QueueHandle_t queue;
void TaskDummyADC(void *pvParameters);
void TaskOscWiFi(void *pvParameters);
void TaskOscEther(void *pvParameters);
void TaskReadADC(void *pvParameters);
void TaskLEDs(void *pvParameters);
void TaskI2SIO(void *pvParameters);

inline TickType_t hzToTickPeriod(const uint8_t hz);
inline uint8_t getLEDindex(const uint8_t input_index, const led_color color);

void setup()
{
  // put your setup code here, to run once:
  Serial.begin(115200);

  muxManager = new MUXManager();

  xSemaphoreMUX = xSemaphoreCreateMutex();
  xSemaphoreSPI = xSemaphoreCreateMutex();
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

  // xTaskCreatePinnedToCore(
  //     TaskReadADC,
  //     "ADC_Read",
  //     2048,
  //     NULL,
  //     4,
  //     NULL,
  //     1);

  // xTaskCreatePinnedToCore(
  //     TaskOscEther, // pvTaskCode
  //     "OSC_send",   // name for humans
  //     2048,         // usStackDepth
  //     NULL,         // pvParameters
  //     3,            // uxPriority
  //     NULL,         // pvCreatedTask
  //     1);           // xCoreID

  // xTaskCreatePinnedToCore(
  //     TaskLEDs,
  //     "LED output",
  //     2048,
  //     NULL,
  //     2,
  //     NULL,
  //     1);

  xTaskCreatePinnedToCore(
      TaskI2SIO,
      "I2S I/O",
      4096,
      NULL,
      2,
      NULL,
      1);
}

void TaskDummyADC(void *pvParameters)
{
  (void)pvParameters;
  static TickType_t xLastWakeTime;
  static const TickType_t xFrequency = hzToTickPeriod(60);
  xLastWakeTime = xTaskGetTickCount();

  constexpr float frequency = 0.2;
  constexpr uint16_t amplitude = 2047;
  constexpr uint16_t offset = 0;
  static Oscillator osc(frequency, amplitude, offset);

  static int16_t vals[NUM_PARAMS] = {0};
  static uint8_t current = 0;

  for (;;)
  {
    vTaskDelayUntil(&xLastWakeTime, xFrequency);
    for (uint8_t i = 0; i < NUM_PARAMS; i++)
    {
      if (i % 2 == 0)
      {
        vals[i] = osc.getValue();
      }
      else
      {
        vals[i] = -1 * osc.getValue();
      }
      //Serial.printf("%d\t", vals[i]);
    }
    //Serial.print("\n");
    osc.update();

    // vTaskDelay(500 / portTICK_PERIOD_MS);

    // for (int i = 0; i < NUM_PARAMS; i++)
    // {
    //   vals[i] = 0;
    // }
    // vals[current % NUM_PARAMS] = (current < NUM_PARAMS ? 2048 : -2048);
    // current = (current + 1) % (NUM_PARAMS * 2);

    xQueueSendToBack(queue, &vals, 0);
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

  // WiFi Stuff
  WiFi.disconnect(true, true); // disable wifi, erase ap info
  delay(2000);
  WiFi.mode(WIFI_AP);
  WiFi.softAP(ssid, password);
  delay(1000);
  WiFi.softAPsetHostname(ssid);
  WiFi.softAPConfig(ip, gateway, subnet);

  Serial.println("WiFi connected");
  Serial.println("IP Address: ");
  Serial.println(WiFi.softAPIP());

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

void TaskOscEther(void *pvParameters)
{
  (void)pvParameters;
  static TickType_t xLastWakeTime;
  static const TickType_t xFrequency = hzToTickPeriod(FRAMERATE);
  xLastWakeTime = xTaskGetTickCount();
  UBaseType_t stackHighwater = 2048;
  UBaseType_t prev = stackHighwater;

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

void TaskReadADC(void *pvParameters)
{
  (void)pvParameters;
  static TickType_t xLastWakeTime;
  static const TickType_t xFrequency = hzToTickPeriod(FRAMERATE);
  xLastWakeTime = xTaskGetTickCount();
  UBaseType_t stackHighwater = 2048;
  UBaseType_t prev = stackHighwater;

  static MCP3208 adc1(CE0_PIN); // CV 1-8
  static uint16_t vals[NUM_PARAMS] = {0};
  static uint16_t vals_scaled[NUM_PARAMS] = {0};

  for (;;)
  {
    vTaskDelayUntil(&xLastWakeTime, xFrequency);
    if ((xSemaphoreMUX != NULL) && (xSemaphoreSPI != NULL))
    {
      if (xSemaphoreTake(xSemaphoreMUX, (TickType_t)xFrequency / 3) == pdTRUE)
      {
        if (xSemaphoreTake(xSemaphoreSPI, (TickType_t)xFrequency / 3) == pdTRUE)
        {
          muxManager->enable();

          muxManager->selectMUX(CV_IN_TOP_ROW);
          for (uint8_t i = 0; i < (NUM_PARAMS / 2); i++)
          {
            muxManager->selectChannel(i);
            vals[i] = adc1.readADC(0) - 2048;
          }

          muxManager->selectMUX(CV_IN_BOTTOM_ROW);
          for (uint8_t i = 0; i < (NUM_PARAMS / 2); i++)
          {
            muxManager->selectChannel(i);
            vals[8 + i] = adc1.readADC(0) - 2048;
          }

          muxManager->selectMUX(CV_ATT_TOP_ROW);
          for (uint8_t i = 0; i < (NUM_PARAMS / 2); i++)
          {
            muxManager->selectChannel(i);
            vals_scaled[i] = vals[i] * (float_t)((adc1.readADC(0) - 2048) / 2048);
          }

          muxManager->selectMUX(CV_ATT_BOTTOM_ROW);
          for (uint8_t i = 0; i < (NUM_PARAMS / 2); i++)
          {
            muxManager->selectChannel(i);
            vals_scaled[8 + i] = vals[i] * (float_t)((adc1.readADC(0) - 2048) / 2048);
          }

          xSemaphoreGive(xSemaphoreSPI);
        }
        xSemaphoreGive(xSemaphoreMUX);
      }

      for (uint8_t i = 0; i < NUM_PARAMS; i++)
      {
        Serial.printf("%d\t", vals_scaled[i]);
      }
      Serial.print("\n");

      xQueueSendToBack(queue, &vals, (TickType_t)xFrequency / 3);

      stackHighwater = min(stackHighwater, uxTaskGetStackHighWaterMark(NULL));
      if (stackHighwater != prev)
      {
        Serial.println(stackHighwater);
        prev = stackHighwater;
      }
    }
  }
}

void TaskLEDs(void *pvParameters)
{
  Serial.println("In LED task");
  (void)pvParameters;

  const mux_select_t led_muxes[] = {
      LED_R_TOP_ROW,
      LED_G_TOP_ROW,
      LED_R_BOTTOM_ROW,
      LED_G_BOTTOM_ROW,
  };

  static uint16_t vals[NUM_PARAMS] = {0};
  uint8_t ch;
  uint8_t offset;
  uint32_t led_duty = 0;
  TickType_t delay_amt = (1000 / (16 * 60)) / portTICK_PERIOD_MS;

  // PWM Timer configuration settings
  ledc_timer_config_t ledc_timer;
  // Set timer to High Speed Mode (allows seamless duty cycle changes)
  ledc_timer.speed_mode = LEDC_HIGH_SPEED_MODE;
  // Set the resolution of the duty cycle
  // This parameter is interdependent with frequency
  // higher frequency -> less duty resolution available
  ledc_timer.duty_resolution = LEDC_TIMER_11_BIT;
  // Select Timer 0 arbitrarily
  ledc_timer.timer_num = LEDC_TIMER_0;
  // Select frequency of 50 kHz arbitrarily
  ledc_timer.freq_hz = 5000;

  // Apply configuration settings
  ledc_timer_config(&ledc_timer);

  // PWM channel configuration settings
  ledc_channel_config_t ledc_channel = {
      .gpio_num = 12,
      .speed_mode = LEDC_HIGH_SPEED_MODE,
      .channel = LEDC_CHANNEL_0,
      .intr_type = LEDC_INTR_DISABLE,
      .timer_sel = LEDC_TIMER_0,
      .duty = 0};

  ledc_channel_config(&ledc_channel);

  // Initialize both the LEDs to 0 (off)
  ledc_set_duty(ledc_channel.speed_mode, ledc_channel.channel, 0);
  ledc_update_duty(ledc_channel.speed_mode, ledc_channel.channel);

  for (;;)
  {
    // Copy in the latest values, if available
    if (xQueueReceive(queue, &vals, 0) == pdTRUE)
    {
      Serial.println("got new values");
    }

    if (xSemaphoreMUX != NULL)
    {
      if (xSemaphoreTake(xSemaphoreMUX, 10) == pdTRUE)
      {
        for (int m = 0; m < 2; m++)
        {
          // For the bottom rows, we need to loop through the second half of the array
          //offset = 8 * (m % 2);
          muxManager->disable();
          muxManager->selectMUX(led_muxes[m]);
          for (ch = 0; ch < NUM_PARAMS / 2; ch++)
          {
            muxManager->disable();
            muxManager->selectChannel(ch);
            if (muxManager->getSelectedMUX() == LED_R_TOP_ROW) // Red LEDs
            {
              led_duty = 2048 - min((int)vals[ch], 2048);
            }
            else if (muxManager->getSelectedMUX() == LED_G_TOP_ROW) // Green LEDs
            {
              led_duty = max((int)vals[ch], 2048) - 2048;
            }
            ledc_set_duty(ledc_channel.speed_mode, ledc_channel.channel, led_duty);
            ledc_update_duty(ledc_channel.speed_mode, ledc_channel.channel);
            muxManager->enable();

            vTaskDelay(delay_amt);
            muxManager->disable();
          }
        }

        xSemaphoreGive(xSemaphoreMUX);
      }
    }
  }
}

void TaskI2SIO(void *pvParameters)
{
  (void)pvParameters;

  //configure i2s
  static const i2s_port_t i2s_num = I2S_NUM_0; //i2s port num

  // i2s peripheral is feeding shift registers.
  // each of the 32 bits will be its own pwm signal
  // the dma buffer will hold one cycle of the pwm signal
  // the length of the buffer is equal to the pwm resolution
  // 8 bit pwm means 256 samples
  // 4 buffers * 64 samples = 256 total samples

  static const i2s_config_t i2s_config = {
      .mode = (i2s_mode_t)(I2S_MODE_MASTER | I2S_MODE_TX),
      .sample_rate = 10000, //we want 32 signals at 5 kHz
      .bits_per_sample = I2S_BITS_PER_SAMPLE_16BIT,
      .channel_format = I2S_CHANNEL_FMT_RIGHT_LEFT,
      .communication_format = I2S_COMM_FORMAT_I2S_MSB,
      .intr_alloc_flags = 0,
      .dma_buf_count = 4,
      .dma_buf_len = 64,
      .use_apll = false};

  static const i2s_pin_config_t pin_config = {
      .bck_io_num = I2S_BCK_PIN,
      .ws_io_num = I2S_WS_PIN,
      .data_out_num = I2S_DOUT_PIN,
      .data_in_num = I2S_PIN_NO_CHANGE};

  if (i2s_driver_install(i2s_num, &i2s_config, 0, NULL) == ESP_OK)
  {
    Serial.println("i2s driver successfully installed.");
  }
  else
  {
    Serial.println("something didn't work installing the i2s driver");
  }

  if (i2s_set_pin(i2s_num, &pin_config) == ESP_OK)
  {
    Serial.println("i2s pins set.");
  }
  else
  {
    Serial.println("something went wrong setting i2s pins.");
  }

  i2s_set_clk(i2s_num, 5000 * 32, I2S_BITS_PER_SAMPLE_32BIT, I2S_CHANNEL_MONO);

  // uint32_t samples_data[5] = {
  //     0b01010101010101010101010101010101,
  //     0b00110011001100110011001100110011,
  //     0b00001111000011110000111100001111,
  //     0b00000000111111110000000011111111,
  //     0b00000000000000001111111111111111};

  size_t bytes_written;

  static size_t dma_buffer_size = i2s_config.dma_buf_count * i2s_config.dma_buf_len;
  // static size_t num_samples = sizeof(samples_data) / sizeof(uint32_t);

  // for (uint8_t i = 0; i < (dma_buffer_size / num_samples); i++)
  // {
  // i2s_write(i2s_num, &samples_data, sizeof(samples_data), &bytes_written, portMAX_DELAY);
  // }

  static int16_t test_vals[16];

  // for (uint8_t i = 0; i < 16; i++)
  // {
  //   if (i % 2 == 0)
  //   {
  //     test_vals[i] = 1024;
  //   }
  //   else
  //   {
  //     test_vals[i] = -1024;
  //   }
  // }

  // bit format
  // [0-7]      [8-15]      [16-23]   [24-31]
  // [Bottom R] [Bottom G]  [Top R]   [Top G]

  Serial.println("generated test values.");

  uint32_t samples_data[256] = {0};

  for (;;)
  {
    // receive latest scaled CV values
    if (xQueueReceive(queue, &test_vals, 100) == pdTRUE)
    {
      // uint8_t active_index = 0;
      // Serial.print("received: ");
      // for (uint8_t i = 0; i < NUM_PARAMS; i++)
      // {
      //   Serial.printf("%d\t", test_vals[i]);
      //   if (test_vals[i] != 0)
      //   {
      //     active_index = i;
      //   }
      // }
      // Serial.print("\n");
      // Serial.printf("Input Index: %d\tGreen LED index: %d\tRed LED index: %d\n", active_index, getLEDindex(active_index, green), getLEDindex(active_index, red));

      // expecting input between -2047 and 2047 (probably change this to floats later on)
      // generate the sample data
      for (uint8_t i = 0; i < 16; i++)
      {
        bool neg = test_vals[i] < 0;

        int16_t scaled = test_vals[i];
        if (neg)
        {
          scaled *= -1;
        }
        scaled = scaled >> 3;

        uint8_t green_index = getLEDindex(i, green);
        uint8_t red_index = getLEDindex(i, red);

        for (uint16_t j = 0; j < 256; j++)
        {
          // if positive, set green led on and red off
          if (neg != true)
          {
            // set pulse width of green
            if (scaled > j)
            {
              samples_data[j] |= (1UL << green_index);
            }
            else
            {
              samples_data[j] &= ~(1UL << green_index);
            }

            samples_data[j] &= ~(1UL << red_index);
          }
          // if negative, set green led off and red on
          else // (neg == true)
          {
            if (scaled > j)
            {
              samples_data[j] |= (1UL << red_index);
            }
            else
            {
              samples_data[j] &= ~(1UL << red_index);
            }
            samples_data[j] &= ~(1UL << green_index);
          }
          // else // if zero turn them both off
          // {
          //   samples_data[j] &= ~(1UL << green_index);
          //   samples_data[j] &= ~(1UL << red_index);
          // }
        }
      }

      // generate sample data
      // for (uint16_t i = 0; i < 256; i++)
      // {
      //   for (uint8_t j = 0; j < 16; j++)
      //   {
      //     //Serial.printf("1) test_vals[%d] = %d \n", j, test_vals[j]);
      //     if (test_vals[j] > 0)
      //     {
      //       // turn on Green
      //       // Set pulse width according to value
      //       if ((test_vals[j] >> 3) > i)
      //       {
      //         //Serial.printf("2) value to be shifted in: %ul \n", (1UL << (31 - j)));
      //         samples_data[i] |= (1UL << (getLEDindex(j, green)));
      //         //Serial.printf("3) samples_data[i] = %ul \n", samples_data[i]);
      //       }
      //       else
      //       {
      //         samples_data[i] &= ~(1UL << (getLEDindex(j, green)));
      //         //Serial.printf("4) samples_data[i] = %ul \n", samples_data[i]);
      //       }
      //       //Serial.printf("4.5) !(1UL << (15 - %d)) =  %ul \n", j, ~(1UL << (15 - j)));

      //       // turn off Red
      //       samples_data[i] &= ~(1UL << (getLEDindex(j, red)));
      //       //Serial.printf("5) samples_data[i] = %ul \n", samples_data[i]);
      //     }
      //     else if (test_vals[j] < 0)
      //     {
      //       // turn on red
      //       // Set pulse width according to value
      //       if (((-1 * test_vals[j]) >> 3) > i)
      //       {
      //         samples_data[i] |= (1UL << (getLEDindex(j, red)));
      //         //Serial.printf("6) samples_data[i] = %ul \n", samples_data[i]);
      //       }
      //       else
      //       {
      //         samples_data[i] &= ~(1UL << (getLEDindex(j, red)));
      //         //Serial.printf("7) samples_data[i] = %ul \n", samples_data[i]);
      //       }

      //       // turn off Green
      //       samples_data[i] &= ~(1UL << (getLEDindex(j, green)));
      //       //Serial.printf("8) samples_data[i] = %ul \n", samples_data[i]);
      //     }
      //     //Serial.printf("9) samples_data[i] = %ul \n", samples_data[i]);
      //   }
      //   //Serial.println();
      // }

      // write it to the i2s periphereal

      // for (uint16_t i = 0; i < 256; i++)
      // {
      //   Serial.printf("%d: ",samples_data[i]);
      // }

      // note: something really didn't work here
      // // debug : print the samples data in a readable format:
      // Serial.println("generated: ");
      // for(uint8_t i = 0; i < 32; i++)
      // {
      //   for(uint16_t j = 0; j < 256; j++)
      //   {
      //     uint8_t c;
      //     uint8_t val = samples_data[j] & (1UL << (31 - i));
      //     if (val == 0)
      //     {
      //       c = 0;
      //     } else
      //     {
      //       c = 1;
      //     }

      //     Serial.printf("%d", c);
      //   }
      //   Serial.printf("\n");
      // }
      // Serial.printf("\n");

      i2s_write(i2s_num, &samples_data, 256 * 4, &bytes_written, portMAX_DELAY);
      //Serial.printf("%d bytes written to the i2s dma buffer.\n", bytes_written);

    }

    // for (uint8_t i = 0; i < dma_buffer_size; i++)
    // {
    //   i2s_write(i2s_num, &(samples_data[0]), sizeof(uint32_t), &bytes_written, portMAX_DELAY);
    // }

    // vTaskDelay(500 / portTICK_PERIOD_MS);

    // for (uint8_t i = 0; i < dma_buffer_size; i++)
    // {
    //   i2s_write(i2s_num, &(samples_data[4]), sizeof(uint32_t), &bytes_written, portMAX_DELAY);
    // }

    // vTaskDelay(500 / portTICK_PERIOD_MS);
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

// I2S is shifting in MSB first
// 32 bit shift register format
// bit format
// [0:7]      [8:15]      [16:23]     [24:31]
// [TG 0:7]   [TR 0:7]    [BG 8:15]   [BR 8:15]

// input index
// [0-7]  Top row (left to right)
// [8-15] Bottom Row
inline uint8_t getLEDindex(const uint8_t input_index, const led_color color)
{
  uint8_t result;
  if (color == green)
  {
    result = input_index % 8 + (input_index >= 8 ? 16 : 0);
  }
  else // (color == red)
  {
    result = input_index % 8 + (input_index >= 8 ? 24 : 8);
  }
  return result;
}