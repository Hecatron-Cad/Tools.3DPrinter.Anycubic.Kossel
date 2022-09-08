; homedelta.g
; called to home all towers on a delta printer

; relative positioning
G91

; First pass homing - move all towers to the high end stopping at the endstops
G1 H1 X400 Y400 Z400 F1800

; Go down a few mm
G1 H2 X-5 Y-5 Z-5 F200

; Second pass homing - move each tower up at slower rate
G1 H1 X10 Y10 Z10 F200

; move down a few mm so that the nozzle can be centred
G1 Z-5 F2400

; absolute positioning
G90

; move X+Y to the centre
G1 X0 Y0 F2400
