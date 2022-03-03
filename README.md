# Waaave_Pool Eurorack CV Interface Module
The Waaave_Pool Eurorack CV Interface Module is a Eurorack module that allows you to use control voltage from a Eurorack modular synthesizer to modulate any of the 16 continuous parameters of the Waaave_Pool video synthesis system. Use CV from LFOs, sequencers, envelopes, S+H, and more to animate your video feedback. Used in conjuction with a conventional Eurorack synth patch, you can achieve nuanced syncing between your audio and video for a cohesive audiovisual performance. Due to the framebuffer based implementation of Waaave_Pool, the best visual results are using CV that changes at a speed lower than the framerate of the system.

## Revision B.
This version of the module connects directly to the GPIO pins of the Raspberry Pi 3B+ running Waaave_Pool. A limited run of these modules was produced and sold in August 2020. This version is intended to be used with LZX compatible eurorack modules and complies with the [LZX Patchable Video Standard](https://community.lzxindustries.net/t/the-lzx-patchable-video-standard/842) for "Animation Speed" CV (<30Hz), whereas +/-1V corresponds to +/-100% of the parameters range.
### Features
- 16 CV inputs expecting +/-1V (+/-12V tolerant)
- Bipolar attenuator aka attenuverter (-n to n) on each input
- Positive and Negative clipping for voltages outside the expected range
### Usage
All of the files required to build your own are included. You can upload the zipped gerber files to your PCB manufacturer of choice (JLCPCB has been used successfully in the past). Ordering an SMT stencil with the board is highly recommended due to the large quantity of SMD components. 

The KiCAD project files are also included, open the .pro file with KiCAD to view the project.

[Mouser Project Link](https://www.mouser.com/ProjectManager/ProjectDetail.aspx?AccessID=e002599eb7) for easy parts ordering. Don't forget the knobs and jacks from [Thonk](thonk.co.uk)!

The included front panel gerber files can be used to order an FR-4 front panel at the same time as the PCBs. You may get a follow up email from the PCB manufacturer since they assume that a PCB with no copper traces is probably unintentional.

To use the module with Waaave_Pool, you will need a 40-Pin IDC ribbon cable to connect betweent the header at the bottom of the module and the GPIO header of the Raspberry Pi. You will also need to be running a CV-compatible firmware version, which can be found all the way at the bottom of the [VSERPI Hardware and Images page](https://andreijaycreativecoding.com/VSERPI-hardware-and-images).

## Revision C. (WIP)
This version of the module incorporates an ESP32 microcontroller to handle the analog to digital conversion, and trasmits the information using [OSC](https://ccrma.stanford.edu/groups/osc/index.html) to Waaave_Pool over Ethernet and/or Wi-Fi. This version is intended to work with +/-5V control voltage, allowing for a much wider range of compatible CV sources from the Eurorack world, beyond just LZX. Due to the inherent flexibility of OSC, this module could also be used to send CV information to something other than Waaave_Pool, such as an application running on your computer. Development is still ongoing.
