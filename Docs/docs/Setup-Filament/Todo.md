# TODO

See the comment regards linear preasure advance vs SCurve acceleration

https://www.youtube.com/watch?v=ybTbuUBy2-s


```
Nice video. There is one point that's missing in my opinion: Linear Preasure Advance vs. s-Curve Acceleration. Sadly you can not use both at the same time. Linear Preasure Advance compensates for the delay between changes in feeder movement and reaction of the hotend, improving print quality (sharper edges). The correction you need is much higher on bowden setups, so it is much more needed there, while on direct drive the effect is much less. As you have to calibrate each type of filament anyway, Linear Preasure Advance is not very comfortable to use - so with a direct extruder you can get still good results without spending time for adjusting it.

s-Curve Accelaration smooths out the acceleration, which reduces ringing esp. on heavy y-moving printbeds. So with printers beyond 200by200 mm² size it is a very nice feature to activate.

So on printers with y-moving bed ("bedshakers") it is more interesting to use s-Curve Acceleration than using Linear Preasure Advance, if you use a direct drive. If you also want a very flat bed (thick milled casted aluminium) this also aplys to smaler printers. So on bedshaker-design you should always consider direct drive. A bowden setup is senseless (exept for very smal printers).

With Deltas and z-moving bed (or z-moving x-y-gantry) a bowden setup is much more interesting vs. classic direct extruders, as the low moving mass is much more important (and there is no need for sCurve). Of course, with modern extruders like the Orbiter you can use the advantages of a direct extruder, ( I am quite happy you pointed that out in your video), while increasing weight only a bit. You might use a little less speed there - but for printing time over all, this might be already mostly be compensated by the less retraction you need. Anyway, with the most limiting factor in printspeed on this types of printers for PLA being the part cooling, the little mass added by an orbiter might not be relevant at all...

In my opinion Creality mostly use bowden extruders to use single z, to reduce the cost. Which is O.K. fo make it more affordable, but as you can upgrade to dual-z for about $15 it is the one upgrade I recommend strongly before changeing to a direct extruder.

P.S.: I do not totaly comply with the definitions of the parts. "Extruder" by definition is the complete unit that extrudes the filament, beginning with the feeder, through the bowden tube (on a bowden extruder or inside some of the direct extruders) and the hotend. So it starts at entry of the feeder and ends at the nozzle. I prefer using this definition, as while  "extruder" in 3d printing often is used as synonym to the feeder, this is not the case in other technics like injection molding. So it avoids confusion if you use "Extruder" for the whole (like "Bowden Extruder" and "Direct Extruder"), but feeder, bowden and hotend if you refer to the single parts. So in my opinion "Bondtech BMG extruder" is not an extruder, but a "Bondtech BMG feeder", as it is not the whole extruder but only a part of it.
It can become very confusing, if you sometimes the word "extruder" for the whole, but sometimes only for one part. I struggled a lot with this as I got into 3d printing...
```
