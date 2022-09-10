# Duet Firmware Update

  * https://docs.duet3d.com/en/User_manual/RepRapFirmware/Updating_firmware
  * https://github.com/Duet3D/RepRapFirmware/tags

There are 3 firmware files.  
In some cases with major releases they can be all bundled together under  
Duet2and3Firmware-[X.X.X].zip

## Main firmware

The main firmware is typically `Duet2CombinedFirmware.bin` for a Duet2Wifi
This is the main one that handles the motion control.

## Web Interface

The web interface is located under `DuetWebControl-SD.zip`  
Both this and the main firmware normally need to be updated.

## Wifi Firmware

The wifi firmware doesn't get updated that often.
Normally it's named `DuetWiFiServer.bin`

To see the version in use use `M122`
