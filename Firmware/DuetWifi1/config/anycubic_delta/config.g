; Configuration file for Duet WiFi (firmware version 3.xx)
; executed by the firmware on start-up


; ******** General ********
G21                                                  ; Work in millimetres
G90                                                  ; Send absolute coordinates...
M83                                                  ; ...but relative extruder moves

; Enable Panel Due
M575 P1 S1 B57600

; Some of these values are overridden by calibration in config-override.g
; delta radius, diagonal rod length, printable radius and homed height
M665 L271.500:271.500:271.500 R134.244 H291.436 B116.0 X0.517 Y-0.403 Z0.000 
; endstop offsets
M666 X0.111 Y-0.618 Z0.507 A-0.05 B0.36 


; Calibration for MCU temperature
M912 P0 S-8


; ******** Network ********
M550 P"Anycubic1"                                    ; Set machine name
M552 S1                                              ; Enable network
M586 P0 S1                                           ; Enable HTTP
M586 P1 S0                                           ; Disable FTP
M586 P2 S0                                           ; Disable Telnet

; **** Testing / Debugging ****
; M17 X Y Z E0	; Activate Axis
; G92 X0 Y0 Z0	; Set G92 Axis
; G91			; Realtive movement
; G1 H2 X1 F200	; Individual motor move


; ******** Drives ********
M569 P0 S1                                           ; physical drive 0 goes forwards
M569 P1 S1                                           ; physical drive 1 goes forwards
M569 P2 S1                                           ; physical drive 2 goes forwards
M569 P3 S1                                           ; physical drive 3 goes forwards
M584 X0 Y1 Z2 E3                                     ; set drive mapping
M350 X16 Y16 Z16 E16 I1                              ; Configure microstepping with interpolation
M92 X80.3 Y80.3 Z80.3                                ; Set steps per mm for axis, originally this was 80, but tweaked it to 80.3 using a dti over 10mm
M906 X1000 Y1000 Z1000 E1000 I30                     ; Set motor currents (mA) and increase idle current to 30%
M84 S30                                              ; Set idle timeout

; Set steps per mm for extruder todo move to macro
; M92 E98.6 ; PLA
; M92 E104 ; Blue PETG
M92 E105 ; Red PETG

; ******** Drive Speeds ********

; original
;M566 X300 Y300 Z300 E300                             ; Set maximum instantaneous speed changes (mm/min) / Jerk values
;M203 X6000 Y6000 Z6000 E1000                         ; Set maximum speeds 12000 (mm/min) / 200 (mm/sec)
;M201 X2000 Y2000 Z2000 E2000                         ; Set accelerations (mm/s^2)

; testing
; M203 X300 Y300 Z300 E300                             ; Set maximum speeds (mm/min) - for testing

; fast todo
M566 X1200.00 Y1200.00 Z1200.00 E1200.00           ; set maximum instantaneous speed changes (mm/min)
M203 X18000.00 Y18000.00 Z18000.00 E18000.00        ; set maximum speeds (mm/min)
M201 X1000.00 Y1000.00 Z1000.00 E1000.00           ; set accelerations (mm/s^2)


; ******** Axis ********
; Axis Limits
M208 Z-1 S1                                          ; Set minimum Z
; Endstops
M574 X2 S1 P"xstop"                                  ; configure active-high endstop for high end on X via pin xstop
M574 Y2 S1 P"ystop"                                  ; configure active-high endstop for high end on Y via pin ystop
M574 Z2 S1 P"zstop"                                  ; configure active-high endstop for high end on Z via pin zstop


; ******** Z Probe ********
; Probe v1 (broken) = 16.2, (good) = 19.0 (inverted)
; Probe v2 (good)   = 16.695

; Probe V1
; M558 P5 C"e0stop" R0.4 H3 F300 T3000 I1            ; Use E0 end stop for probe
; G31 P100 H0 X0 Y0 Z16.2                            ; Set Z probe trigger value, offset and trigger height

; Probe V2
M558 P5 C"e0stop" R0.4 H10 F150 T1000 A10             ; Use E0 end stop for probe
;G31 P1000 H0 X0 Y0 Z16.852                            ; Set Z probe trigger value, offset and trigger height

; Probe - Tweaked for silicon sock on extruder
; Reduce Z to increase the spacing, increase Z to reduce the spacing 
G31 P1000 H0 X0 Y0 Z17.05

; Define mesh grid
M557 R110 S20


; ******** Heaters ********
M308 S0 P"bed_temp" Y"thermistor" T100000 B4267 C0   ; define bed temperature sensor
M950 H0 C"bed_heat" T0                               ; heater 0 uses the bed_heat pin, sensor 0
M307 H0 B0 S1.00                                     ; disable bang-bang mode for heater and set PWM limit
M140 H0                                              ; the bed heater is heater 0
M143 H0 S120                                         ; Set temperature limit for heater 0 to 120C

M308 S1 P"e0_temp" Y"thermistor" T100000 B4267 C0    ; define E0 temperature sensor
M950 H1 C"e0_heat" T1                                ; heater 1 uses the e0_heat pin and sensor 1
M307 H1 B0 S1.00                                     ; disable bang-bang mode for heater and set PWM limit
M143 H1 S275                                         ; Set temperature limit for heater 1 to 275C

; Heater Timeout
M570 S180                                            ; Hot end may be a little slow to heat up so allow it 180 seconds


; ******** Fans ********
; Used to cool the part
; 31Hz seems to generate less buzz during pwm
; Full on after 60 degrees
M950 F0 C"fan0" Q31                                  ; create fan 0 on pin fan0 and set its frequency
M106 P0 S0 H-1 B1                                    ; set fan 0 value.
; Used to cool the hotend
M950 F1 C"fan2" Q31                                  ; create fan 1 on pin fan1 and set its frequency
M106 P1 S0 H1 L1 T60                                 ; set fan 1 value. Thermostatic mode for heater 1


; ******** Tools ********
M563 P0 D0 H1 F0                                     ; Define tool 0
G10 P0 X0 Y0 Z0                                      ; Set tool 0 axis offsets
G10 P0 R0 S0                                         ; Set initial tool 0 active and standby temperatures to 0C


; ******** Miscellaneous ********
; M575 P1 S1 B57600                                  ; enable support for PanelDue
; Automatic power saving
M911 S10 R11 P"M913 X0 Y0 G91 M83 G1 Z3 E-5 F1000"   ; Set voltage thresholds and actions to run on power loss
; Alter scale on axis
; asked for distance / actual distance = correction factor
;M579 X1.006 Y1.0 Z1.0
M579 X1.0 Y1.0 Z1.0
; Select first tool
T0

; Load settings from config-overide.g, typically those auto calibrated
M501

; Self Set Baby Stepping for Z offset
M290 R0 S0.14

; Note with my current bed a ultrabase within config-override after a auto calibration / M500 save
; the delta height should be around
; M665 H290.110

; Load G29 bed leveling file
; TODO
;G29 S1

; Disable Mesh compensation
; G29 S2
