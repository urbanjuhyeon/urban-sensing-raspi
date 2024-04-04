#!/bin/bash

# Update system packages
echo "Updating system packages..."
sudo apt-get update -y
sudo apt-get upgrade -y

# Install Python3 and Pip3
echo "Installing Python3 and Pip3..."
sudo apt-get install python3 python3-pip -y

# Error checking
if [ $? -ne 0 ]; then
    echo "Failed to install Python3 and Pip3."
    exit 1
fi

# Install libpcap
echo "Installing libpcap..."
sudo apt-get install libpcap0.8 -y
sudo apt-get install libpcap-dev -y

# Error checking
if [ $? -ne 0 ]; then
    echo "Failed to install libpcap."
    exit 1
fi

# Install necessary Python packages
echo "Installing necessary Python packages..."
pip3 install pcapy dpkt

# Error checking
if [ $? -ne 0 ]; then
    echo "Failed to install Python packages."
    exit 1
fi

# Install Git and ntpdate
echo "Installing Git and ntpdate..."
sudo apt-get install git -y
sudo apt-get install ntpdate -y

# Error checking
if [ $? -ne 0 ]; then
    echo "Failed to install Git and ntpdate."
    exit 1
fi

# Install Bluetooth library
echo "Installing Bluetooth library..."
sudo apt-get install libbluetooth-dev -y

# Error checking
if [ $? -ne 0 ]; then
    echo "Failed to install Bluetooth library."
    exit 1
fi

# Check if Bluelog directory already exists
if [ ! -d "/home/pi/Bluelog" ]; then
  # Clone Bluelog from GitHub
  echo "Cloning Bluelog from GitHub..."
  cd /home/pi
  git clone https://github.com/jhyeonpark/Bluelog.git

  # Change into the Bluelog directory
  cd Bluelog

  # Build Bluelog from source
  echo "Building Bluelog from source..."
  make
  sudo make install

  # Error checking
  if [ $? -ne 0 ]; then
      echo "Failed to build and install Bluelog."
      exit 1
  fi

  # Return to the original directory
  cd ..
else
  echo "Bluelog already exists. Skipping Bluelog installation..."
fi

# Error checking
if [ $? -ne 0 ]; then
    echo "Failed to install the Bluelog."
    exit 1
fi


# End
echo "All installations completed successfully!"
exit 0
