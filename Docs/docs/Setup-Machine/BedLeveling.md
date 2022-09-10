# Bed Levelling

Make sure the nozzel is clean

First run the Delta calibration
this should include the bed mesh measurement

Set the Babysteps to +1mm
Set Z to 0.05mm or whatever feeler gague is being used
Put the feeler gague underneath the nozzel (normally I use a 0.05mm one)

Move the babysteps down swiping the feeler gauge underneath until there's some resistance.

To make the babystep value permentant
add the value to config.g via M290
```
M290 R0 S-0.24
```
