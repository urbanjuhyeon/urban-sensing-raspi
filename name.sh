#!/bin/bash

# Description to provide context about the sensor name
echo "The sensor name is used in one of the columns of the wifi packet collection."
echo "This helps identify the data source when multiple sensors are used in a data-gathering experiment."

# Ask the user if they want to change the sensor name
read -p "Do you want to change the sensor name? [Y/n]: " change_sensor

# If the user answers 'Y' or 'y', prompt for the new sensor name
if [[ $change_sensor == 'Y' || $change_sensor == 'y' ]]; then
  read -p "Enter the new sensor name: " SENSOR_NAME
else
  SENSOR_NAME="raspberrypi"
fi

# Save the SENSOR_NAME to a configuration file
echo $SENSOR_NAME > /home/pi/urban-sensing-raspi/sensor_name.conf

# Print out the sensor name being used
echo "This sensor name: $SENSOR_NAME"

echo "-----------------------"
echo "-----------------------"
