# Retraction Calibration

Two stage, first temp tower, then a retraction tower

https://www.reddit.com/r/3Dprinting/comments/3jxp8l/bowden_retraction_speed/
https://www.youtube.com/watch?v=6LjbCIGCmd0

## Temperature tower

The temperature tower will indicate which temperature is best for retraction.  
It will also show different surface finishes based on the different temperature range.

First we need to add a temperature tower.  

  * Under Extensions -> Parts for Calibration -> Add PLA+ Temperature Tower

Next we need to add a post processing script.  

  * Under Extensions -> Post Processing -> Modify G-Code  
  * Add Script -> TempFanTower

Set the starting temperature to match the first one on the tower at the bottom (230 for PLA+)  
The Change layer will vary based on the layer height setting. Typically 41 for 0.2mm layer height

  * Draft Profile - 0.2mm layer height
  * initial layer height: 0.2mm

  * Starting Temperature: 230
  * Temperature Increment: -5
  * Change Layer: 41
  * Change Layer Offset: 5

Look for as hot as possible, but also as flat as possible without blobbing

## Retraction tower

The retraction tower is something we use after we've figured out which temperature to use.  
It's the distance and speed to pull the filament back when moving between sections to avoid blobbing. Too much retraction can result in jams in the print head.

  * https://www.youtube.com/watch?v=6LjbCIGCmd0

First we need to add a retraction tower.  

  * Under Extensions -> Parts for Calibration -> Add a retract tower

Next we need to add a post processing script. 

  * Under Extensions -> Post Processing -> Modify G-Code  
  * Add Script -> Retract Tower

Use the following settings

  * Draft Profile - 0.2mm layer height
  * initial layer height: 0.2mm

### Retraction Distance

  * Mode: Distance
  * Starting value: 1
  * Value Increment: 1
  * Change Layer: 38
  * Change Layer Offset: 4

For the distance mode ideally we want the minimum amount of retraction that results in no stringing.
More retraction can result in voids and longer printing times.

### Retraction Speed

Typically, for the retraction speed we want the fastest as possible as this will affect the print time.  
The typical range is 30 to 100 with the average being around 45.
Too fast a retraction however can cause problems with the filament breaking.

  * Mode: Speed
  * Starting value: 40
  * Value Increment: 5
  * Change Layer: 38
  * Change Layer Offset: 4

### Eryone3d PLA+

For the Temperature tower 205 seems the best for overhangs, however 220 seems better for bed adhesian.  
So for now I'm going with 220.

With Eryone3d PLA+ according to the retraction tower string stops at around 4mm.  
However, this seems to result in a bit of blobbyness when doing a lot of infill.  
So I've upped it to 6mm which seems to have fixed that.

For the speed the average of 45 seems to be fine.  
Although 60 could be possible.
