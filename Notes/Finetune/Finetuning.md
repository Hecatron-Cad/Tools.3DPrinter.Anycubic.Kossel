# Fine tuning

  * http://forum.seemecnc.com/viewtopic.php?t=10081
  * Extrusion Multiplier

In order to fine tune the scale of objects we need to potentially change two variables

  * Extrusion Multiplier
  * Delta Arm length

## Calibrate the filament width

First we want to make sure the filament diameter is what we think it is

  * measure the filament around 10 times for the width
  * then take the average and put this into the slicer settings
  * for black pla = 1.73mm

## Print test stage 1

Print the Single-Wall_Box, measure the thickness near the top, near the middle across

  * checks out at 0.4mm

## Print test stage 2

use the print settings

  * cura normal profile
  * select skirt
  * initial layer height 0.1mm
  * layer height 0.1mm
  * infill 15%
  * speed 20mm/s

Nxt print both the small 50mm Box and the large 100mm box

## Calibrate Arm length

TODO

Scaling error = average measured width / what the width should be.

Scaling error same with both pieces: Arm length needs to be adjusted.
Scaling error changes between both pieces: Extrusion multiplier needs to be adjusted.
