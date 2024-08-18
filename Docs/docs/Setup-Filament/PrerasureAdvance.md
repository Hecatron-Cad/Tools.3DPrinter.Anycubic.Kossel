# Preasure Advance

Pressure advance can help avoid blobs or too much extrusion on corners or around holes.
With a bowden typically it depends on how far the bowden tube is.
Too much can result in under extrusion on some areas.

  * https://docs.duet3d.com/User_manual/Reference/Gcodes#m572-set-or-report-extruder-pressure-advance
  * https://www.reddit.com/r/VoxelabAquila/comments/omw3ny/how_to_avoid_retraction_blob/

Once preasure advance is calibrated, it's worth reviewing the retraction settings
as this can allow for lower retraction settings as a result.

## Calibration

This should allow us to generate some g-code for a calibration test

  * https://ellis3dp.com/Pressure_Linear_Advance_Tool/

Alter the following settings

### Printer

  * Firmware: ReprapFirmware
  * Bed Shape: Round
  * Bed Dia: 240mm
  * Nozzel Diameter: 0.6
  * Extrusion Multiplier: 1.01

### Retraction

  * Retract Distance: 5mm
  * Retract Speed: 60
  * Deretract Speed: 40

### Print Settings

  * Print Speed: 60

### Preasure Advance Setting

  * PA End Value: 1
  * PA Increment: 0.05

### Start / End G-code

  * HotEnd Temp: 220 (match that for the filament)
  * Bed Temp: 60

Start G-Code
```
M140 S[BED_TEMP] ; set bed temp
M190 S[BED_TEMP] ; wait for bed temp
M104 S[HOTEND_TEMP] ; set extruder temp
M109 S[HOTEND_TEMP] ; wait for extruder temp

G21	;metric values
G90	;absolute positioning
G28	;Home
G1	Z15.0 F6000 ;Move to 15mm below endstops
G92	E0	;zero the extruded length
G1	F200 E3	;extrude 3mm of feed stock
G92	E0	;zero the extruded length again
```

End G-Code
```
M400	;Free buffer

G91	;relative positioning
G1	E-1 F300 ;retract the filament a bit before lifting the nozzle, to release some of the pressure
G1	Z+1 E-5 ;move Z up a bit and retract filament even more
G90	;absolute positioning

M104 S0	;extruder heater off
M140 S0	;heated bed heater off
M107	;fan off
G28	;Home
M84	;steppers off
```




## TODO

Need to lower this to at least 0.3 or find a way to calibrate

```
; pressure advance settings
; with a bowden of 520mm this is approx, not fine tuned yet
M572 D0 S0.4
```

Try the above calibration tool website for a test pattern.
