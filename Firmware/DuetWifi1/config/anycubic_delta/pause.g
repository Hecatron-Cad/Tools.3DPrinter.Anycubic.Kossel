; Pause macro file
; called when a print from SD card is paused

M83                     ; relative extruder positioning
G1 E-3 F2500            ; retract 3mm of filament
G91                     ; relative positioning
G1 Z20 F360             ; lift Z by 20mm
G90                     ; absolute positioning
G1 X0 Y0 F5000          ; move head out of the way of the print
