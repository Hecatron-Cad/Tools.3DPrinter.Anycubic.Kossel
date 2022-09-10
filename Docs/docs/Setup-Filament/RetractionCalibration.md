# Retraction Calibration

Two stage, first temp tower, then a retraction tower

https://www.youtube.com/watch?v=6LjbCIGCmd0

## Temperature tower

First we need to add a temperature tower.  

  * Under Extensions -> Parts for Calibration -> Add PLA+ Temperature Tower

Next we need to add a post processing script.  

  * Under Extensions -> Post Processing -> Modify G-Code  
  * Add Script -> TempFanTower

  * Set the starting temperature to match the first one on the tower at the bottom (230 for PLA+)
  * The Change layer will vary based on the layer height setting. Typically 41 for 0.2mm layer height

  * Draft Profile - 0.2mm layer height
  * Starting Temperature: 230
  * Temperature Increment: -5
  * Change Layer: 42mm
  * Change Layer Offset: 0mm


## Retraction tower

TODO
