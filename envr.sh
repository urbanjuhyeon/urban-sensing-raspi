#!/bin/bash

# -------------------------------


# Obtain the MAC address of wlan0
echo "Obtaining the MAC address of wlan0..."
INTERNAL_ADAPTER_MAC=$(cat /sys/class/net/wlan0/address)

# Create a udev rule
echo "Creating a udev rule..."
echo "SUBSYSTEM==\"net\", ACTION==\"add\", ATTR{address}==\"$INTERNAL_ADAPTER_MAC\", NAME=\"wlan0\"" | sudo tee /etc/udev/rules.d/10-local.rules

# Reload udev rules
echo "Reloading udev rules..."
sudo udevadm control --reload-rules && sudo udevadm trigger

# Print a message to indicate the end of this section
echo "End of udev rules setup"

echo "-----------------------"
echo "-----------------------"

# -------------------------------


# -------------------------------

echo "Creating necessary directories..."
sudo mkdir /home/pi/data
sudo mkdir /home/pi/stats
sudo mkdir /home/pi/urban-sensing-raspi
sudo mkdir /home/pi/urban-sensing-raspi/code

echo "Setting permissions for the directories..."
sudo chmod 777 /home/pi/data
sudo chmod 777 /home/pi/stats
sudo chmod 777 /home/pi/urban-sensing-raspi
sudo chmod 777 /home/pi/urban-sensing-raspi/code

# -------------------------------

