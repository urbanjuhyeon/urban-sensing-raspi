# 📡 Urban Sensing Service

Transform your Raspberry Pi into an advanced urban sensor using the scripts and code available in this repository. Below is the structure of the repository:

```bash
.
├── service.sh
├── environment.sh
├── name.sh
├── packages.sh
├── code
│   ├── default
│   │   └── start.py
│   └── ... (additional operations can be added as needed)
└── README.md
```


## 🛠️ Setup Scripts

### `packages.sh`

Automates the setup process, handling everything from system updates to specific software installations. To execute:

```bash
sudo bash packages.sh
```

### `environment.sh`

Configures necessary udev rules and preps the Raspberry Pi's wlan environment. To execute:

```bash
sudo bash environment.sh
```


### `name.sh`

Allows users to set or confirm the sensor name, helping differentiate data from multiple sensors. To execute:

```bash
sudo bash name.sh
```

### `service.sh`

This script ensures the urban sensing service starts upon boot. To execute:

```bash
sudo bash service.sh
```

## 🚀 Urban Sensing Code

The default `start.py` script found in the 'code/default' directory powers the Urban Sensing Service. Key functionalities include:

- System time synchronization with an NTP server and timezone set to Asia/Seoul.
- Power optimization by disabling non-essential hardware components.
- WiFi monitoring across multiple channels using external WiFi adapters.
- Continuous WiFi packet data collection, parsing, and storage.

While this script typically runs as a systemd service on boot, you can manually initiate it:

```bash
sudo python3 start.py
```

### Basic Configuration Options

#### Default
Focuses solely on WiFi packet collection. This mode excludes additional tasks like Bluetooth sensing, raw WiFi packet storage, or camera scene recording.

#### -b Option
Enables Bluetooth sensing for urban data collection using Bluelog.

#### -i Option
Introduces a column in the data output to store raw WiFi packets.

### Example 
If you wish to enable Bluetooth sensing without storing the raw WiFi packets, use the following command:

```bash
sudo python3 start.py -b
```