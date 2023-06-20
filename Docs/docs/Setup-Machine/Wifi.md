# Wifi

## Wifi Enable / Disable

```sh
# Check status of wifi
M552
# Stop wifi
M552 S0
# Start wifi
M552 S1
```

## Setup of station / Password

```sh
# List all stations added
M587

# Add Access point with IP Address
M587 S"your-network-name" P"password" I192.168.1.1

# Remove Access point
M588 S"Network-ssid-123"
M588 S"*"
```

## Network Scanning

```sh
# Start a network scan
M587.1
# Return results of network scan
M587.2
```
