# Calibrating ESteps and Flow amount.

There are two ways to calibrate the amount of flow from the extruder.  
More flow equals thicker oversized walls, less flow equals thinner undersized walls.


## Calibrating E Steps

The first step is to calibrate the number of steps on the extruder motor based on the amount of filament fed in.  
This should remain consistent between different filaments so should only need to be done once for the printer in the config.

  * First feed some new filament into the extruder motor at the top.
  * Run `M302 P1` to enable cold extrusion.
  * Mark the filament at the entry.
  * Make another mark 200mm further up.
  * Extrude 200mm via the the Panel Duet.
  * Check to see if it's gone past or not far enough in relation to the first point.
  * Turn off cold extrusion with `M302 P0`

The setting to alter for the duet board is `M92 E95.0` in terms of steps per mm


## Calibrating Flow amount

The flow percentage (in cura) is a muliplier used to control how much flow out of the extruder.
Typically, this is a percentage setting in the slicer and varies between different filaments.

  * https://www.youtube.com/watch?v=xzQjtWhg9VE
  * https://3dprintbeginner.com/flow-rate-calibration/

Import a 30mm test cube into Cura with the following settings.
(this is based on a 0.35mm nozzel)

  * Starting Profile: Draft
  * Build Plate: skirt
  * Layer Height: 0.2mm
  * Infill Density: 0%
  * Top Layers: 0
  * Wall thickness 0.7mm (double the size of the nozzel)
  * Support: Off

This should generate a hollow cube with 2 layers on the walls.  
Take 2 measurements on each wall of the cube.
Add them all up then divide by 8
We're aiming for 2 x the nozzel thickness (2 x 0.35 = 0.7mm)


### Eryone3d PLA+

To calculate the flow rate

  * https://eryone3d.com/products/pla#:~:text=Heated%20Bed%20Temperature%3A%2055%2D70%C2%B0C

^ Side ^ Measured ^
| Side1 | 0.76 |
| Side1 | 0.76 |
| Side2 | 0.75 |
| Side2 | 0.75 |
| Side3 | 0.75 |
| Side3 | 0.75 |
| Side4 | 0.74 |
| Side4 | 0.74 |

  * sum the above then divide by 8  
  * Average = 0.75

  * (Desired thickness / measured thickness) x 100
  * (0.7 / 0.75) x 100 = 93.333

  * The calculated flow rate is now around **93%**
  * Its best to round down instead of up
  * For something like terrain use 93%
  * For something like tiny moves / details / miniatures take around 4% off to 89%


## Duet per Filament settings

It's possible to define per filament setting within the duet config.

  * https://duet3d.dozuki.com/Wiki/Filaments

There are 3 files setup per filament, load, unload, config.  
The load and unload are called when the filament is loaded / unloaded into the machine.  
Normally they're used for removing / putting filament in.

The filament/config.g for the selected filament is used when `M703` is called.  
The best place to put this command is within `tpost0.g`
