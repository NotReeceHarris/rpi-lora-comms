# ![rpi-lora-encrypted-comms](documentation/banner-v1.0.png)

<ins> Encrypted Long-Range Radio Communication </ins>, Powered by [Raspberry Pi](https://en.wikipedia.org/wiki/Raspberry_Pi) and the LoRa protocol, this project enables secure, offline communication between two nodes using various encryption algorithms, security techniques, and the [LoRa radio protocol](https://en.wikipedia.org/wiki/LoRa). Access the secure web interface via local-nework when connected to the Raspberry Pi's personal hotspot. This setup ensures data privacy and integrity over long distances, making it ideal for scenarios requiring private communication without traditional internet infrastructure.

## Hardware Requirements

To implement this project, each node should have the following hardware. While you can adapt this concept to suit other devices, here's the most cost-effective and widely supported setup:

- **Raspberry Pi:** [Raspberry Pi Zero 2 W (With headers)](https://thepihut.com/products/raspberry-pi-zero-2?variant=43855634497731)
- **LoRa HAT:** [SX1268 LoRa HAT for Raspberry Pi (433MHz)](https://thepihut.com/products/sx1268-lora-hat-for-raspberry-pi-433mhz)

**Note:** For a basic point-to-point communication system, you'll need two of each item listed above.

## Documentation

- **Raspberry PI:** [Setting up your own node](documentation/setup.md).
- **LoRa Protocol:** [What is the LoRa protocol](documentation/lora.md).
- **Security Conciderations:** [How secure is this, what are the potential vulnerabilities?](documentation/security.md)

**Write up:** If your intreseted in my journey creating this project [please read my blog post](https://reeceharris.net/blog/creating-a-secure-radio-communication-system/). *(Beware alot of content)*

<!--

## Prerequisites

- Docker: Ensure Docker is installed on your system. You can download it from Docker's official website.
- Docker Compose Plugin: Make sure you have the Docker Compose plugin installed. If you're using a recent version of Docker Desktop, it should be included. Otherwise, follow these instructions for installation.

## Installation

```bash
git clone https://github.com/NotReeceHarris/rpi-lora-encrypted-comms.git
cd rpi-lora-encrypted-comms
docker compose up --build -d
```
I aim to provide pre-configured ISO images for the Raspberry Pi Zero 2 W in the future to simplify deployment on this specific hardware.

### Additional Tips

```bash
# Building with No Cache: If you encounter issues or want to force a complete rebuild
docker compose build --no-cache

# Running in Detached Mode: To run the containers in the background
docker compose up --build -d

# Stopping the Containers: To stop the running containers
docker compose down
```

## Documentation

- [SX1268 433M LoRa HAT](https://www.waveshare.com/wiki/SX1268_433M_LoRa_HAT)
- [Docker Compose](https://docs.docker.com/engine/install/debian/)


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

![Bandwidth vs. Range](assets/500px-SX1268-433M-LoRa-HAT-103.jpg)

-->
