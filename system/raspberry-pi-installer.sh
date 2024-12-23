#!/usr/bin/env bash

echo " "
echo " "
echo "$(tput setaf 2)  .~~.   .~~.$(tput sgr0)                       $(tput setaf 21) ___________  $(tput sgr0)"
echo "$(tput setaf 2) '. \ ' ' / .'$(tput sgr0)                  _  $(tput setaf 21) /  _______  \\$(tput sgr0)_____"
echo "$(tput setaf 1)   .~ .~~~..~. $(tput sgr0)                | |   $(tput setaf 21) / _____ \\$(tput sgr0) |  __ \\"
echo "$(tput setaf 1)  : .~.'~'.~. :$(tput sgr0)        _       | |    $(tput setaf 21) \`$(tput sgr0) ___ $(tput setaf 21)\`$(tput sgr0)  | |__) |   __ _ TM "
echo "$(tput setaf 1) ~ (   ) (   ) ~ $(tput sgr0)    _| |_     | |      / _ \   |  _  /   / _\` |"
echo "$(tput setaf 1)( : '~'.~.'~' : )$(tput sgr0)   |_   _|    | |___  | (_) |  | | \ \  | (_| |"
echo "$(tput setaf 1) ~ .~ (   ) ~. ~$(tput sgr0)      |_|      |_____|  \___/   |_|  \_\  \__,_|"
echo "$(tput setaf 1)  (  : '~' :  ) $(tput sgr0)                     $(tput setaf 21)  ,_____, $(tput sgr0)"
echo "$(tput setaf 1)   '~ .~~~. ~'$(tput sgr0)                        $(tput setaf 21)\_______/  $(tput sgr0)"
echo "$(tput setaf 1)       '~'  $(tput sgr0)                        $(tput setaf 21)\___________/$(tput sgr0)"
echo " "
echo " "

# Check if the script is running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

# Check if the script is running on a Raspberry Pi
if ! grep -q "Raspberry Pi" /proc/device-tree/model; then
    echo "This script is intended to be run on a Raspberry Pi"
    exit 1
fi

# Check this script is running on debian
if ! grep -q "ID=debian" /etc/os-release; then
    echo "This installation script is intended for Debian-based systems only."
    exit 1
fi

echo "Do you understand that installing this software will modify your system's options and should only be done on a fresh system image? (Y/N)"
read answer

case $answer in
    [yY]|[yY][eE][sS])
        echo "Proceeding with installation..."
        ;;
    [nN]|[nN][oO])
        echo "Try installing manually or use a pre-generated image."
        exit 1
        ;;
    *)
        echo "Please answer with 'y' for yes or 'n' for no."
        exit 1
        ;;
esac

# Install docker, docker-compose, git, and python3
echo "Installing Docker and Docker Compose..."

for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done

sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin git python3 -y

# Enable and start docker

sudo systemctl enable docker
sudo systemctl start docker

# Clone the repository
echo "Cloning the repository..."
git clone https://github.com/NotReeceHarris/rpi-lora-comms.git 

# Change directory to the cloned repository
cd rpi-lora-comms

# Build the docker image
echo "Building the docker image..."

COMPOSE_PROJECT_NAME=rpi-lora-comms
docker compose up --build -d 

# Set up Docker Compose to start on system startup
echo "Setting up Docker Compose to start on system boot..."

# Define variables
SERVICE_NAME="rpi-lora-comms"
SERVICE_FILE="/etc/systemd/system/${SERVICE_NAME}.service"
WORKING_DIR="$(pwd)"  # Current working directory where docker-compose.yml is

# Create the systemd service file
cat << EOF > $SERVICE_FILE
[Unit]
Description=Run RPi LoRa Communications Docker Compose
After=network-online.target docker.service
Wants=network-online.target docker.service

[Service]
Type=oneshot
ExecStart=/usr/bin/docker compose up -d
ExecStop=/usr/bin/docker compose down
RemainAfterExit=yes
WorkingDirectory=$WORKING_DIR

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd to recognize the new service
systemctl daemon-reload

# Enable the service to start at boot
systemctl enable $SERVICE_NAME.service

# Start the service now
systemctl start $SERVICE_NAME.service

# Check the status
systemctl status $SERVICE_NAME.service

echo "Docker Compose setup for $SERVICE_NAME has been completed. The service will start on system boot."