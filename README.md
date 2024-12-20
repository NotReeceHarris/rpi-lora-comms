# rpi-lora-encrypted-comms

Secure, long-range communication system using Raspberry Pi with encrypted radio transmission.

## Hardware Requirements

This project requires the following hardware for each node:

- **LoRa HAT:** [SX1268 LoRa HAT for Raspberry Pi (433MHz)](https://thepihut.com/products/sx1268-lora-hat-for-raspberry-pi-433mhz)
- **Raspberry Pi:** [Raspberry Pi Zero 2 W (With headers)](https://thepihut.com/products/raspberry-pi-zero-2?variant=43855634497731)

**Note:** You will need two sets of this hardware to create a basic point-to-point communication system.

## What is LoRa?

LoRa (Long Range) is a wireless modulation technique based on Chirp Spread Spectrum (CSS) technology, which uses chirp pulses to encode information on radio waves, similar to how dolphins and bats communicate. This technology:

- Offers **robustness** against disturbances, allowing for reliable communication over long distances.
- Is perfect for applications transmitting **small data packets** at **low bit rates** with **extended range** compared to technologies like WiFi, Bluetooth, or ZigBee.
- Supports **low power consumption**, making it ideal for battery-powered IoT devices.

LoRa operates on license-free sub-GHz ISM bands like:
- 915 MHz (North America)
- 868 MHz (Europe)
- 433 MHz (Asia)

It can also operate on 2.4 GHz for higher data rates but at the expense of range.

![Bandwidth vs. Range](assets/bandwidth-vs-range.png)
