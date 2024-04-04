#!/bin/bash

# Ask the user for the path to start.py
read -p "Please enter the path to start.py (default: /home/pi/urban-sensing-raspi/code/start.py): " start_path

# Use default path if no path provided
if [ -z "$start_path" ]; then
    start_path="/home/pi/urban-sensing-raspi/code/start.py"
fi

# Check if the provided path exists
if [ ! -f "$start_path" ]; then
    echo "Error: The provided path '$start_path' does not exist or is not a file. Please provide a valid path to start.py."
    exit 1
fi

# Create service file
echo "Creating the Wifi monitoring service file..."

echo "[Unit]
Description=urban-sensing-service
After=network.target

[Service]
WorkingDirectory=/home/pi/
ExecStart=/usr/bin/python3 $start_path
User=root
Group=root

[Install]
WantedBy=multi-user.target" | sudo tee /lib/systemd/system/sensing.service

# Set permissions for the service file
sudo chmod 644 /lib/systemd/system/sensing.service

# Reload the systemd daemon
sudo systemctl daemon-reload

# Enable the service to start on boot
sudo systemctl enable sensing.service

# Start the service
sudo systemctl start sensing.service

# Final message to the user
echo "The urban-sensing-service has been set up successfully with the script at: $start_path"
echo "The service is now running. You can check its status with 'sudo systemctl status sensing.service'."
