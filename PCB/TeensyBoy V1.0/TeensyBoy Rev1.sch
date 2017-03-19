<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="8.1.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="AS7C34096A">
<packages>
<package name="AS7C34096A">
<smd name="NC" x="0.8" y="0" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="NC0" x="1.6" y="0" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="A0" x="2.4" y="0" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="A1" x="3.2" y="0" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="A2" x="4" y="0" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="A3" x="4.8" y="0" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="A4" x="5.6" y="0" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="CE" x="6.4" y="0" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="I/O1" x="7.2" y="0" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="I/O2" x="8" y="0" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="VCC" x="8.8" y="0" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="GND" x="9.6" y="0" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="I/O3" x="10.4" y="0" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="I/O4" x="11.2" y="0" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="WE" x="12" y="0" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="A5" x="12.8" y="0" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="A6" x="13.6" y="0" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="A7" x="14.4" y="0" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="A8" x="15.2" y="0" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="A9" x="16" y="0" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="NC1" x="16.8" y="0" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="NC2" x="17.6" y="0" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="NC3" x="0.8" y="11.4" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="NC4" x="1.6" y="11.4" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="NC5" x="2.4" y="11.4" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="A18" x="3.2" y="11.4" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="A17" x="4" y="11.4" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="A16" x="4.8" y="11.4" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="A15" x="5.6" y="11.4" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="OE" x="6.4" y="11.4" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="I/O8" x="7.2" y="11.4" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="I/O7" x="8" y="11.4" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="GND0" x="8.8" y="11.4" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="VCC0" x="9.6" y="11.4" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="I/O6" x="10.4" y="11.4" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="I/O5" x="11.2" y="11.4" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="A14" x="12" y="11.4" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="A13" x="12.8" y="11.4" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="A12" x="13.6" y="11.4" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="A11" x="14.4" y="11.4" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="A10" x="15.2" y="11.4" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="NC6" x="16" y="11.4" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="NC7" x="16.8" y="11.4" dx="1" dy="0.42" layer="1" rot="R90"/>
<smd name="NC8" x="17.6" y="11.4" dx="1" dy="0.42" layer="1" rot="R90"/>
<wire x1="0" y1="0.6" x2="0" y2="10.8" width="0.127" layer="21"/>
<wire x1="0" y1="10.8" x2="18.4" y2="10.8" width="0.127" layer="21"/>
<wire x1="18.4" y1="10.8" x2="18.4" y2="0.6" width="0.127" layer="21"/>
<wire x1="18.4" y1="0.6" x2="0" y2="0.6" width="0.127" layer="21"/>
<circle x="0.75" y="1.4" radius="0.316225" width="0.127" layer="21"/>
<text x="4.8" y="5.4" size="1.016" layer="21">AS7C34096A</text>
</package>
</packages>
<symbols>
<symbol name="AS7C34096A">
<pin name="A0" x="-15.24" y="20.32" length="middle"/>
<pin name="A1" x="-15.24" y="17.78" length="middle"/>
<pin name="A2" x="-15.24" y="15.24" length="middle"/>
<pin name="A3" x="-15.24" y="12.7" length="middle"/>
<pin name="A4" x="-15.24" y="10.16" length="middle"/>
<pin name="A5" x="-15.24" y="7.62" length="middle"/>
<pin name="A6" x="-15.24" y="5.08" length="middle"/>
<pin name="A7" x="-15.24" y="2.54" length="middle"/>
<pin name="A8" x="-15.24" y="0" length="middle"/>
<pin name="A9" x="-15.24" y="-2.54" length="middle"/>
<pin name="A10" x="-15.24" y="-5.08" length="middle"/>
<pin name="A11" x="-15.24" y="-7.62" length="middle"/>
<pin name="A12" x="-15.24" y="-10.16" length="middle"/>
<pin name="A13" x="-15.24" y="-12.7" length="middle"/>
<pin name="A14" x="-15.24" y="-15.24" length="middle"/>
<pin name="A15" x="-15.24" y="-17.78" length="middle"/>
<pin name="A16" x="-15.24" y="-20.32" length="middle"/>
<pin name="A17" x="-15.24" y="-22.86" length="middle"/>
<pin name="A18" x="-15.24" y="-25.4" length="middle"/>
<pin name="I/O1" x="20.32" y="20.32" length="middle" rot="R180"/>
<pin name="I/O2" x="20.32" y="17.78" length="middle" rot="R180"/>
<pin name="I/O3" x="20.32" y="15.24" length="middle" rot="R180"/>
<pin name="I/O4" x="20.32" y="12.7" length="middle" rot="R180"/>
<pin name="I/O5" x="20.32" y="10.16" length="middle" rot="R180"/>
<pin name="I/O6" x="20.32" y="7.62" length="middle" rot="R180"/>
<pin name="I/O7" x="20.32" y="5.08" length="middle" rot="R180"/>
<pin name="I/O8" x="20.32" y="2.54" length="middle" rot="R180"/>
<pin name="CE" x="20.32" y="-2.54" length="middle" rot="R180"/>
<pin name="WE" x="20.32" y="-5.08" length="middle" rot="R180"/>
<pin name="OE" x="20.32" y="-7.62" length="middle" rot="R180"/>
<wire x1="-10.16" y1="-27.94" x2="-10.16" y2="22.86" width="0.254" layer="94"/>
<wire x1="-10.16" y1="22.86" x2="15.24" y2="22.86" width="0.254" layer="94"/>
<wire x1="15.24" y1="22.86" x2="15.24" y2="-27.94" width="0.254" layer="94"/>
<wire x1="15.24" y1="-27.94" x2="-10.16" y2="-27.94" width="0.254" layer="94"/>
<text x="2.54" y="-25.4" size="1.27" layer="94">AS7C34096A</text>
<pin name="VCC" x="20.32" y="-15.24" length="middle" rot="R180"/>
<pin name="GND" x="20.32" y="-20.32" length="middle" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="AS7C34096A">
<gates>
<gate name="G$1" symbol="AS7C34096A" x="-2.54" y="2.54"/>
</gates>
<devices>
<device name="" package="AS7C34096A">
<connects>
<connect gate="G$1" pin="A0" pad="A0"/>
<connect gate="G$1" pin="A1" pad="A1"/>
<connect gate="G$1" pin="A10" pad="A10"/>
<connect gate="G$1" pin="A11" pad="A11"/>
<connect gate="G$1" pin="A12" pad="A12"/>
<connect gate="G$1" pin="A13" pad="A13"/>
<connect gate="G$1" pin="A14" pad="A14"/>
<connect gate="G$1" pin="A15" pad="A15"/>
<connect gate="G$1" pin="A16" pad="A16"/>
<connect gate="G$1" pin="A17" pad="A17"/>
<connect gate="G$1" pin="A18" pad="A18"/>
<connect gate="G$1" pin="A2" pad="A2"/>
<connect gate="G$1" pin="A3" pad="A3"/>
<connect gate="G$1" pin="A4" pad="A4"/>
<connect gate="G$1" pin="A5" pad="A5"/>
<connect gate="G$1" pin="A6" pad="A6"/>
<connect gate="G$1" pin="A7" pad="A7"/>
<connect gate="G$1" pin="A8" pad="A8"/>
<connect gate="G$1" pin="A9" pad="A9"/>
<connect gate="G$1" pin="CE" pad="CE"/>
<connect gate="G$1" pin="GND" pad="GND GND0"/>
<connect gate="G$1" pin="I/O1" pad="I/O1"/>
<connect gate="G$1" pin="I/O2" pad="I/O2"/>
<connect gate="G$1" pin="I/O3" pad="I/O3"/>
<connect gate="G$1" pin="I/O4" pad="I/O4"/>
<connect gate="G$1" pin="I/O5" pad="I/O5"/>
<connect gate="G$1" pin="I/O6" pad="I/O6"/>
<connect gate="G$1" pin="I/O7" pad="I/O7"/>
<connect gate="G$1" pin="I/O8" pad="I/O8"/>
<connect gate="G$1" pin="OE" pad="OE"/>
<connect gate="G$1" pin="VCC" pad="VCC VCC0"/>
<connect gate="G$1" pin="WE" pad="WE"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="Teensy-3.6">
<packages>
<package name="TEENSY-3.6_FULL">
<pad name="GND1" x="-7.62" y="7.62" drill="0.9652"/>
<pad name="0" x="-7.62" y="5.08" drill="0.9652"/>
<pad name="1" x="-7.62" y="2.54" drill="0.9652"/>
<pad name="2" x="-7.62" y="0" drill="0.9652"/>
<pad name="3" x="-7.62" y="-2.54" drill="0.9652"/>
<pad name="4" x="-7.62" y="-5.08" drill="0.9652"/>
<pad name="5" x="-7.62" y="-7.62" drill="0.9652"/>
<pad name="6" x="-7.62" y="-10.16" drill="0.9652"/>
<pad name="7" x="-7.62" y="-12.7" drill="0.9652"/>
<pad name="8" x="-7.62" y="-15.24" drill="0.9652"/>
<pad name="9" x="-7.62" y="-17.78" drill="0.9652"/>
<pad name="10" x="-7.62" y="-20.32" drill="0.9652"/>
<pad name="11" x="-7.62" y="-22.86" drill="0.9652"/>
<pad name="12" x="-7.62" y="-25.4" drill="0.9652"/>
<pad name="VBAT" x="-5.08" y="-38.1" drill="0.9652"/>
<pad name="3.3V_2" x="-2.54" y="-38.1" drill="0.9652"/>
<pad name="GND5" x="0" y="-38.1" drill="0.9652"/>
<pad name="PROGRAM" x="2.54" y="-38.1" drill="0.9652"/>
<pad name="RESET" x="5.08" y="-38.1" drill="0.9652"/>
<pad name="13" x="7.62" y="-25.4" drill="0.9652"/>
<pad name="14" x="7.62" y="-22.86" drill="0.9652"/>
<pad name="15" x="7.62" y="-20.32" drill="0.9652"/>
<pad name="16" x="7.62" y="-17.78" drill="0.9652"/>
<pad name="17" x="7.62" y="-15.24" drill="0.9652"/>
<pad name="18" x="7.62" y="-12.7" drill="0.9652"/>
<pad name="19" x="7.62" y="-10.16" drill="0.9652"/>
<pad name="20" x="7.62" y="-7.62" drill="0.9652"/>
<pad name="21" x="7.62" y="-5.08" drill="0.9652"/>
<pad name="22" x="7.62" y="-2.54" drill="0.9652"/>
<pad name="23" x="7.62" y="0" drill="0.9652"/>
<pad name="3V3_MAX_250" x="7.62" y="2.54" drill="0.9652"/>
<pad name="AGND" x="7.62" y="5.08" drill="0.9652"/>
<pad name="VIN" x="7.62" y="7.62" drill="0.9652"/>
<wire x1="-8.89" y1="8.89" x2="8.89" y2="8.89" width="0.127" layer="51"/>
<wire x1="8.89" y1="8.89" x2="8.89" y2="-52.07" width="0.127" layer="51"/>
<wire x1="8.89" y1="-52.07" x2="-8.89" y2="-52.07" width="0.127" layer="51"/>
<wire x1="-8.89" y1="-52.07" x2="-8.89" y2="8.89" width="0.127" layer="51"/>
<wire x1="-1.27" y1="7.62" x2="1.27" y2="7.62" width="0.2032" layer="21"/>
<wire x1="1.27" y1="7.62" x2="1.27" y2="8.89" width="0.2032" layer="21"/>
<wire x1="1.27" y1="8.89" x2="8.89" y2="8.89" width="0.2032" layer="21"/>
<wire x1="8.89" y1="8.89" x2="8.89" y2="-52.07" width="0.2032" layer="21"/>
<wire x1="8.89" y1="-52.07" x2="-8.89" y2="-52.07" width="0.2032" layer="21"/>
<wire x1="-8.89" y1="-52.07" x2="-8.89" y2="8.89" width="0.2032" layer="21"/>
<wire x1="-8.89" y1="8.89" x2="-1.27" y2="8.89" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="8.89" x2="-1.27" y2="7.62" width="0.2032" layer="21"/>
<text x="-7.62" y="10.16" size="1.27" layer="25" font="vector">&gt;NAME</text>
<text x="-7.62" y="-54.61" size="1.27" layer="27" font="vector">&gt;VALUE</text>
<pad name="VUSB" x="5.08" y="5.08" drill="0.9652"/>
<pad name="AREF" x="5.08" y="0" drill="0.9652"/>
<pad name="A10" x="5.08" y="-2.54" drill="0.9652"/>
<pad name="A11" x="5.08" y="-5.08" drill="0.9652"/>
<pad name="42" x="0" y="-35.56" drill="0.9652"/>
<pad name="53" x="2.54" y="-30.48" drill="0.9652"/>
<pad name="41" x="0" y="-33.02" drill="0.9652"/>
<pad name="40" x="0" y="-30.48" drill="0.9652"/>
<pad name="DD" x="0" y="-15.24" drill="0.9652"/>
<pad name="DC" x="0" y="-12.7" drill="0.9652"/>
<pad name="52" x="2.54" y="-33.02" drill="0.9652"/>
<pad name="51" x="2.54" y="-35.56" drill="0.9652"/>
<pad name="54" x="2.54" y="-15.24" drill="0.9652"/>
<pad name="55" x="2.54" y="-12.7" drill="0.9652"/>
<pad name="56" x="2.54" y="-10.16" drill="0.9652"/>
<pad name="57" x="2.54" y="-7.62" drill="0.9652"/>
<pad name="DE" x="0" y="-10.16" drill="0.9652"/>
<pad name="GND6" x="0" y="-7.62" drill="0.9652"/>
<pad name="3V3_1" x="-7.62" y="-27.94" drill="0.9652"/>
<pad name="24" x="-7.62" y="-30.48" drill="0.9652"/>
<pad name="25" x="-7.62" y="-33.02" drill="0.9652"/>
<pad name="26" x="-7.62" y="-35.56" drill="0.9652"/>
<pad name="27" x="-7.62" y="-38.1" drill="0.9652"/>
<pad name="28" x="-7.62" y="-40.64" drill="0.9652"/>
<pad name="29" x="-7.62" y="-43.18" drill="0.9652"/>
<pad name="30" x="-7.62" y="-45.72" drill="0.9652"/>
<pad name="31" x="-7.62" y="-48.26" drill="0.9652"/>
<pad name="32" x="-7.62" y="-50.8" drill="0.9652"/>
<pad name="GND2" x="7.62" y="-27.94" drill="0.9652"/>
<pad name="A22" x="7.62" y="-30.48" drill="0.9652"/>
<pad name="A21" x="7.62" y="-33.02" drill="0.9652"/>
<pad name="39" x="7.62" y="-35.56" drill="0.9652"/>
<pad name="38" x="7.62" y="-38.1" drill="0.9652"/>
<pad name="37" x="7.62" y="-40.64" drill="0.9652"/>
<pad name="36" x="7.62" y="-43.18" drill="0.9652"/>
<pad name="35" x="7.62" y="-45.72" drill="0.9652"/>
<pad name="34" x="7.62" y="-48.26" drill="0.9652"/>
<pad name="33" x="7.62" y="-50.8" drill="0.9652"/>
<pad name="50" x="2.54" y="-40.64" drill="0.9652"/>
<pad name="49" x="2.54" y="-43.18" drill="0.9652"/>
<pad name="48" x="2.54" y="-45.72" drill="0.9652"/>
<pad name="47" x="2.54" y="-48.26" drill="0.9652"/>
<pad name="3V3_3" x="2.54" y="-50.8" drill="0.9652"/>
<pad name="43" x="0" y="-40.64" drill="0.9652"/>
<pad name="44" x="0" y="-43.18" drill="0.9652"/>
<pad name="45" x="0" y="-45.72" drill="0.9652"/>
<pad name="46" x="0" y="-48.26" drill="0.9652"/>
<pad name="GND7" x="0" y="-50.8" drill="0.9652"/>
<pad name="+5V" x="-4.5466" y="1.27" drill="0.9652"/>
<pad name="D-" x="-4.5466" y="-1.27" drill="0.9652"/>
<pad name="D+" x="-4.5466" y="-3.81" drill="0.9652"/>
<pad name="GND3" x="-4.5466" y="-6.35" drill="0.9652"/>
<pad name="GND4" x="-4.5466" y="-8.89" drill="0.9652"/>
</package>
</packages>
<symbols>
<symbol name="TEENSY-3.6_FULL">
<pin name="VIN(3.6-6V)" x="63.5" y="-10.16" length="middle" direction="pwr" rot="R180"/>
<pin name="3V3@1" x="-7.62" y="-48.26" length="middle" direction="pwr"/>
<pin name="GND@1" x="-7.62" y="-10.16" length="middle" direction="pwr"/>
<pin name="GND@2" x="63.5" y="-48.26" length="middle" direction="pwr" rot="R180"/>
<pin name="AGND" x="63.5" y="-12.7" length="middle" direction="pwr" rot="R180"/>
<pin name="D0/TOUCH/MOSI1/RX1" x="-7.62" y="-12.7" length="middle"/>
<pin name="D1/TOUCH/MISO1/TX1" x="-7.62" y="-15.24" length="middle"/>
<pin name="D2/PWM" x="-7.62" y="-17.78" length="middle"/>
<pin name="D3/SCL2/CAN0TX/PWM" x="-7.62" y="-20.32" length="middle"/>
<pin name="D4/SDA2/CAN0RX/PWM" x="-7.62" y="-22.86" length="middle"/>
<pin name="D5/(MISO)/(TX1)/PWM" x="-7.62" y="-25.4" length="middle"/>
<pin name="D6/PWM" x="-7.62" y="-27.94" length="middle"/>
<pin name="D7/(SCL0)/(MOSI0)/RX3/PWM" x="-7.62" y="-30.48" length="middle"/>
<pin name="D8/(SDA0)/(MISO0)/TX3/PWM" x="-7.62" y="-33.02" length="middle"/>
<pin name="D9/CS0/RX2/PWM" x="-7.62" y="-35.56" length="middle"/>
<pin name="D10/CS0/TX2/PWM" x="-7.62" y="-38.1" length="middle"/>
<pin name="D11/MOSI0" x="-7.62" y="-40.64" length="middle"/>
<pin name="D12/MISO0" x="-7.62" y="-43.18" length="middle"/>
<pin name="D24" x="-7.62" y="-53.34" length="middle"/>
<pin name="D25" x="-7.62" y="-55.88" length="middle"/>
<pin name="D26/(TX1)" x="-7.62" y="-58.42" length="middle"/>
<pin name="D27/(RX1)" x="-7.62" y="-60.96" length="middle"/>
<pin name="D28" x="-7.62" y="-63.5" length="middle"/>
<pin name="D29/TOUCH/(CAN0TX)/PWM" x="-7.62" y="-66.04" length="middle"/>
<pin name="D30/TOUCH/(CAN0RX)/PWM" x="-7.62" y="-68.58" length="middle"/>
<pin name="D31/A12/CS1/RX4" x="-7.62" y="-71.12" length="middle"/>
<pin name="D32/A13/SCK1/TX4" x="-7.62" y="-73.66" length="middle"/>
<pin name="D23/A9/TOUCH/PWM" x="63.5" y="-17.78" length="middle" rot="R180"/>
<pin name="D22/A8/TOUCH/PWM" x="63.5" y="-20.32" length="middle" rot="R180"/>
<pin name="D21/A7/CS0/(MOSI1)/PWM" x="63.5" y="-22.86" length="middle" rot="R180"/>
<pin name="D20/A6/CS0/(SCK1)/PWM" x="63.5" y="-25.4" length="middle" rot="R180"/>
<pin name="D19/A5/TOUCH/SCL0" x="63.5" y="-27.94" length="middle" rot="R180"/>
<pin name="D18/A4/TOUCH/SDA0" x="63.5" y="-30.48" length="middle" rot="R180"/>
<pin name="D17/A3/TOUCH/(SDA0)" x="63.5" y="-33.02" length="middle" rot="R180"/>
<pin name="D16/A2/TOUCH/(SCL0)" x="63.5" y="-35.56" length="middle" rot="R180"/>
<pin name="D15/A1/TOUCH/CS0" x="63.5" y="-38.1" length="middle" rot="R180"/>
<pin name="D14/A0/(SCK0)/PWM" x="63.5" y="-40.64" length="middle" rot="R180"/>
<pin name="D13/LED/SCK0" x="63.5" y="-43.18" length="middle" rot="R180"/>
<pin name="D38/A19/SDA1/PWM" x="63.5" y="-60.96" length="middle" rot="R180"/>
<pin name="D37/A18/SCL1/PWM" x="63.5" y="-63.5" length="middle" rot="R180"/>
<pin name="A22/DAC1" x="63.5" y="-53.34" length="middle" rot="R180"/>
<pin name="A21/DAC0" x="63.5" y="-55.88" length="middle" rot="R180"/>
<pin name="D39/A20" x="63.5" y="-58.42" length="middle" rot="R180"/>
<pin name="3V3(MAX_250MILLIA.)" x="63.5" y="-15.24" length="middle" rot="R180"/>
<pin name="D36/A17/PWM" x="63.5" y="-66.04" length="middle" rot="R180"/>
<pin name="D35/A16/PWM" x="63.5" y="-68.58" length="middle" rot="R180"/>
<pin name="D34/A15/CAN1RX/(SDA0)" x="63.5" y="-71.12" length="middle" rot="R180"/>
<pin name="D33/A14/CAN1TX/(SCL0)" x="63.5" y="-73.66" length="middle" rot="R180"/>
<wire x1="-2.54" y1="2.54" x2="-2.54" y2="-76.2" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-76.2" x2="7.62" y2="-76.2" width="0.254" layer="94"/>
<wire x1="7.62" y1="-76.2" x2="45.72" y2="-76.2" width="0.254" layer="94"/>
<wire x1="45.72" y1="-76.2" x2="58.42" y2="-76.2" width="0.254" layer="94"/>
<wire x1="58.42" y1="-76.2" x2="58.42" y2="2.54" width="0.254" layer="94"/>
<wire x1="58.42" y1="2.54" x2="-2.54" y2="2.54" width="0.254" layer="94"/>
<pin name="5V" x="-7.62" y="-78.74" length="middle"/>
<pin name="D+" x="-7.62" y="-81.28" length="middle"/>
<pin name="D-" x="-7.62" y="-83.82" length="middle"/>
<pin name="GND@3" x="-7.62" y="-86.36" length="middle"/>
<pin name="GND@4" x="-7.62" y="-88.9" length="middle"/>
<pin name="GND@6" x="-7.62" y="-116.84" length="middle"/>
<pin name="DC" x="-7.62" y="-121.92" length="middle"/>
<pin name="DE" x="-7.62" y="-119.38" length="middle"/>
<pin name="AREF" x="63.5" y="-83.82" length="middle" rot="R180"/>
<pin name="A10" x="63.5" y="-86.36" length="middle" rot="R180"/>
<pin name="A11" x="63.5" y="-88.9" length="middle" rot="R180"/>
<pin name="RESET" x="63.5" y="-104.14" length="middle" rot="R180"/>
<pin name="VUSB" x="63.5" y="-78.74" length="middle" rot="R180"/>
<pin name="VBAT(3V_COIN_CELL_FOR_RTC)" x="63.5" y="-93.98" length="middle" rot="R180"/>
<pin name="3V3@2" x="63.5" y="-96.52" length="middle" rot="R180"/>
<pin name="GND@5" x="63.5" y="-99.06" length="middle" rot="R180"/>
<pin name="PROGRAM" x="63.5" y="-101.6" length="middle" rot="R180"/>
<wire x1="-2.54" y1="-76.2" x2="-2.54" y2="-91.44" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-91.44" x2="-2.54" y2="-106.68" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-106.68" x2="-2.54" y2="-114.3" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-114.3" x2="-2.54" y2="-127" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-106.68" x2="22.86" y2="-106.68" width="0.254" layer="94"/>
<wire x1="22.86" y1="-106.68" x2="58.42" y2="-106.68" width="0.254" layer="94"/>
<wire x1="58.42" y1="-106.68" x2="58.42" y2="-91.44" width="0.254" layer="94"/>
<text x="27.94" y="-101.6" size="1.778" layer="94">Interior</text>
<text x="0" y="-93.98" size="1.778" layer="94">USB host</text>
<wire x1="58.42" y1="-91.44" x2="58.42" y2="-81.28" width="0.254" layer="94"/>
<wire x1="58.42" y1="-81.28" x2="58.42" y2="-76.2" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-91.44" x2="7.62" y2="-91.44" width="0.254" layer="94"/>
<wire x1="7.62" y1="-91.44" x2="7.62" y2="-76.2" width="0.254" layer="94"/>
<wire x1="58.42" y1="-91.44" x2="45.72" y2="-91.44" width="0.254" layer="94"/>
<wire x1="45.72" y1="-91.44" x2="22.86" y2="-91.44" width="0.254" layer="94"/>
<wire x1="22.86" y1="-91.44" x2="22.86" y2="-106.68" width="0.254" layer="94"/>
<text x="17.78" y="-2.54" size="2.54" layer="94">Teensy 3.6</text>
<text x="5.08" y="-5.08" size="1.778" layer="94">32 Bit Arduino-Compatible Microcontroller</text>
<pin name="DD" x="-7.62" y="-124.46" length="middle"/>
<pin name="D46/SCK2" x="-7.62" y="-147.32" length="middle"/>
<pin name="D40" x="-7.62" y="-129.54" length="middle"/>
<pin name="D41" x="-7.62" y="-132.08" length="middle"/>
<pin name="D42" x="-7.62" y="-134.62" length="middle"/>
<pin name="GND@7" x="-7.62" y="-149.86" length="middle"/>
<pin name="D43/CS2" x="-7.62" y="-139.7" length="middle"/>
<pin name="D44/MOSI2" x="-7.62" y="-142.24" length="middle"/>
<pin name="D45/MISO2" x="-7.62" y="-144.78" length="middle"/>
<pin name="D57/SCL3" x="63.5" y="-116.84" length="middle" rot="R180"/>
<pin name="D56/SDA3" x="63.5" y="-119.38" length="middle" rot="R180"/>
<pin name="D55" x="63.5" y="-121.92" length="middle" rot="R180"/>
<pin name="D54/CS2" x="63.5" y="-124.46" length="middle" rot="R180"/>
<pin name="D49/A23" x="63.5" y="-142.24" length="middle" rot="R180"/>
<pin name="D53/(SCK2)" x="63.5" y="-129.54" length="middle" rot="R180"/>
<pin name="D52/(MOSI2)" x="63.5" y="-132.08" length="middle" rot="R180"/>
<pin name="D51/(MISO2)" x="63.5" y="-134.62" length="middle" rot="R180"/>
<pin name="D48/TX6/(SDA0)" x="63.5" y="-144.78" length="middle" rot="R180"/>
<pin name="D50/A24" x="63.5" y="-139.7" length="middle" rot="R180"/>
<wire x1="-2.54" y1="-127" x2="17.78" y2="-127" width="0.254" layer="94"/>
<wire x1="17.78" y1="-127" x2="17.78" y2="-114.3" width="0.254" layer="94"/>
<wire x1="17.78" y1="-127" x2="58.42" y2="-127" width="0.254" layer="94"/>
<wire x1="58.42" y1="-106.68" x2="58.42" y2="-114.3" width="0.254" layer="94"/>
<text x="7.62" y="-121.92" size="1.778" layer="94">Debug</text>
<wire x1="58.42" y1="-114.3" x2="58.42" y2="-127" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-114.3" x2="17.78" y2="-114.3" width="0.254" layer="94"/>
<wire x1="17.78" y1="-114.3" x2="58.42" y2="-114.3" width="0.254" layer="94"/>
<text x="12.7" y="-111.76" size="2.1844" layer="94">Teensy 3.6 Back Side:</text>
<wire x1="45.72" y1="-91.44" x2="45.72" y2="-81.28" width="0.254" layer="94"/>
<wire x1="45.72" y1="-81.28" x2="45.72" y2="-76.2" width="0.254" layer="94"/>
<wire x1="58.42" y1="-81.28" x2="45.72" y2="-81.28" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-127" x2="-2.54" y2="-137.16" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-137.16" x2="-2.54" y2="-152.4" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-152.4" x2="58.42" y2="-152.4" width="0.254" layer="94"/>
<wire x1="58.42" y1="-152.4" x2="58.42" y2="-137.16" width="0.254" layer="94"/>
<wire x1="58.42" y1="-137.16" x2="58.42" y2="-127" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-137.16" x2="58.42" y2="-137.16" width="0.254" layer="94"/>
<pin name="D47/RX6/(SCL0)" x="63.5" y="-147.32" length="middle" rot="R180"/>
<pin name="3V3@3" x="63.5" y="-149.86" length="middle" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="TEENSY-3.6_FULL" uservalue="yes">
<gates>
<gate name="G$1" symbol="TEENSY-3.6_FULL" x="0" y="0"/>
</gates>
<devices>
<device name="" package="TEENSY-3.6_FULL">
<connects>
<connect gate="G$1" pin="3V3(MAX_250MILLIA.)" pad="3V3_MAX_250"/>
<connect gate="G$1" pin="3V3@1" pad="3V3_1"/>
<connect gate="G$1" pin="3V3@2" pad="3.3V_2"/>
<connect gate="G$1" pin="3V3@3" pad="3V3_3"/>
<connect gate="G$1" pin="5V" pad="+5V"/>
<connect gate="G$1" pin="A10" pad="A10"/>
<connect gate="G$1" pin="A11" pad="A11"/>
<connect gate="G$1" pin="A21/DAC0" pad="A21"/>
<connect gate="G$1" pin="A22/DAC1" pad="A22"/>
<connect gate="G$1" pin="AGND" pad="AGND"/>
<connect gate="G$1" pin="AREF" pad="AREF"/>
<connect gate="G$1" pin="D+" pad="D+"/>
<connect gate="G$1" pin="D-" pad="D-"/>
<connect gate="G$1" pin="D0/TOUCH/MOSI1/RX1" pad="0"/>
<connect gate="G$1" pin="D1/TOUCH/MISO1/TX1" pad="1"/>
<connect gate="G$1" pin="D10/CS0/TX2/PWM" pad="10"/>
<connect gate="G$1" pin="D11/MOSI0" pad="11"/>
<connect gate="G$1" pin="D12/MISO0" pad="12"/>
<connect gate="G$1" pin="D13/LED/SCK0" pad="13"/>
<connect gate="G$1" pin="D14/A0/(SCK0)/PWM" pad="14"/>
<connect gate="G$1" pin="D15/A1/TOUCH/CS0" pad="15"/>
<connect gate="G$1" pin="D16/A2/TOUCH/(SCL0)" pad="16"/>
<connect gate="G$1" pin="D17/A3/TOUCH/(SDA0)" pad="17"/>
<connect gate="G$1" pin="D18/A4/TOUCH/SDA0" pad="18"/>
<connect gate="G$1" pin="D19/A5/TOUCH/SCL0" pad="19"/>
<connect gate="G$1" pin="D2/PWM" pad="2"/>
<connect gate="G$1" pin="D20/A6/CS0/(SCK1)/PWM" pad="20"/>
<connect gate="G$1" pin="D21/A7/CS0/(MOSI1)/PWM" pad="21"/>
<connect gate="G$1" pin="D22/A8/TOUCH/PWM" pad="22"/>
<connect gate="G$1" pin="D23/A9/TOUCH/PWM" pad="23"/>
<connect gate="G$1" pin="D24" pad="24"/>
<connect gate="G$1" pin="D25" pad="25"/>
<connect gate="G$1" pin="D26/(TX1)" pad="26"/>
<connect gate="G$1" pin="D27/(RX1)" pad="27"/>
<connect gate="G$1" pin="D28" pad="28"/>
<connect gate="G$1" pin="D29/TOUCH/(CAN0TX)/PWM" pad="29"/>
<connect gate="G$1" pin="D3/SCL2/CAN0TX/PWM" pad="3"/>
<connect gate="G$1" pin="D30/TOUCH/(CAN0RX)/PWM" pad="30"/>
<connect gate="G$1" pin="D31/A12/CS1/RX4" pad="31"/>
<connect gate="G$1" pin="D32/A13/SCK1/TX4" pad="32"/>
<connect gate="G$1" pin="D33/A14/CAN1TX/(SCL0)" pad="33"/>
<connect gate="G$1" pin="D34/A15/CAN1RX/(SDA0)" pad="34"/>
<connect gate="G$1" pin="D35/A16/PWM" pad="35"/>
<connect gate="G$1" pin="D36/A17/PWM" pad="36"/>
<connect gate="G$1" pin="D37/A18/SCL1/PWM" pad="37"/>
<connect gate="G$1" pin="D38/A19/SDA1/PWM" pad="38"/>
<connect gate="G$1" pin="D39/A20" pad="39"/>
<connect gate="G$1" pin="D4/SDA2/CAN0RX/PWM" pad="4"/>
<connect gate="G$1" pin="D40" pad="40"/>
<connect gate="G$1" pin="D41" pad="41"/>
<connect gate="G$1" pin="D42" pad="42"/>
<connect gate="G$1" pin="D43/CS2" pad="43"/>
<connect gate="G$1" pin="D44/MOSI2" pad="44"/>
<connect gate="G$1" pin="D45/MISO2" pad="45"/>
<connect gate="G$1" pin="D46/SCK2" pad="46"/>
<connect gate="G$1" pin="D47/RX6/(SCL0)" pad="47"/>
<connect gate="G$1" pin="D48/TX6/(SDA0)" pad="48"/>
<connect gate="G$1" pin="D49/A23" pad="49"/>
<connect gate="G$1" pin="D5/(MISO)/(TX1)/PWM" pad="5"/>
<connect gate="G$1" pin="D50/A24" pad="50"/>
<connect gate="G$1" pin="D51/(MISO2)" pad="51"/>
<connect gate="G$1" pin="D52/(MOSI2)" pad="52"/>
<connect gate="G$1" pin="D53/(SCK2)" pad="53"/>
<connect gate="G$1" pin="D54/CS2" pad="54"/>
<connect gate="G$1" pin="D55" pad="55"/>
<connect gate="G$1" pin="D56/SDA3" pad="56"/>
<connect gate="G$1" pin="D57/SCL3" pad="57"/>
<connect gate="G$1" pin="D6/PWM" pad="6"/>
<connect gate="G$1" pin="D7/(SCL0)/(MOSI0)/RX3/PWM" pad="7"/>
<connect gate="G$1" pin="D8/(SDA0)/(MISO0)/TX3/PWM" pad="8"/>
<connect gate="G$1" pin="D9/CS0/RX2/PWM" pad="9"/>
<connect gate="G$1" pin="DC" pad="DC"/>
<connect gate="G$1" pin="DD" pad="DD"/>
<connect gate="G$1" pin="DE" pad="DE"/>
<connect gate="G$1" pin="GND@1" pad="GND1"/>
<connect gate="G$1" pin="GND@2" pad="GND2"/>
<connect gate="G$1" pin="GND@3" pad="GND3"/>
<connect gate="G$1" pin="GND@4" pad="GND4"/>
<connect gate="G$1" pin="GND@5" pad="GND5"/>
<connect gate="G$1" pin="GND@6" pad="GND6"/>
<connect gate="G$1" pin="GND@7" pad="GND7"/>
<connect gate="G$1" pin="PROGRAM" pad="PROGRAM"/>
<connect gate="G$1" pin="RESET" pad="RESET"/>
<connect gate="G$1" pin="VBAT(3V_COIN_CELL_FOR_RTC)" pad="VBAT"/>
<connect gate="G$1" pin="VIN(3.6-6V)" pad="VIN"/>
<connect gate="G$1" pin="VUSB" pad="VUSB"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply1">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
 GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
 Please keep in mind, that these devices are necessary for the
 automatic wiring of the supply signals.&lt;p&gt;
 The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
 In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
 &lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="GND">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="GND" prefix="GND">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="pinhead">
<description>&lt;b&gt;Pin Header Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="1X10">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="7.62" y1="0.635" x2="8.255" y2="1.27" width="0.1524" layer="21"/>
<wire x1="8.255" y1="1.27" x2="9.525" y2="1.27" width="0.1524" layer="21"/>
<wire x1="9.525" y1="1.27" x2="10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="10.16" y1="0.635" x2="10.16" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="10.16" y1="-0.635" x2="9.525" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="9.525" y1="-1.27" x2="8.255" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="8.255" y1="-1.27" x2="7.62" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="4.445" y2="1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="1.27" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="5.715" y2="1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="1.27" x2="6.985" y2="1.27" width="0.1524" layer="21"/>
<wire x1="6.985" y1="1.27" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="0.635" x2="7.62" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-0.635" x2="6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="6.985" y1="-1.27" x2="5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="-1.27" x2="5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.445" y1="-1.27" x2="3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-3.175" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-3.175" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-1.27" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="0.635" x2="-6.985" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="1.27" x2="-5.715" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="1.27" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-0.635" x2="-5.715" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-1.27" x2="-6.985" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="-1.27" x2="-7.62" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="1.27" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-0.635" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-1.27" x2="-4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-12.065" y1="1.27" x2="-10.795" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="1.27" x2="-10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="0.635" x2="-10.16" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="-0.635" x2="-10.795" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="0.635" x2="-9.525" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="1.27" x2="-8.255" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="1.27" x2="-7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="0.635" x2="-7.62" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-0.635" x2="-8.255" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="-1.27" x2="-9.525" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="-1.27" x2="-10.16" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="0.635" x2="-12.7" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-12.065" y1="1.27" x2="-12.7" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="-0.635" x2="-12.065" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="-1.27" x2="-12.065" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="10.795" y1="1.27" x2="12.065" y2="1.27" width="0.1524" layer="21"/>
<wire x1="12.065" y1="1.27" x2="12.7" y2="0.635" width="0.1524" layer="21"/>
<wire x1="12.7" y1="0.635" x2="12.7" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="12.7" y1="-0.635" x2="12.065" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="10.795" y1="1.27" x2="10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="10.16" y1="-0.635" x2="10.795" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="12.065" y1="-1.27" x2="10.795" y2="-1.27" width="0.1524" layer="21"/>
<pad name="1" x="-11.43" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-8.89" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="-6.35" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="-3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="5" x="-1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="6" x="1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="7" x="3.81" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="8" x="6.35" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="9" x="8.89" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="10" x="11.43" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-12.7762" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-12.7" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="8.636" y1="-0.254" x2="9.144" y2="0.254" layer="51"/>
<rectangle x1="6.096" y1="-0.254" x2="6.604" y2="0.254" layer="51"/>
<rectangle x1="3.556" y1="-0.254" x2="4.064" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="-4.064" y1="-0.254" x2="-3.556" y2="0.254" layer="51"/>
<rectangle x1="-6.604" y1="-0.254" x2="-6.096" y2="0.254" layer="51"/>
<rectangle x1="-9.144" y1="-0.254" x2="-8.636" y2="0.254" layer="51"/>
<rectangle x1="-11.684" y1="-0.254" x2="-11.176" y2="0.254" layer="51"/>
<rectangle x1="11.176" y1="-0.254" x2="11.684" y2="0.254" layer="51"/>
</package>
<package name="1X10/90">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-12.7" y1="-1.905" x2="-10.16" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="-1.905" x2="-10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="0.635" x2="-12.7" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="0.635" x2="-12.7" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="6.985" x2="-11.43" y2="1.27" width="0.762" layer="21"/>
<wire x1="-10.16" y1="-1.905" x2="-7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-1.905" x2="-7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="0.635" x2="-10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="6.985" x2="-8.89" y2="1.27" width="0.762" layer="21"/>
<wire x1="-7.62" y1="-1.905" x2="-5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-1.905" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0.635" x2="-7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="6.985" x2="-6.35" y2="1.27" width="0.762" layer="21"/>
<wire x1="-5.08" y1="-1.905" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="6.985" x2="-3.81" y2="1.27" width="0.762" layer="21"/>
<wire x1="-2.54" y1="-1.905" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="6.985" x2="-1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="0" y1="-1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="6.985" x2="1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="5.08" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.635" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="3.81" y1="6.985" x2="3.81" y2="1.27" width="0.762" layer="21"/>
<wire x1="5.08" y1="-1.905" x2="7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-1.905" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="7.62" y1="0.635" x2="5.08" y2="0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="6.985" x2="6.35" y2="1.27" width="0.762" layer="21"/>
<wire x1="7.62" y1="-1.905" x2="10.16" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="10.16" y1="-1.905" x2="10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="10.16" y1="0.635" x2="7.62" y2="0.635" width="0.1524" layer="21"/>
<wire x1="8.89" y1="6.985" x2="8.89" y2="1.27" width="0.762" layer="21"/>
<wire x1="10.16" y1="-1.905" x2="12.7" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="12.7" y1="-1.905" x2="12.7" y2="0.635" width="0.1524" layer="21"/>
<wire x1="12.7" y1="0.635" x2="10.16" y2="0.635" width="0.1524" layer="21"/>
<wire x1="11.43" y1="6.985" x2="11.43" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-11.43" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="-8.89" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="-6.35" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="-3.81" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="5" x="-1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="6" x="1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="7" x="3.81" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="8" x="6.35" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="9" x="8.89" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="10" x="11.43" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-13.335" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="14.605" y="-4.445" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-11.811" y1="0.635" x2="-11.049" y2="1.143" layer="21"/>
<rectangle x1="-9.271" y1="0.635" x2="-8.509" y2="1.143" layer="21"/>
<rectangle x1="-6.731" y1="0.635" x2="-5.969" y2="1.143" layer="21"/>
<rectangle x1="-4.191" y1="0.635" x2="-3.429" y2="1.143" layer="21"/>
<rectangle x1="-1.651" y1="0.635" x2="-0.889" y2="1.143" layer="21"/>
<rectangle x1="0.889" y1="0.635" x2="1.651" y2="1.143" layer="21"/>
<rectangle x1="3.429" y1="0.635" x2="4.191" y2="1.143" layer="21"/>
<rectangle x1="5.969" y1="0.635" x2="6.731" y2="1.143" layer="21"/>
<rectangle x1="8.509" y1="0.635" x2="9.271" y2="1.143" layer="21"/>
<rectangle x1="11.049" y1="0.635" x2="11.811" y2="1.143" layer="21"/>
<rectangle x1="-11.811" y1="-2.921" x2="-11.049" y2="-1.905" layer="21"/>
<rectangle x1="-9.271" y1="-2.921" x2="-8.509" y2="-1.905" layer="21"/>
<rectangle x1="-6.731" y1="-2.921" x2="-5.969" y2="-1.905" layer="21"/>
<rectangle x1="-4.191" y1="-2.921" x2="-3.429" y2="-1.905" layer="21"/>
<rectangle x1="-1.651" y1="-2.921" x2="-0.889" y2="-1.905" layer="21"/>
<rectangle x1="0.889" y1="-2.921" x2="1.651" y2="-1.905" layer="21"/>
<rectangle x1="3.429" y1="-2.921" x2="4.191" y2="-1.905" layer="21"/>
<rectangle x1="5.969" y1="-2.921" x2="6.731" y2="-1.905" layer="21"/>
<rectangle x1="8.509" y1="-2.921" x2="9.271" y2="-1.905" layer="21"/>
<rectangle x1="11.049" y1="-2.921" x2="11.811" y2="-1.905" layer="21"/>
</package>
<package name="1X02">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-1.905" y1="1.27" x2="-0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.635" x2="-0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.27" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.635" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="0.635" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.905" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.27" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="2.54" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.635" x2="1.905" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="0.635" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="0" y2="-0.635" width="0.1524" layer="21"/>
<pad name="1" x="-1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-2.6162" y="1.8288" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
</package>
<package name="1X02/90">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-2.54" y1="-1.905" x2="0" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.905" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="0" y1="0.635" x2="-2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0.635" x2="-2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="6.985" x2="-1.27" y2="1.27" width="0.762" layer="21"/>
<wire x1="0" y1="-1.905" x2="2.54" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="2.54" y2="0.635" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0.635" x2="0" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="6.985" x2="1.27" y2="1.27" width="0.762" layer="21"/>
<pad name="1" x="-1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="1.27" y="-3.81" drill="1.016" shape="long" rot="R90"/>
<text x="-3.175" y="-3.81" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="4.445" y="-3.81" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.651" y1="0.635" x2="-0.889" y2="1.143" layer="21"/>
<rectangle x1="0.889" y1="0.635" x2="1.651" y2="1.143" layer="21"/>
<rectangle x1="-1.651" y1="-2.921" x2="-0.889" y2="-1.905" layer="21"/>
<rectangle x1="0.889" y1="-2.921" x2="1.651" y2="-1.905" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="PINHD10">
<wire x1="-6.35" y1="-15.24" x2="1.27" y2="-15.24" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-15.24" x2="1.27" y2="12.7" width="0.4064" layer="94"/>
<wire x1="1.27" y1="12.7" x2="-6.35" y2="12.7" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="12.7" x2="-6.35" y2="-15.24" width="0.4064" layer="94"/>
<text x="-6.35" y="13.335" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-17.78" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="10.16" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="7.62" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="5" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="6" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="7" x="-2.54" y="-5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="8" x="-2.54" y="-7.62" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="9" x="-2.54" y="-10.16" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="10" x="-2.54" y="-12.7" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
<symbol name="PINHD2">
<wire x1="-6.35" y1="-2.54" x2="1.27" y2="-2.54" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="1.27" y2="5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="5.08" x2="-6.35" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="5.08" x2="-6.35" y2="-2.54" width="0.4064" layer="94"/>
<text x="-6.35" y="5.715" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PINHD-1X10" prefix="JP" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINHD10" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X10">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="10" pad="10"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
<connect gate="A" pin="9" pad="9"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="/90" package="1X10/90">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="10" pad="10"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
<connect gate="A" pin="9" pad="9"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PINHD-1X2" prefix="JP" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="PINHD2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1X02">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="/90" package="1X02/90">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="transistor-npn">
<description>&lt;b&gt;NPN Transistors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="TO18">
<description>&lt;b&gt;TO 18&lt;/b&gt;</description>
<wire x1="0.9289" y1="2.227" x2="2.227" y2="0.9289" width="0.0508" layer="51" curve="-44.7172"/>
<wire x1="0.9289" y1="-2.227" x2="2.227" y2="-0.9289" width="0.0508" layer="51" curve="44.7172"/>
<wire x1="-3.937" y1="-0.508" x2="-3.937" y2="0.508" width="0.127" layer="21"/>
<wire x1="-2.227" y1="-0.9289" x2="0.929" y2="2.2271" width="0.0508" layer="21" curve="-135.281"/>
<wire x1="-2.227" y1="-0.9289" x2="-0.9289" y2="-2.227" width="0.0508" layer="51" curve="44.7172"/>
<wire x1="-3.937" y1="-0.508" x2="-2.8765" y2="-0.508" width="0.127" layer="21"/>
<wire x1="-0.9289" y1="-2.227" x2="0.9289" y2="-2.227" width="0.0508" layer="21" curve="45.2828"/>
<wire x1="-3.937" y1="0.508" x2="-2.8765" y2="0.508" width="0.127" layer="21"/>
<wire x1="2.227" y1="-0.9289" x2="2.227" y2="0.9289" width="0.0508" layer="21" curve="45.2828"/>
<circle x="0" y="0" radius="2.921" width="0.127" layer="21"/>
<pad name="1" x="-1.27" y="-1.27" drill="0.8128" shape="octagon"/>
<pad name="2" x="1.27" y="-1.27" drill="0.8128" shape="octagon"/>
<pad name="3" x="1.27" y="1.27" drill="0.8128" shape="octagon"/>
<text x="3.175" y="0" size="0.6096" layer="25" ratio="10">&gt;NAME</text>
<text x="3.175" y="-1.905" size="0.6096" layer="27" ratio="10">&gt;VALUE</text>
<text x="-1.905" y="-1.27" size="1.27" layer="51" ratio="10">1</text>
<text x="0.635" y="-1.27" size="1.27" layer="51" ratio="10">2</text>
<text x="0" y="0.635" size="1.27" layer="51" ratio="10">3</text>
</package>
</packages>
<symbols>
<symbol name="NPN">
<wire x1="2.54" y1="2.54" x2="0.508" y2="1.524" width="0.1524" layer="94"/>
<wire x1="1.778" y1="-1.524" x2="2.54" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="1.27" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="1.778" y2="-1.524" width="0.1524" layer="94"/>
<wire x1="1.54" y1="-2.04" x2="0.308" y2="-1.424" width="0.1524" layer="94"/>
<wire x1="1.524" y1="-2.413" x2="2.286" y2="-2.413" width="0.254" layer="94"/>
<wire x1="2.286" y1="-2.413" x2="1.778" y2="-1.778" width="0.254" layer="94"/>
<wire x1="1.778" y1="-1.778" x2="1.524" y2="-2.286" width="0.254" layer="94"/>
<wire x1="1.524" y1="-2.286" x2="1.905" y2="-2.286" width="0.254" layer="94"/>
<wire x1="1.905" y1="-2.286" x2="1.778" y2="-2.032" width="0.254" layer="94"/>
<text x="-10.16" y="7.62" size="1.778" layer="95">&gt;NAME</text>
<text x="-10.16" y="5.08" size="1.778" layer="96">&gt;VALUE</text>
<rectangle x1="-0.254" y1="-2.54" x2="0.508" y2="2.54" layer="94"/>
<pin name="B" x="-2.54" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
<pin name="E" x="2.54" y="-5.08" visible="off" length="short" direction="pas" swaplevel="3" rot="R90"/>
<pin name="C" x="2.54" y="5.08" visible="off" length="short" direction="pas" swaplevel="2" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="2N2222*" prefix="Q">
<description>&lt;b&gt;NPN Transistor&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="NPN" x="0" y="0"/>
</gates>
<devices>
<device name="" package="TO18">
<connects>
<connect gate="G$1" pin="B" pad="2"/>
<connect gate="G$1" pin="C" pad="3"/>
<connect gate="G$1" pin="E" pad="1"/>
</connects>
<technologies>
<technology name=""/>
<technology name="A"/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="rcl">
<description>&lt;b&gt;Resistors, Capacitors, Inductors&lt;/b&gt;&lt;p&gt;
Based on the previous libraries:
&lt;ul&gt;
&lt;li&gt;r.lbr
&lt;li&gt;cap.lbr 
&lt;li&gt;cap-fe.lbr
&lt;li&gt;captant.lbr
&lt;li&gt;polcap.lbr
&lt;li&gt;ipc-smd.lbr
&lt;/ul&gt;
All SMD packages are defined according to the IPC specifications and  CECC&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;&lt;p&gt;
&lt;p&gt;
for Electrolyt Capacitors see also :&lt;p&gt;
www.bccomponents.com &lt;p&gt;
www.panasonic.com&lt;p&gt;
www.kemet.com&lt;p&gt;
http://www.secc.co.jp/pdf/os_e/2004/e_os_all.pdf &lt;b&gt;(SANYO)&lt;/b&gt;
&lt;p&gt;
for trimmer refence see : &lt;u&gt;www.electrospec-inc.com/cross_references/trimpotcrossref.asp&lt;/u&gt;&lt;p&gt;

&lt;table border=0 cellspacing=0 cellpadding=0 width="100%" cellpaddding=0&gt;
&lt;tr valign="top"&gt;

&lt;! &lt;td width="10"&gt;&amp;nbsp;&lt;/td&gt;
&lt;td width="90%"&gt;

&lt;b&gt;&lt;font color="#0000FF" size="4"&gt;TRIM-POT CROSS REFERENCE&lt;/font&gt;&lt;/b&gt;
&lt;P&gt;
&lt;TABLE BORDER=0 CELLSPACING=1 CELLPADDING=2&gt;
  &lt;TR&gt;
    &lt;TD COLSPAN=8&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;RECTANGULAR MULTI-TURN&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;B&gt;
      &lt;FONT SIZE=3 FACE=ARIAL color="#FF0000"&gt;BOURNS&lt;/FONT&gt;
      &lt;/B&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;B&gt;
      &lt;FONT SIZE=3 FACE=ARIAL color="#FF0000"&gt;BI&amp;nbsp;TECH&lt;/FONT&gt;
      &lt;/B&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;B&gt;
      &lt;FONT SIZE=3 FACE=ARIAL color="#FF0000"&gt;DALE-VISHAY&lt;/FONT&gt;
      &lt;/B&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;B&gt;
      &lt;FONT SIZE=3 FACE=ARIAL color="#FF0000"&gt;PHILIPS/MEPCO&lt;/FONT&gt;
      &lt;/B&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;B&gt;
      &lt;FONT SIZE=3 FACE=ARIAL color="#FF0000"&gt;MURATA&lt;/FONT&gt;
      &lt;/B&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;B&gt;
      &lt;FONT SIZE=3 FACE=ARIAL color="#FF0000"&gt;PANASONIC&lt;/FONT&gt;
      &lt;/B&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;B&gt;
      &lt;FONT SIZE=3 FACE=ARIAL color="#FF0000"&gt;SPECTROL&lt;/FONT&gt;
      &lt;/B&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;B&gt;
      &lt;FONT SIZE=3 FACE=ARIAL color="#FF0000"&gt;MILSPEC&lt;/FONT&gt;
      &lt;/B&gt;
    &lt;/TD&gt;&lt;TD&gt;&amp;nbsp;&lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3 &gt;
      3005P&lt;BR&gt;
      3006P&lt;BR&gt;
      3006W&lt;BR&gt;
      3006Y&lt;BR&gt;
      3009P&lt;BR&gt;
      3009W&lt;BR&gt;
      3009Y&lt;BR&gt;
      3057J&lt;BR&gt;
      3057L&lt;BR&gt;
      3057P&lt;BR&gt;
      3057Y&lt;BR&gt;
      3059J&lt;BR&gt;
      3059L&lt;BR&gt;
      3059P&lt;BR&gt;
      3059Y&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      89P&lt;BR&gt;
      89W&lt;BR&gt;
      89X&lt;BR&gt;
      89PH&lt;BR&gt;
      76P&lt;BR&gt;
      89XH&lt;BR&gt;
      78SLT&lt;BR&gt;
      78L&amp;nbsp;ALT&lt;BR&gt;
      56P&amp;nbsp;ALT&lt;BR&gt;
      78P&amp;nbsp;ALT&lt;BR&gt;
      T8S&lt;BR&gt;
      78L&lt;BR&gt;
      56P&lt;BR&gt;
      78P&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      T18/784&lt;BR&gt;
      783&lt;BR&gt;
      781&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      2199&lt;BR&gt;
      1697/1897&lt;BR&gt;
      1680/1880&lt;BR&gt;
      2187&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      8035EKP/CT20/RJ-20P&lt;BR&gt;
      -&lt;BR&gt;
      RJ-20X&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      1211L&lt;BR&gt;
      8012EKQ&amp;nbsp;ALT&lt;BR&gt;
      8012EKR&amp;nbsp;ALT&lt;BR&gt;
      1211P&lt;BR&gt;
      8012EKJ&lt;BR&gt;
      8012EKL&lt;BR&gt;
      8012EKQ&lt;BR&gt;
      8012EKR&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      2101P&lt;BR&gt;
      2101W&lt;BR&gt;
      2101Y&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      2102L&lt;BR&gt;
      2102S&lt;BR&gt;
      2102Y&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      EVMCOG&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      43P&lt;BR&gt;
      43W&lt;BR&gt;
      43Y&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      40L&lt;BR&gt;
      40P&lt;BR&gt;
      40Y&lt;BR&gt;
      70Y-T602&lt;BR&gt;
      70L&lt;BR&gt;
      70P&lt;BR&gt;
      70Y&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      RT/RTR12&lt;BR&gt;
      RT/RTR12&lt;BR&gt;
      RT/RTR12&lt;BR&gt;
      -&lt;BR&gt;
      RJ/RJR12&lt;BR&gt;
      RJ/RJR12&lt;BR&gt;
      RJ/RJR12&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD COLSPAN=8&gt;&amp;nbsp;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD COLSPAN=8&gt;
      &lt;FONT SIZE=4 FACE=ARIAL&gt;&lt;B&gt;SQUARE MULTI-TURN&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
   &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;BOURN&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;BI&amp;nbsp;TECH&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;DALE-VISHAY&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;PHILIPS/MEPCO&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;MURATA&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;PANASONIC&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;SPECTROL&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;MILSPEC&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      3250L&lt;BR&gt;
      3250P&lt;BR&gt;
      3250W&lt;BR&gt;
      3250X&lt;BR&gt;
      3252P&lt;BR&gt;
      3252W&lt;BR&gt;
      3252X&lt;BR&gt;
      3260P&lt;BR&gt;
      3260W&lt;BR&gt;
      3260X&lt;BR&gt;
      3262P&lt;BR&gt;
      3262W&lt;BR&gt;
      3262X&lt;BR&gt;
      3266P&lt;BR&gt;
      3266W&lt;BR&gt;
      3266X&lt;BR&gt;
      3290H&lt;BR&gt;
      3290P&lt;BR&gt;
      3290W&lt;BR&gt;
      3292P&lt;BR&gt;
      3292W&lt;BR&gt;
      3292X&lt;BR&gt;
      3296P&lt;BR&gt;
      3296W&lt;BR&gt;
      3296X&lt;BR&gt;
      3296Y&lt;BR&gt;
      3296Z&lt;BR&gt;
      3299P&lt;BR&gt;
      3299W&lt;BR&gt;
      3299X&lt;BR&gt;
      3299Y&lt;BR&gt;
      3299Z&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      66P&amp;nbsp;ALT&lt;BR&gt;
      66W&amp;nbsp;ALT&lt;BR&gt;
      66X&amp;nbsp;ALT&lt;BR&gt;
      66P&amp;nbsp;ALT&lt;BR&gt;
      66W&amp;nbsp;ALT&lt;BR&gt;
      66X&amp;nbsp;ALT&lt;BR&gt;
      -&lt;BR&gt;
      64W&amp;nbsp;ALT&lt;BR&gt;
      -&lt;BR&gt;
      64P&amp;nbsp;ALT&lt;BR&gt;
      64W&amp;nbsp;ALT&lt;BR&gt;
      64X&amp;nbsp;ALT&lt;BR&gt;
      64P&lt;BR&gt;
      64W&lt;BR&gt;
      64X&lt;BR&gt;
      66X&amp;nbsp;ALT&lt;BR&gt;
      66P&amp;nbsp;ALT&lt;BR&gt;
      66W&amp;nbsp;ALT&lt;BR&gt;
      66P&lt;BR&gt;
      66W&lt;BR&gt;
      66X&lt;BR&gt;
      67P&lt;BR&gt;
      67W&lt;BR&gt;
      67X&lt;BR&gt;
      67Y&lt;BR&gt;
      67Z&lt;BR&gt;
      68P&lt;BR&gt;
      68W&lt;BR&gt;
      68X&lt;BR&gt;
      67Y&amp;nbsp;ALT&lt;BR&gt;
      67Z&amp;nbsp;ALT&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      5050&lt;BR&gt;
      5091&lt;BR&gt;
      5080&lt;BR&gt;
      5087&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      T63YB&lt;BR&gt;
      T63XB&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      5887&lt;BR&gt;
      5891&lt;BR&gt;
      5880&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      T93Z&lt;BR&gt;
      T93YA&lt;BR&gt;
      T93XA&lt;BR&gt;
      T93YB&lt;BR&gt;
      T93XB&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      8026EKP&lt;BR&gt;
      8026EKW&lt;BR&gt;
      8026EKM&lt;BR&gt;
      8026EKP&lt;BR&gt;
      8026EKB&lt;BR&gt;
      8026EKM&lt;BR&gt;
      1309X&lt;BR&gt;
      1309P&lt;BR&gt;
      1309W&lt;BR&gt;
      8024EKP&lt;BR&gt;
      8024EKW&lt;BR&gt;
      8024EKN&lt;BR&gt;
      RJ-9P/CT9P&lt;BR&gt;
      RJ-9W&lt;BR&gt;
      RJ-9X&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      3103P&lt;BR&gt;
      3103Y&lt;BR&gt;
      3103Z&lt;BR&gt;
      3103P&lt;BR&gt;
      3103Y&lt;BR&gt;
      3103Z&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      3105P/3106P&lt;BR&gt;
      3105W/3106W&lt;BR&gt;
      3105X/3106X&lt;BR&gt;
      3105Y/3106Y&lt;BR&gt;
      3105Z/3105Z&lt;BR&gt;
      3102P&lt;BR&gt;
      3102W&lt;BR&gt;
      3102X&lt;BR&gt;
      3102Y&lt;BR&gt;
      3102Z&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      EVMCBG&lt;BR&gt;
      EVMCCG&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      55-1-X&lt;BR&gt;
      55-4-X&lt;BR&gt;
      55-3-X&lt;BR&gt;
      55-2-X&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      50-2-X&lt;BR&gt;
      50-4-X&lt;BR&gt;
      50-3-X&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      64P&lt;BR&gt;
      64W&lt;BR&gt;
      64X&lt;BR&gt;
      64Y&lt;BR&gt;
      64Z&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      RT/RTR22&lt;BR&gt;
      RT/RTR22&lt;BR&gt;
      RT/RTR22&lt;BR&gt;
      RT/RTR22&lt;BR&gt;
      RJ/RJR22&lt;BR&gt;
      RJ/RJR22&lt;BR&gt;
      RJ/RJR22&lt;BR&gt;
      RT/RTR26&lt;BR&gt;
      RT/RTR26&lt;BR&gt;
      RT/RTR26&lt;BR&gt;
      RJ/RJR26&lt;BR&gt;
      RJ/RJR26&lt;BR&gt;
      RJ/RJR26&lt;BR&gt;
      RJ/RJR26&lt;BR&gt;
      RJ/RJR26&lt;BR&gt;
      RJ/RJR26&lt;BR&gt;
      RT/RTR24&lt;BR&gt;
      RT/RTR24&lt;BR&gt;
      RT/RTR24&lt;BR&gt;
      RJ/RJR24&lt;BR&gt;
      RJ/RJR24&lt;BR&gt;
      RJ/RJR24&lt;BR&gt;
      RJ/RJR24&lt;BR&gt;
      RJ/RJR24&lt;BR&gt;
      RJ/RJR24&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD COLSPAN=8&gt;&amp;nbsp;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD COLSPAN=8&gt;
      &lt;FONT SIZE=4 FACE=ARIAL&gt;&lt;B&gt;SINGLE TURN&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;BOURN&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;BI&amp;nbsp;TECH&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;DALE-VISHAY&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;PHILIPS/MEPCO&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;MURATA&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;PANASONIC&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;SPECTROL&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD ALIGN=CENTER&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;MILSPEC&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      3323P&lt;BR&gt;
      3323S&lt;BR&gt;
      3323W&lt;BR&gt;
      3329H&lt;BR&gt;
      3329P&lt;BR&gt;
      3329W&lt;BR&gt;
      3339H&lt;BR&gt;
      3339P&lt;BR&gt;
      3339W&lt;BR&gt;
      3352E&lt;BR&gt;
      3352H&lt;BR&gt;
      3352K&lt;BR&gt;
      3352P&lt;BR&gt;
      3352T&lt;BR&gt;
      3352V&lt;BR&gt;
      3352W&lt;BR&gt;
      3362H&lt;BR&gt;
      3362M&lt;BR&gt;
      3362P&lt;BR&gt;
      3362R&lt;BR&gt;
      3362S&lt;BR&gt;
      3362U&lt;BR&gt;
      3362W&lt;BR&gt;
      3362X&lt;BR&gt;
      3386B&lt;BR&gt;
      3386C&lt;BR&gt;
      3386F&lt;BR&gt;
      3386H&lt;BR&gt;
      3386K&lt;BR&gt;
      3386M&lt;BR&gt;
      3386P&lt;BR&gt;
      3386S&lt;BR&gt;
      3386W&lt;BR&gt;
      3386X&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      25P&lt;BR&gt;
      25S&lt;BR&gt;
      25RX&lt;BR&gt;
      82P&lt;BR&gt;
      82M&lt;BR&gt;
      82PA&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      91E&lt;BR&gt;
      91X&lt;BR&gt;
      91T&lt;BR&gt;
      91B&lt;BR&gt;
      91A&lt;BR&gt;
      91V&lt;BR&gt;
      91W&lt;BR&gt;
      25W&lt;BR&gt;
      25V&lt;BR&gt;
      25P&lt;BR&gt;
      -&lt;BR&gt;
      25S&lt;BR&gt;
      25U&lt;BR&gt;
      25RX&lt;BR&gt;
      25X&lt;BR&gt;
      72XW&lt;BR&gt;
      72XL&lt;BR&gt;
      72PM&lt;BR&gt;
      72RX&lt;BR&gt;
      -&lt;BR&gt;
      72PX&lt;BR&gt;
      72P&lt;BR&gt;
      72RXW&lt;BR&gt;
      72RXL&lt;BR&gt;
      72X&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      T7YB&lt;BR&gt;
      T7YA&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      TXD&lt;BR&gt;
      TYA&lt;BR&gt;
      TYP&lt;BR&gt;
      -&lt;BR&gt;
      TYD&lt;BR&gt;
      TX&lt;BR&gt;
      -&lt;BR&gt;
      150SX&lt;BR&gt;
      100SX&lt;BR&gt;
      102T&lt;BR&gt;
      101S&lt;BR&gt;
      190T&lt;BR&gt;
      150TX&lt;BR&gt;
      101&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      101SX&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      ET6P&lt;BR&gt;
      ET6S&lt;BR&gt;
      ET6X&lt;BR&gt;
      RJ-6W/8014EMW&lt;BR&gt;
      RJ-6P/8014EMP&lt;BR&gt;
      RJ-6X/8014EMX&lt;BR&gt;
      TM7W&lt;BR&gt;
      TM7P&lt;BR&gt;
      TM7X&lt;BR&gt;
      -&lt;BR&gt;
      8017SMS&lt;BR&gt;
      -&lt;BR&gt;
      8017SMB&lt;BR&gt;
      8017SMA&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      CT-6W&lt;BR&gt;
      CT-6H&lt;BR&gt;
      CT-6P&lt;BR&gt;
      CT-6R&lt;BR&gt;
      -&lt;BR&gt;
      CT-6V&lt;BR&gt;
      CT-6X&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      8038EKV&lt;BR&gt;
      -&lt;BR&gt;
      8038EKX&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      8038EKP&lt;BR&gt;
      8038EKZ&lt;BR&gt;
      8038EKW&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      3321H&lt;BR&gt;
      3321P&lt;BR&gt;
      3321N&lt;BR&gt;
      1102H&lt;BR&gt;
      1102P&lt;BR&gt;
      1102T&lt;BR&gt;
      RVA0911V304A&lt;BR&gt;
      -&lt;BR&gt;
      RVA0911H413A&lt;BR&gt;
      RVG0707V100A&lt;BR&gt;
      RVA0607V(H)306A&lt;BR&gt;
      RVA1214H213A&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      3104B&lt;BR&gt;
      3104C&lt;BR&gt;
      3104F&lt;BR&gt;
      3104H&lt;BR&gt;
      -&lt;BR&gt;
      3104M&lt;BR&gt;
      3104P&lt;BR&gt;
      3104S&lt;BR&gt;
      3104W&lt;BR&gt;
      3104X&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      EVMQ0G&lt;BR&gt;
      EVMQIG&lt;BR&gt;
      EVMQ3G&lt;BR&gt;
      EVMS0G&lt;BR&gt;
      EVMQ0G&lt;BR&gt;
      EVMG0G&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      EVMK4GA00B&lt;BR&gt;
      EVM30GA00B&lt;BR&gt;
      EVMK0GA00B&lt;BR&gt;
      EVM38GA00B&lt;BR&gt;
      EVMB6&lt;BR&gt;
      EVLQ0&lt;BR&gt;
      -&lt;BR&gt;
      EVMMSG&lt;BR&gt;
      EVMMBG&lt;BR&gt;
      EVMMAG&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      EVMMCS&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      EVMM1&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      EVMM0&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      EVMM3&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      62-3-1&lt;BR&gt;
      62-1-2&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      67R&lt;BR&gt;
      -&lt;BR&gt;
      67P&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      67X&lt;BR&gt;
      63V&lt;BR&gt;
      63S&lt;BR&gt;
      63M&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      63H&lt;BR&gt;
      63P&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      63X&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      RJ/RJR50&lt;BR&gt;
      RJ/RJR50&lt;BR&gt;
      RJ/RJR50&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
&lt;/TABLE&gt;
&lt;P&gt;&amp;nbsp;&lt;P&gt;
&lt;TABLE BORDER=0 CELLSPACING=1 CELLPADDING=3&gt;
  &lt;TR&gt;
    &lt;TD COLSPAN=7&gt;
      &lt;FONT color="#0000FF" SIZE=4 FACE=ARIAL&gt;&lt;B&gt;SMD TRIM-POT CROSS REFERENCE&lt;/B&gt;&lt;/FONT&gt;
      &lt;P&gt;
      &lt;FONT SIZE=4 FACE=ARIAL&gt;&lt;B&gt;MULTI-TURN&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;BOURNS&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;BI&amp;nbsp;TECH&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;DALE-VISHAY&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;PHILIPS/MEPCO&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;PANASONIC&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;TOCOS&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;AUX/KYOCERA&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      3224G&lt;BR&gt;
      3224J&lt;BR&gt;
      3224W&lt;BR&gt;
      3269P&lt;BR&gt;
      3269W&lt;BR&gt;
      3269X&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      44G&lt;BR&gt;
      44J&lt;BR&gt;
      44W&lt;BR&gt;
      84P&lt;BR&gt;
      84W&lt;BR&gt;
      84X&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      ST63Z&lt;BR&gt;
      ST63Y&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      ST5P&lt;BR&gt;
      ST5W&lt;BR&gt;
      ST5X&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD COLSPAN=7&gt;&amp;nbsp;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD COLSPAN=7&gt;
      &lt;FONT SIZE=4 FACE=ARIAL&gt;&lt;B&gt;SINGLE TURN&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;BOURNS&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;BI&amp;nbsp;TECH&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;DALE-VISHAY&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;PHILIPS/MEPCO&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;PANASONIC&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;TOCOS&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD&gt;
      &lt;FONT SIZE=3 FACE=ARIAL&gt;&lt;B&gt;AUX/KYOCERA&lt;/B&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
  &lt;TR&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      3314G&lt;BR&gt;
      3314J&lt;BR&gt;
      3364A/B&lt;BR&gt;
      3364C/D&lt;BR&gt;
      3364W/X&lt;BR&gt;
      3313G&lt;BR&gt;
      3313J&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      23B&lt;BR&gt;
      23A&lt;BR&gt;
      21X&lt;BR&gt;
      21W&lt;BR&gt;
      -&lt;BR&gt;
      22B&lt;BR&gt;
      22A&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      ST5YL/ST53YL&lt;BR&gt;
      ST5YJ/5T53YJ&lt;BR&gt;
      ST-23A&lt;BR&gt;
      ST-22B&lt;BR&gt;
      ST-22&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      ST-4B&lt;BR&gt;
      ST-4A&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      ST-3B&lt;BR&gt;
      ST-3A&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      EVM-6YS&lt;BR&gt;
      EVM-1E&lt;BR&gt;
      EVM-1G&lt;BR&gt;
      EVM-1D&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      G4B&lt;BR&gt;
      G4A&lt;BR&gt;
      TR04-3S1&lt;BR&gt;
      TRG04-2S1&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
    &lt;TD BGCOLOR="#cccccc" ALIGN=CENTER&gt;&lt;FONT FACE=ARIAL SIZE=3&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;
      DVR-43A&lt;BR&gt;
      CVR-42C&lt;BR&gt;
      CVR-42A/C&lt;BR&gt;
      -&lt;BR&gt;
      -&lt;BR&gt;&lt;/FONT&gt;
    &lt;/TD&gt;
  &lt;/TR&gt;
&lt;/TABLE&gt;
&lt;P&gt;
&lt;FONT SIZE=4 FACE=ARIAL&gt;&lt;B&gt;ALT =&amp;nbsp;ALTERNATE&lt;/B&gt;&lt;/FONT&gt;
&lt;P&gt;

&amp;nbsp;
&lt;P&gt;
&lt;/td&gt;
&lt;/tr&gt;
&lt;/table&gt;</description>
<packages>
<package name="R0402">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="-0.245" y1="0.224" x2="0.245" y2="0.224" width="0.1524" layer="51"/>
<wire x1="0.245" y1="-0.224" x2="-0.245" y2="-0.224" width="0.1524" layer="51"/>
<wire x1="-1.473" y1="0.483" x2="1.473" y2="0.483" width="0.0508" layer="39"/>
<wire x1="1.473" y1="0.483" x2="1.473" y2="-0.483" width="0.0508" layer="39"/>
<wire x1="1.473" y1="-0.483" x2="-1.473" y2="-0.483" width="0.0508" layer="39"/>
<wire x1="-1.473" y1="-0.483" x2="-1.473" y2="0.483" width="0.0508" layer="39"/>
<smd name="1" x="-0.65" y="0" dx="0.7" dy="0.9" layer="1"/>
<smd name="2" x="0.65" y="0" dx="0.7" dy="0.9" layer="1"/>
<text x="-0.635" y="0.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.554" y1="-0.3048" x2="-0.254" y2="0.2951" layer="51"/>
<rectangle x1="0.2588" y1="-0.3048" x2="0.5588" y2="0.2951" layer="51"/>
<rectangle x1="-0.1999" y1="-0.4001" x2="0.1999" y2="0.4001" layer="35"/>
</package>
<package name="R0603">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="-0.432" y1="-0.356" x2="0.432" y2="-0.356" width="0.1524" layer="51"/>
<wire x1="0.432" y1="0.356" x2="-0.432" y2="0.356" width="0.1524" layer="51"/>
<wire x1="-1.473" y1="0.983" x2="1.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.473" y1="0.983" x2="1.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.473" y1="-0.983" x2="-1.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.473" y1="-0.983" x2="-1.473" y2="0.983" width="0.0508" layer="39"/>
<smd name="1" x="-0.85" y="0" dx="1" dy="1.1" layer="1"/>
<smd name="2" x="0.85" y="0" dx="1" dy="1.1" layer="1"/>
<text x="-1.27" y="0.635" size="0.6096" layer="25">&gt;NAME</text>
<text x="-1.27" y="-1.27" size="0.6096" layer="27">&gt;VALUE</text>
<rectangle x1="0.4318" y1="-0.4318" x2="0.8382" y2="0.4318" layer="51"/>
<rectangle x1="-0.8382" y1="-0.4318" x2="-0.4318" y2="0.4318" layer="51"/>
<rectangle x1="-0.1999" y1="-0.4001" x2="0.1999" y2="0.4001" layer="35"/>
</package>
<package name="R0805">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;</description>
<wire x1="-0.41" y1="0.635" x2="0.41" y2="0.635" width="0.1524" layer="51"/>
<wire x1="-0.41" y1="-0.635" x2="0.41" y2="-0.635" width="0.1524" layer="51"/>
<wire x1="-1.973" y1="0.983" x2="1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="0.983" x2="1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="-0.983" x2="-1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.973" y1="-0.983" x2="-1.973" y2="0.983" width="0.0508" layer="39"/>
<smd name="1" x="-0.95" y="0" dx="1.3" dy="1.5" layer="1"/>
<smd name="2" x="0.95" y="0" dx="1.3" dy="1.5" layer="1"/>
<text x="-0.635" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="0.4064" y1="-0.6985" x2="1.0564" y2="0.7015" layer="51"/>
<rectangle x1="-1.0668" y1="-0.6985" x2="-0.4168" y2="0.7015" layer="51"/>
<rectangle x1="-0.1999" y1="-0.5001" x2="0.1999" y2="0.5001" layer="35"/>
</package>
<package name="R0805W">
<description>&lt;b&gt;RESISTOR&lt;/b&gt; wave soldering&lt;p&gt;</description>
<wire x1="-0.41" y1="0.635" x2="0.41" y2="0.635" width="0.1524" layer="51"/>
<wire x1="-0.41" y1="-0.635" x2="0.41" y2="-0.635" width="0.1524" layer="51"/>
<wire x1="-1.973" y1="0.983" x2="1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="0.983" x2="1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="-0.983" x2="-1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.973" y1="-0.983" x2="-1.973" y2="0.983" width="0.0508" layer="39"/>
<smd name="1" x="-1.0525" y="0" dx="1.5" dy="1" layer="1"/>
<smd name="2" x="1.0525" y="0" dx="1.5" dy="1" layer="1"/>
<text x="-0.635" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="0.4064" y1="-0.6985" x2="1.0564" y2="0.7015" layer="51"/>
<rectangle x1="-1.0668" y1="-0.6985" x2="-0.4168" y2="0.7015" layer="51"/>
<rectangle x1="-0.1999" y1="-0.5001" x2="0.1999" y2="0.5001" layer="35"/>
</package>
<package name="R1206">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="0.9525" y1="-0.8128" x2="-0.9652" y2="-0.8128" width="0.1524" layer="51"/>
<wire x1="0.9525" y1="0.8128" x2="-0.9652" y2="0.8128" width="0.1524" layer="51"/>
<wire x1="-2.473" y1="0.983" x2="2.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="0.983" x2="2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-0.983" x2="-2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-0.983" x2="-2.473" y2="0.983" width="0.0508" layer="39"/>
<smd name="2" x="1.422" y="0" dx="1.6" dy="1.803" layer="1"/>
<smd name="1" x="-1.422" y="0" dx="1.6" dy="1.803" layer="1"/>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.6891" y1="-0.8763" x2="-0.9525" y2="0.8763" layer="51"/>
<rectangle x1="0.9525" y1="-0.8763" x2="1.6891" y2="0.8763" layer="51"/>
<rectangle x1="-0.3" y1="-0.7" x2="0.3" y2="0.7" layer="35"/>
</package>
<package name="R1206W">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
wave soldering</description>
<wire x1="-0.913" y1="0.8" x2="0.888" y2="0.8" width="0.1524" layer="51"/>
<wire x1="-0.913" y1="-0.8" x2="0.888" y2="-0.8" width="0.1524" layer="51"/>
<wire x1="-2.473" y1="0.983" x2="2.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="0.983" x2="2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-0.983" x2="-2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-0.983" x2="-2.473" y2="0.983" width="0.0508" layer="39"/>
<smd name="1" x="-1.499" y="0" dx="1.8" dy="1.2" layer="1"/>
<smd name="2" x="1.499" y="0" dx="1.8" dy="1.2" layer="1"/>
<text x="-1.905" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.651" y1="-0.8763" x2="-0.9009" y2="0.8738" layer="51"/>
<rectangle x1="0.889" y1="-0.8763" x2="1.6391" y2="0.8738" layer="51"/>
<rectangle x1="-0.3" y1="-0.7" x2="0.3" y2="0.7" layer="35"/>
</package>
<package name="R1210">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="-0.913" y1="1.219" x2="0.939" y2="1.219" width="0.1524" layer="51"/>
<wire x1="-0.913" y1="-1.219" x2="0.939" y2="-1.219" width="0.1524" layer="51"/>
<wire x1="-2.473" y1="1.483" x2="2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="1.483" x2="2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-1.483" x2="-2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-1.483" x2="-2.473" y2="1.483" width="0.0508" layer="39"/>
<smd name="1" x="-1.4" y="0" dx="1.6" dy="2.7" layer="1"/>
<smd name="2" x="1.4" y="0" dx="1.6" dy="2.7" layer="1"/>
<text x="-2.54" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.651" y1="-1.3081" x2="-0.9009" y2="1.2918" layer="51"/>
<rectangle x1="0.9144" y1="-1.3081" x2="1.6645" y2="1.2918" layer="51"/>
<rectangle x1="-0.3" y1="-0.8999" x2="0.3" y2="0.8999" layer="35"/>
</package>
<package name="R1210W">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
wave soldering</description>
<wire x1="-0.913" y1="1.219" x2="0.939" y2="1.219" width="0.1524" layer="51"/>
<wire x1="-0.913" y1="-1.219" x2="0.939" y2="-1.219" width="0.1524" layer="51"/>
<wire x1="-2.473" y1="1.483" x2="2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="1.483" x2="2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-1.483" x2="-2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-1.483" x2="-2.473" y2="1.483" width="0.0508" layer="39"/>
<smd name="1" x="-1.499" y="0" dx="1.8" dy="1.8" layer="1"/>
<smd name="2" x="1.499" y="0" dx="1.8" dy="1.8" layer="1"/>
<text x="-2.54" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.651" y1="-1.3081" x2="-0.9009" y2="1.2918" layer="51"/>
<rectangle x1="0.9144" y1="-1.3081" x2="1.6645" y2="1.2918" layer="51"/>
<rectangle x1="-0.3" y1="-0.8001" x2="0.3" y2="0.8001" layer="35"/>
</package>
<package name="R2010">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="-1.662" y1="1.245" x2="1.662" y2="1.245" width="0.1524" layer="51"/>
<wire x1="-1.637" y1="-1.245" x2="1.687" y2="-1.245" width="0.1524" layer="51"/>
<wire x1="-3.473" y1="1.483" x2="3.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="3.473" y1="1.483" x2="3.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="3.473" y1="-1.483" x2="-3.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-3.473" y1="-1.483" x2="-3.473" y2="1.483" width="0.0508" layer="39"/>
<smd name="1" x="-2.2" y="0" dx="1.8" dy="2.7" layer="1"/>
<smd name="2" x="2.2" y="0" dx="1.8" dy="2.7" layer="1"/>
<text x="-3.175" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.175" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-2.4892" y1="-1.3208" x2="-1.6393" y2="1.3292" layer="51"/>
<rectangle x1="1.651" y1="-1.3208" x2="2.5009" y2="1.3292" layer="51"/>
</package>
<package name="R2010W">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
wave soldering</description>
<wire x1="-1.662" y1="1.245" x2="1.662" y2="1.245" width="0.1524" layer="51"/>
<wire x1="-1.637" y1="-1.245" x2="1.687" y2="-1.245" width="0.1524" layer="51"/>
<wire x1="-3.473" y1="1.483" x2="3.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="3.473" y1="1.483" x2="3.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="3.473" y1="-1.483" x2="-3.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-3.473" y1="-1.483" x2="-3.473" y2="1.483" width="0.0508" layer="39"/>
<smd name="1" x="-2.311" y="0" dx="2" dy="1.8" layer="1"/>
<smd name="2" x="2.311" y="0" dx="2" dy="1.8" layer="1"/>
<text x="-2.54" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-2.4892" y1="-1.3208" x2="-1.6393" y2="1.3292" layer="51"/>
<rectangle x1="1.651" y1="-1.3208" x2="2.5009" y2="1.3292" layer="51"/>
</package>
<package name="R2012">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="-0.41" y1="0.635" x2="0.41" y2="0.635" width="0.1524" layer="51"/>
<wire x1="-0.41" y1="-0.635" x2="0.41" y2="-0.635" width="0.1524" layer="51"/>
<wire x1="-1.973" y1="0.983" x2="1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="0.983" x2="1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="-0.983" x2="-1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.973" y1="-0.983" x2="-1.973" y2="0.983" width="0.0508" layer="39"/>
<smd name="1" x="-0.85" y="0" dx="1.3" dy="1.5" layer="1"/>
<smd name="2" x="0.85" y="0" dx="1.3" dy="1.5" layer="1"/>
<text x="-0.635" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="0.4064" y1="-0.6985" x2="1.0564" y2="0.7015" layer="51"/>
<rectangle x1="-1.0668" y1="-0.6985" x2="-0.4168" y2="0.7015" layer="51"/>
<rectangle x1="-0.1001" y1="-0.5999" x2="0.1001" y2="0.5999" layer="35"/>
</package>
<package name="R2012W">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
wave soldering</description>
<wire x1="-0.41" y1="0.635" x2="0.41" y2="0.635" width="0.1524" layer="51"/>
<wire x1="-0.41" y1="-0.635" x2="0.41" y2="-0.635" width="0.1524" layer="51"/>
<wire x1="-1.973" y1="0.983" x2="1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="0.983" x2="1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="-0.983" x2="-1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.973" y1="-0.983" x2="-1.973" y2="0.983" width="0.0508" layer="39"/>
<smd name="1" x="-0.94" y="0" dx="1.5" dy="1" layer="1"/>
<smd name="2" x="0.94" y="0" dx="1.5" dy="1" layer="1"/>
<text x="-0.635" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="0.4064" y1="-0.6985" x2="1.0564" y2="0.7015" layer="51"/>
<rectangle x1="-1.0668" y1="-0.6985" x2="-0.4168" y2="0.7015" layer="51"/>
<rectangle x1="-0.1001" y1="-0.5999" x2="0.1001" y2="0.5999" layer="35"/>
</package>
<package name="R2512">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="-2.362" y1="1.473" x2="2.387" y2="1.473" width="0.1524" layer="51"/>
<wire x1="-2.362" y1="-1.473" x2="2.387" y2="-1.473" width="0.1524" layer="51"/>
<wire x1="-3.973" y1="1.983" x2="3.973" y2="1.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="1.983" x2="3.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="-1.983" x2="-3.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="-3.973" y1="-1.983" x2="-3.973" y2="1.983" width="0.0508" layer="39"/>
<smd name="1" x="-2.8" y="0" dx="1.8" dy="3.2" layer="1"/>
<smd name="2" x="2.8" y="0" dx="1.8" dy="3.2" layer="1"/>
<text x="-2.54" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-3.2004" y1="-1.5494" x2="-2.3505" y2="1.5507" layer="51"/>
<rectangle x1="2.3622" y1="-1.5494" x2="3.2121" y2="1.5507" layer="51"/>
<rectangle x1="-0.5001" y1="-1" x2="0.5001" y2="1" layer="35"/>
</package>
<package name="R2512W">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
wave soldering</description>
<wire x1="-2.362" y1="1.473" x2="2.387" y2="1.473" width="0.1524" layer="51"/>
<wire x1="-2.362" y1="-1.473" x2="2.387" y2="-1.473" width="0.1524" layer="51"/>
<wire x1="-3.973" y1="1.983" x2="3.973" y2="1.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="1.983" x2="3.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="-1.983" x2="-3.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="-3.973" y1="-1.983" x2="-3.973" y2="1.983" width="0.0508" layer="39"/>
<smd name="1" x="-2.896" y="0" dx="2" dy="2.1" layer="1"/>
<smd name="2" x="2.896" y="0" dx="2" dy="2.1" layer="1"/>
<text x="-1.905" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-3.2004" y1="-1.5494" x2="-2.3505" y2="1.5507" layer="51"/>
<rectangle x1="2.3622" y1="-1.5494" x2="3.2121" y2="1.5507" layer="51"/>
<rectangle x1="-0.5001" y1="-1" x2="0.5001" y2="1" layer="35"/>
</package>
<package name="R3216">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="-0.913" y1="0.8" x2="0.888" y2="0.8" width="0.1524" layer="51"/>
<wire x1="-0.913" y1="-0.8" x2="0.888" y2="-0.8" width="0.1524" layer="51"/>
<wire x1="-2.473" y1="0.983" x2="2.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="0.983" x2="2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-0.983" x2="-2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-0.983" x2="-2.473" y2="0.983" width="0.0508" layer="39"/>
<smd name="1" x="-1.4" y="0" dx="1.6" dy="1.8" layer="1"/>
<smd name="2" x="1.4" y="0" dx="1.6" dy="1.8" layer="1"/>
<text x="-1.905" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.651" y1="-0.8763" x2="-0.9009" y2="0.8738" layer="51"/>
<rectangle x1="0.889" y1="-0.8763" x2="1.6391" y2="0.8738" layer="51"/>
<rectangle x1="-0.3" y1="-0.7" x2="0.3" y2="0.7" layer="35"/>
</package>
<package name="R3216W">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
wave soldering</description>
<wire x1="-0.913" y1="0.8" x2="0.888" y2="0.8" width="0.1524" layer="51"/>
<wire x1="-0.913" y1="-0.8" x2="0.888" y2="-0.8" width="0.1524" layer="51"/>
<wire x1="-2.473" y1="0.983" x2="2.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="0.983" x2="2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-0.983" x2="-2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-0.983" x2="-2.473" y2="0.983" width="0.0508" layer="39"/>
<smd name="1" x="-1.499" y="0" dx="1.8" dy="1.2" layer="1"/>
<smd name="2" x="1.499" y="0" dx="1.8" dy="1.2" layer="1"/>
<text x="-1.905" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.651" y1="-0.8763" x2="-0.9009" y2="0.8738" layer="51"/>
<rectangle x1="0.889" y1="-0.8763" x2="1.6391" y2="0.8738" layer="51"/>
<rectangle x1="-0.3" y1="-0.7" x2="0.3" y2="0.7" layer="35"/>
</package>
<package name="R3225">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="-0.913" y1="1.219" x2="0.939" y2="1.219" width="0.1524" layer="51"/>
<wire x1="-0.913" y1="-1.219" x2="0.939" y2="-1.219" width="0.1524" layer="51"/>
<wire x1="-2.473" y1="1.483" x2="2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="1.483" x2="2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-1.483" x2="-2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-1.483" x2="-2.473" y2="1.483" width="0.0508" layer="39"/>
<smd name="1" x="-1.4" y="0" dx="1.6" dy="2.7" layer="1"/>
<smd name="2" x="1.4" y="0" dx="1.6" dy="2.7" layer="1"/>
<text x="-2.54" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.651" y1="-1.3081" x2="-0.9009" y2="1.2918" layer="51"/>
<rectangle x1="0.9144" y1="-1.3081" x2="1.6645" y2="1.2918" layer="51"/>
<rectangle x1="-0.3" y1="-1" x2="0.3" y2="1" layer="35"/>
</package>
<package name="R3225W">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
wave soldering</description>
<wire x1="-0.913" y1="1.219" x2="0.939" y2="1.219" width="0.1524" layer="51"/>
<wire x1="-0.913" y1="-1.219" x2="0.939" y2="-1.219" width="0.1524" layer="51"/>
<wire x1="-2.473" y1="1.483" x2="2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="1.483" x2="2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-1.483" x2="-2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-1.483" x2="-2.473" y2="1.483" width="0.0508" layer="39"/>
<smd name="1" x="-1.499" y="0" dx="1.8" dy="1.8" layer="1"/>
<smd name="2" x="1.499" y="0" dx="1.8" dy="1.8" layer="1"/>
<text x="-1.905" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.651" y1="-1.3081" x2="-0.9009" y2="1.2918" layer="51"/>
<rectangle x1="0.9144" y1="-1.3081" x2="1.6645" y2="1.2918" layer="51"/>
<rectangle x1="-0.3" y1="-1" x2="0.3" y2="1" layer="35"/>
</package>
<package name="R5025">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;</description>
<wire x1="-1.662" y1="1.245" x2="1.662" y2="1.245" width="0.1524" layer="51"/>
<wire x1="-1.637" y1="-1.245" x2="1.687" y2="-1.245" width="0.1524" layer="51"/>
<wire x1="-3.473" y1="1.483" x2="3.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="3.473" y1="1.483" x2="3.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="3.473" y1="-1.483" x2="-3.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-3.473" y1="-1.483" x2="-3.473" y2="1.483" width="0.0508" layer="39"/>
<smd name="1" x="-2.2" y="0" dx="1.8" dy="2.7" layer="1"/>
<smd name="2" x="2.2" y="0" dx="1.8" dy="2.7" layer="1"/>
<text x="-3.175" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.175" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-2.4892" y1="-1.3208" x2="-1.6393" y2="1.3292" layer="51"/>
<rectangle x1="1.651" y1="-1.3208" x2="2.5009" y2="1.3292" layer="51"/>
<rectangle x1="-0.5001" y1="-1" x2="0.5001" y2="1" layer="35"/>
</package>
<package name="R5025W">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
wave soldering</description>
<wire x1="-1.662" y1="1.245" x2="1.662" y2="1.245" width="0.1524" layer="51"/>
<wire x1="-1.637" y1="-1.245" x2="1.687" y2="-1.245" width="0.1524" layer="51"/>
<wire x1="-3.473" y1="1.483" x2="3.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="3.473" y1="1.483" x2="3.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="3.473" y1="-1.483" x2="-3.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-3.473" y1="-1.483" x2="-3.473" y2="1.483" width="0.0508" layer="39"/>
<smd name="1" x="-2.311" y="0" dx="2" dy="1.8" layer="1"/>
<smd name="2" x="2.311" y="0" dx="2" dy="1.8" layer="1"/>
<text x="-3.175" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.175" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-2.4892" y1="-1.3208" x2="-1.6393" y2="1.3292" layer="51"/>
<rectangle x1="1.651" y1="-1.3208" x2="2.5009" y2="1.3292" layer="51"/>
<rectangle x1="-0.5001" y1="-1" x2="0.5001" y2="1" layer="35"/>
</package>
<package name="R6332">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
Source: http://download.siliconexpert.com/pdfs/2005/02/24/Semi_Ap/2/VSH/Resistor/dcrcwfre.pdf</description>
<wire x1="-2.362" y1="1.473" x2="2.387" y2="1.473" width="0.1524" layer="51"/>
<wire x1="-2.362" y1="-1.473" x2="2.387" y2="-1.473" width="0.1524" layer="51"/>
<wire x1="-3.973" y1="1.983" x2="3.973" y2="1.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="1.983" x2="3.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="-1.983" x2="-3.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="-3.973" y1="-1.983" x2="-3.973" y2="1.983" width="0.0508" layer="39"/>
<smd name="1" x="-3.1" y="0" dx="1" dy="3.2" layer="1"/>
<smd name="2" x="3.1" y="0" dx="1" dy="3.2" layer="1"/>
<text x="-2.54" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-3.2004" y1="-1.5494" x2="-2.3505" y2="1.5507" layer="51"/>
<rectangle x1="2.3622" y1="-1.5494" x2="3.2121" y2="1.5507" layer="51"/>
<rectangle x1="-0.5001" y1="-1" x2="0.5001" y2="1" layer="35"/>
</package>
<package name="R6332W">
<description>&lt;b&gt;RESISTOR&lt;/b&gt; wave soldering&lt;p&gt;
Source: http://download.siliconexpert.com/pdfs/2005/02/24/Semi_Ap/2/VSH/Resistor/dcrcwfre.pdf</description>
<wire x1="-2.362" y1="1.473" x2="2.387" y2="1.473" width="0.1524" layer="51"/>
<wire x1="-2.362" y1="-1.473" x2="2.387" y2="-1.473" width="0.1524" layer="51"/>
<wire x1="-3.973" y1="1.983" x2="3.973" y2="1.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="1.983" x2="3.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="3.973" y1="-1.983" x2="-3.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="-3.973" y1="-1.983" x2="-3.973" y2="1.983" width="0.0508" layer="39"/>
<smd name="1" x="-3.196" y="0" dx="1.2" dy="3.2" layer="1"/>
<smd name="2" x="3.196" y="0" dx="1.2" dy="3.2" layer="1"/>
<text x="-2.54" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-3.2004" y1="-1.5494" x2="-2.3505" y2="1.5507" layer="51"/>
<rectangle x1="2.3622" y1="-1.5494" x2="3.2121" y2="1.5507" layer="51"/>
<rectangle x1="-0.5001" y1="-1" x2="0.5001" y2="1" layer="35"/>
</package>
<package name="M0805">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
MELF 0.10 W</description>
<wire x1="-1.973" y1="0.983" x2="1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="-0.983" x2="-1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.973" y1="-0.983" x2="-1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="0.983" x2="1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="0.7112" y1="0.635" x2="-0.7112" y2="0.635" width="0.1524" layer="51"/>
<wire x1="0.7112" y1="-0.635" x2="-0.7112" y2="-0.635" width="0.1524" layer="51"/>
<smd name="1" x="-0.95" y="0" dx="1.3" dy="1.6" layer="1"/>
<smd name="2" x="0.95" y="0" dx="1.3" dy="1.6" layer="1"/>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.0414" y1="-0.7112" x2="-0.6858" y2="0.7112" layer="51"/>
<rectangle x1="0.6858" y1="-0.7112" x2="1.0414" y2="0.7112" layer="51"/>
<rectangle x1="-0.1999" y1="-0.5999" x2="0.1999" y2="0.5999" layer="35"/>
</package>
<package name="M1206">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
MELF 0.25 W</description>
<wire x1="-2.473" y1="1.483" x2="2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-1.483" x2="-2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-1.483" x2="-2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="1.483" x2="2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="1.143" y1="0.8382" x2="-1.143" y2="0.8382" width="0.1524" layer="51"/>
<wire x1="1.143" y1="-0.8382" x2="-1.143" y2="-0.8382" width="0.1524" layer="51"/>
<smd name="1" x="-1.4" y="0" dx="1.6" dy="2" layer="1"/>
<smd name="2" x="1.4" y="0" dx="1.6" dy="2" layer="1"/>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.7018" y1="-0.9144" x2="-1.1176" y2="0.9144" layer="51"/>
<rectangle x1="1.1176" y1="-0.9144" x2="1.7018" y2="0.9144" layer="51"/>
<rectangle x1="-0.3" y1="-0.8001" x2="0.3" y2="0.8001" layer="35"/>
</package>
<package name="M1406">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
MELF 0.12 W</description>
<wire x1="-2.973" y1="0.983" x2="2.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.973" y1="-0.983" x2="-2.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-2.973" y1="-0.983" x2="-2.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.973" y1="0.983" x2="2.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.3208" y1="0.762" x2="-1.3208" y2="0.762" width="0.1524" layer="51"/>
<wire x1="1.3208" y1="-0.762" x2="-1.3208" y2="-0.762" width="0.1524" layer="51"/>
<smd name="1" x="-1.7" y="0" dx="1.4" dy="1.8" layer="1"/>
<smd name="2" x="1.7" y="0" dx="1.4" dy="1.8" layer="1"/>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.8542" y1="-0.8382" x2="-1.2954" y2="0.8382" layer="51"/>
<rectangle x1="1.2954" y1="-0.8382" x2="1.8542" y2="0.8382" layer="51"/>
<rectangle x1="-0.3" y1="-0.7" x2="0.3" y2="0.7" layer="35"/>
</package>
<package name="M2012">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
MELF 0.10 W</description>
<wire x1="-1.973" y1="0.983" x2="1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="-0.983" x2="-1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.973" y1="-0.983" x2="-1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="0.983" x2="1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="0.7112" y1="0.635" x2="-0.7112" y2="0.635" width="0.1524" layer="51"/>
<wire x1="0.7112" y1="-0.635" x2="-0.7112" y2="-0.635" width="0.1524" layer="51"/>
<smd name="1" x="-0.95" y="0" dx="1.3" dy="1.6" layer="1"/>
<smd name="2" x="0.95" y="0" dx="1.3" dy="1.6" layer="1"/>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.0414" y1="-0.7112" x2="-0.6858" y2="0.7112" layer="51"/>
<rectangle x1="0.6858" y1="-0.7112" x2="1.0414" y2="0.7112" layer="51"/>
<rectangle x1="-0.1999" y1="-0.5999" x2="0.1999" y2="0.5999" layer="35"/>
</package>
<package name="M2309">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
MELF 0.25 W</description>
<wire x1="-4.473" y1="1.483" x2="4.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="4.473" y1="-1.483" x2="-4.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-4.473" y1="-1.483" x2="-4.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="4.473" y1="1.483" x2="4.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="2.413" y1="1.1684" x2="-2.4384" y2="1.1684" width="0.1524" layer="51"/>
<wire x1="2.413" y1="-1.1684" x2="-2.413" y2="-1.1684" width="0.1524" layer="51"/>
<smd name="1" x="-2.85" y="0" dx="1.5" dy="2.6" layer="1"/>
<smd name="2" x="2.85" y="0" dx="1.5" dy="2.6" layer="1"/>
<text x="-1.905" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-3.048" y1="-1.2446" x2="-2.3876" y2="1.2446" layer="51"/>
<rectangle x1="2.3876" y1="-1.2446" x2="3.048" y2="1.2446" layer="51"/>
<rectangle x1="-0.5001" y1="-1" x2="0.5001" y2="1" layer="35"/>
</package>
<package name="M3216">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
MELF 0.25 W</description>
<wire x1="-2.473" y1="1.483" x2="2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-1.483" x2="-2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-1.483" x2="-2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="1.483" x2="2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="1.143" y1="0.8382" x2="-1.143" y2="0.8382" width="0.1524" layer="51"/>
<wire x1="1.143" y1="-0.8382" x2="-1.143" y2="-0.8382" width="0.1524" layer="51"/>
<smd name="1" x="-1.4" y="0" dx="1.6" dy="2" layer="1"/>
<smd name="2" x="1.4" y="0" dx="1.6" dy="2" layer="1"/>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.7018" y1="-0.9144" x2="-1.1176" y2="0.9144" layer="51"/>
<rectangle x1="1.1176" y1="-0.9144" x2="1.7018" y2="0.9144" layer="51"/>
<rectangle x1="-0.3" y1="-0.8001" x2="0.3" y2="0.8001" layer="35"/>
</package>
<package name="M3516">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
MELF 0.12 W</description>
<wire x1="-2.973" y1="0.983" x2="2.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.973" y1="-0.983" x2="-2.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-2.973" y1="-0.983" x2="-2.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.973" y1="0.983" x2="2.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.3208" y1="0.762" x2="-1.3208" y2="0.762" width="0.1524" layer="51"/>
<wire x1="1.3208" y1="-0.762" x2="-1.3208" y2="-0.762" width="0.1524" layer="51"/>
<smd name="1" x="-1.7" y="0" dx="1.4" dy="1.8" layer="1"/>
<smd name="2" x="1.7" y="0" dx="1.4" dy="1.8" layer="1"/>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.8542" y1="-0.8382" x2="-1.2954" y2="0.8382" layer="51"/>
<rectangle x1="1.2954" y1="-0.8382" x2="1.8542" y2="0.8382" layer="51"/>
<rectangle x1="-0.4001" y1="-0.7" x2="0.4001" y2="0.7" layer="35"/>
</package>
<package name="M5923">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
MELF 0.25 W</description>
<wire x1="-4.473" y1="1.483" x2="4.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="4.473" y1="-1.483" x2="-4.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-4.473" y1="-1.483" x2="-4.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="4.473" y1="1.483" x2="4.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="2.413" y1="1.1684" x2="-2.4384" y2="1.1684" width="0.1524" layer="51"/>
<wire x1="2.413" y1="-1.1684" x2="-2.413" y2="-1.1684" width="0.1524" layer="51"/>
<smd name="1" x="-2.85" y="0" dx="1.5" dy="2.6" layer="1"/>
<smd name="2" x="2.85" y="0" dx="1.5" dy="2.6" layer="1"/>
<text x="-1.905" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-3.048" y1="-1.2446" x2="-2.3876" y2="1.2446" layer="51"/>
<rectangle x1="2.3876" y1="-1.2446" x2="3.048" y2="1.2446" layer="51"/>
<rectangle x1="-0.5001" y1="-1" x2="0.5001" y2="1" layer="35"/>
</package>
<package name="0204/5">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0204, grid 5 mm</description>
<wire x1="2.54" y1="0" x2="2.032" y2="0" width="0.508" layer="51"/>
<wire x1="-2.54" y1="0" x2="-2.032" y2="0" width="0.508" layer="51"/>
<wire x1="-1.778" y1="0.635" x2="-1.524" y2="0.889" width="0.1524" layer="21" curve="-90"/>
<wire x1="-1.778" y1="-0.635" x2="-1.524" y2="-0.889" width="0.1524" layer="21" curve="90"/>
<wire x1="1.524" y1="-0.889" x2="1.778" y2="-0.635" width="0.1524" layer="21" curve="90"/>
<wire x1="1.524" y1="0.889" x2="1.778" y2="0.635" width="0.1524" layer="21" curve="-90"/>
<wire x1="-1.778" y1="-0.635" x2="-1.778" y2="0.635" width="0.1524" layer="51"/>
<wire x1="-1.524" y1="0.889" x2="-1.27" y2="0.889" width="0.1524" layer="21"/>
<wire x1="-1.143" y1="0.762" x2="-1.27" y2="0.889" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="-0.889" x2="-1.27" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="-1.143" y1="-0.762" x2="-1.27" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="1.143" y1="0.762" x2="1.27" y2="0.889" width="0.1524" layer="21"/>
<wire x1="1.143" y1="0.762" x2="-1.143" y2="0.762" width="0.1524" layer="21"/>
<wire x1="1.143" y1="-0.762" x2="1.27" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="1.143" y1="-0.762" x2="-1.143" y2="-0.762" width="0.1524" layer="21"/>
<wire x1="1.524" y1="0.889" x2="1.27" y2="0.889" width="0.1524" layer="21"/>
<wire x1="1.524" y1="-0.889" x2="1.27" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="1.778" y1="-0.635" x2="1.778" y2="0.635" width="0.1524" layer="51"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.8128" shape="octagon"/>
<text x="-2.0066" y="1.1684" size="0.9906" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.1336" y="-2.3114" size="0.9906" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-2.032" y1="-0.254" x2="-1.778" y2="0.254" layer="51"/>
<rectangle x1="1.778" y1="-0.254" x2="2.032" y2="0.254" layer="51"/>
</package>
<package name="0204/7">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0204, grid 7.5 mm</description>
<wire x1="3.81" y1="0" x2="2.921" y2="0" width="0.508" layer="51"/>
<wire x1="-3.81" y1="0" x2="-2.921" y2="0" width="0.508" layer="51"/>
<wire x1="-2.54" y1="0.762" x2="-2.286" y2="1.016" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.54" y1="-0.762" x2="-2.286" y2="-1.016" width="0.1524" layer="21" curve="90"/>
<wire x1="2.286" y1="-1.016" x2="2.54" y2="-0.762" width="0.1524" layer="21" curve="90"/>
<wire x1="2.286" y1="1.016" x2="2.54" y2="0.762" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.54" y1="-0.762" x2="-2.54" y2="0.762" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="1.016" x2="-1.905" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-1.778" y1="0.889" x2="-1.905" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="-1.016" x2="-1.905" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-1.778" y1="-0.889" x2="-1.905" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="1.778" y1="0.889" x2="1.905" y2="1.016" width="0.1524" layer="21"/>
<wire x1="1.778" y1="0.889" x2="-1.778" y2="0.889" width="0.1524" layer="21"/>
<wire x1="1.778" y1="-0.889" x2="1.905" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="1.778" y1="-0.889" x2="-1.778" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="2.286" y1="1.016" x2="1.905" y2="1.016" width="0.1524" layer="21"/>
<wire x1="2.286" y1="-1.016" x2="1.905" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.762" x2="2.54" y2="0.762" width="0.1524" layer="21"/>
<pad name="1" x="-3.81" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="3.81" y="0" drill="0.8128" shape="octagon"/>
<text x="-2.54" y="1.2954" size="0.9906" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.6256" y="-0.4826" size="0.9906" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="2.54" y1="-0.254" x2="2.921" y2="0.254" layer="21"/>
<rectangle x1="-2.921" y1="-0.254" x2="-2.54" y2="0.254" layer="21"/>
</package>
<package name="0204V">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0204, grid 2.5 mm</description>
<wire x1="-1.27" y1="0" x2="1.27" y2="0" width="0.508" layer="51"/>
<wire x1="-0.127" y1="0" x2="0.127" y2="0" width="0.508" layer="21"/>
<circle x="-1.27" y="0" radius="0.889" width="0.1524" layer="51"/>
<circle x="-1.27" y="0" radius="0.635" width="0.0508" layer="51"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="-2.1336" y="1.1684" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.1336" y="-2.3114" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="0207/10">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0207, grid 10 mm</description>
<wire x1="5.08" y1="0" x2="4.064" y2="0" width="0.6096" layer="51"/>
<wire x1="-5.08" y1="0" x2="-4.064" y2="0" width="0.6096" layer="51"/>
<wire x1="-3.175" y1="0.889" x2="-2.921" y2="1.143" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-2.921" y2="-1.143" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="-1.143" x2="3.175" y2="-0.889" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="1.143" x2="3.175" y2="0.889" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-3.175" y2="0.889" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="1.143" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="1.016" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="-1.143" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="-1.016" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="-2.413" y2="1.016" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="-2.413" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="2.921" y1="1.143" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.921" y1="-1.143" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-0.889" x2="3.175" y2="0.889" width="0.1524" layer="21"/>
<pad name="1" x="-5.08" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="5.08" y="0" drill="0.8128" shape="octagon"/>
<text x="-3.048" y="1.524" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.2606" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="3.175" y1="-0.3048" x2="4.0386" y2="0.3048" layer="21"/>
<rectangle x1="-4.0386" y1="-0.3048" x2="-3.175" y2="0.3048" layer="21"/>
</package>
<package name="0207/12">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0207, grid 12 mm</description>
<wire x1="6.35" y1="0" x2="5.334" y2="0" width="0.6096" layer="51"/>
<wire x1="-6.35" y1="0" x2="-5.334" y2="0" width="0.6096" layer="51"/>
<wire x1="-3.175" y1="0.889" x2="-2.921" y2="1.143" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-2.921" y2="-1.143" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="-1.143" x2="3.175" y2="-0.889" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="1.143" x2="3.175" y2="0.889" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-3.175" y2="0.889" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="1.143" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="1.016" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="-1.143" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="-1.016" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="-2.413" y2="1.016" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="-2.413" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="2.921" y1="1.143" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.921" y1="-1.143" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-0.889" x2="3.175" y2="0.889" width="0.1524" layer="21"/>
<wire x1="4.445" y1="0" x2="4.064" y2="0" width="0.6096" layer="21"/>
<wire x1="-4.445" y1="0" x2="-4.064" y2="0" width="0.6096" layer="21"/>
<pad name="1" x="-6.35" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="6.35" y="0" drill="0.8128" shape="octagon"/>
<text x="-3.175" y="1.397" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.286" y="-0.6858" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="3.175" y1="-0.3048" x2="4.0386" y2="0.3048" layer="21"/>
<rectangle x1="-4.0386" y1="-0.3048" x2="-3.175" y2="0.3048" layer="21"/>
<rectangle x1="4.445" y1="-0.3048" x2="5.3086" y2="0.3048" layer="21"/>
<rectangle x1="-5.3086" y1="-0.3048" x2="-4.445" y2="0.3048" layer="21"/>
</package>
<package name="0207/15">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0207, grid 15mm</description>
<wire x1="7.62" y1="0" x2="6.604" y2="0" width="0.6096" layer="51"/>
<wire x1="-7.62" y1="0" x2="-6.604" y2="0" width="0.6096" layer="51"/>
<wire x1="-3.175" y1="0.889" x2="-2.921" y2="1.143" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-2.921" y2="-1.143" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="-1.143" x2="3.175" y2="-0.889" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="1.143" x2="3.175" y2="0.889" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-3.175" y2="0.889" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="1.143" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="1.016" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="-1.143" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="-1.016" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="-2.413" y2="1.016" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="-2.413" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="2.921" y1="1.143" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.921" y1="-1.143" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-0.889" x2="3.175" y2="0.889" width="0.1524" layer="21"/>
<wire x1="5.715" y1="0" x2="4.064" y2="0" width="0.6096" layer="21"/>
<wire x1="-5.715" y1="0" x2="-4.064" y2="0" width="0.6096" layer="21"/>
<pad name="1" x="-7.62" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="7.62" y="0" drill="0.8128" shape="octagon"/>
<text x="-3.175" y="1.397" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.286" y="-0.6858" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="3.175" y1="-0.3048" x2="4.0386" y2="0.3048" layer="21"/>
<rectangle x1="-4.0386" y1="-0.3048" x2="-3.175" y2="0.3048" layer="21"/>
<rectangle x1="5.715" y1="-0.3048" x2="6.5786" y2="0.3048" layer="21"/>
<rectangle x1="-6.5786" y1="-0.3048" x2="-5.715" y2="0.3048" layer="21"/>
</package>
<package name="0207/2V">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0207, grid 2.5 mm</description>
<wire x1="-1.27" y1="0" x2="-0.381" y2="0" width="0.6096" layer="51"/>
<wire x1="-0.254" y1="0" x2="0.254" y2="0" width="0.6096" layer="21"/>
<wire x1="0.381" y1="0" x2="1.27" y2="0" width="0.6096" layer="51"/>
<circle x="-1.27" y="0" radius="1.27" width="0.1524" layer="21"/>
<circle x="-1.27" y="0" radius="1.016" width="0.1524" layer="51"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="-0.0508" y="1.016" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-0.0508" y="-2.2352" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="0207/5V">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0207, grid 5 mm</description>
<wire x1="-2.54" y1="0" x2="-0.889" y2="0" width="0.6096" layer="51"/>
<wire x1="-0.762" y1="0" x2="0.762" y2="0" width="0.6096" layer="21"/>
<wire x1="0.889" y1="0" x2="2.54" y2="0" width="0.6096" layer="51"/>
<circle x="-2.54" y="0" radius="1.27" width="0.1016" layer="21"/>
<circle x="-2.54" y="0" radius="1.016" width="0.1524" layer="51"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.8128" shape="octagon"/>
<text x="-1.143" y="0.889" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.143" y="-2.159" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="0207/7">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0207, grid 7.5 mm</description>
<wire x1="-3.81" y1="0" x2="-3.429" y2="0" width="0.6096" layer="51"/>
<wire x1="-3.175" y1="0.889" x2="-2.921" y2="1.143" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-2.921" y2="-1.143" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="-1.143" x2="3.175" y2="-0.889" width="0.1524" layer="21" curve="90"/>
<wire x1="2.921" y1="1.143" x2="3.175" y2="0.889" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.175" y1="-0.889" x2="-3.175" y2="0.889" width="0.1524" layer="51"/>
<wire x1="-2.921" y1="1.143" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="1.016" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="-1.143" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="-1.016" x2="-2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="-2.413" y2="1.016" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="-2.413" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="2.921" y1="1.143" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.921" y1="-1.143" x2="2.54" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-0.889" x2="3.175" y2="0.889" width="0.1524" layer="51"/>
<wire x1="3.429" y1="0" x2="3.81" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-3.81" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="3.81" y="0" drill="0.8128" shape="octagon"/>
<text x="-2.54" y="1.397" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.286" y="-0.5588" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-3.429" y1="-0.3048" x2="-3.175" y2="0.3048" layer="51"/>
<rectangle x1="3.175" y1="-0.3048" x2="3.429" y2="0.3048" layer="51"/>
</package>
<package name="0309/10">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0309, grid 10mm</description>
<wire x1="-4.699" y1="0" x2="-5.08" y2="0" width="0.6096" layer="51"/>
<wire x1="-4.318" y1="1.27" x2="-4.064" y2="1.524" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.318" y1="-1.27" x2="-4.064" y2="-1.524" width="0.1524" layer="21" curve="90"/>
<wire x1="4.064" y1="-1.524" x2="4.318" y2="-1.27" width="0.1524" layer="21" curve="90"/>
<wire x1="4.064" y1="1.524" x2="4.318" y2="1.27" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.318" y1="-1.27" x2="-4.318" y2="1.27" width="0.1524" layer="51"/>
<wire x1="-4.064" y1="1.524" x2="-3.429" y2="1.524" width="0.1524" layer="21"/>
<wire x1="-3.302" y1="1.397" x2="-3.429" y2="1.524" width="0.1524" layer="21"/>
<wire x1="-4.064" y1="-1.524" x2="-3.429" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-3.302" y1="-1.397" x2="-3.429" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="3.302" y1="1.397" x2="3.429" y2="1.524" width="0.1524" layer="21"/>
<wire x1="3.302" y1="1.397" x2="-3.302" y2="1.397" width="0.1524" layer="21"/>
<wire x1="3.302" y1="-1.397" x2="3.429" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="3.302" y1="-1.397" x2="-3.302" y2="-1.397" width="0.1524" layer="21"/>
<wire x1="4.064" y1="1.524" x2="3.429" y2="1.524" width="0.1524" layer="21"/>
<wire x1="4.064" y1="-1.524" x2="3.429" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="4.318" y1="-1.27" x2="4.318" y2="1.27" width="0.1524" layer="51"/>
<wire x1="5.08" y1="0" x2="4.699" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-5.08" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="5.08" y="0" drill="0.8128" shape="octagon"/>
<text x="-4.191" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-0.6858" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-4.6228" y1="-0.3048" x2="-4.318" y2="0.3048" layer="51"/>
<rectangle x1="4.318" y1="-0.3048" x2="4.6228" y2="0.3048" layer="51"/>
</package>
<package name="0309/12">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0309, grid 12.5 mm</description>
<wire x1="6.35" y1="0" x2="5.08" y2="0" width="0.6096" layer="51"/>
<wire x1="-6.35" y1="0" x2="-5.08" y2="0" width="0.6096" layer="51"/>
<wire x1="-4.318" y1="1.27" x2="-4.064" y2="1.524" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.318" y1="-1.27" x2="-4.064" y2="-1.524" width="0.1524" layer="21" curve="90"/>
<wire x1="4.064" y1="-1.524" x2="4.318" y2="-1.27" width="0.1524" layer="21" curve="90"/>
<wire x1="4.064" y1="1.524" x2="4.318" y2="1.27" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.318" y1="-1.27" x2="-4.318" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-4.064" y1="1.524" x2="-3.429" y2="1.524" width="0.1524" layer="21"/>
<wire x1="-3.302" y1="1.397" x2="-3.429" y2="1.524" width="0.1524" layer="21"/>
<wire x1="-4.064" y1="-1.524" x2="-3.429" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-3.302" y1="-1.397" x2="-3.429" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="3.302" y1="1.397" x2="3.429" y2="1.524" width="0.1524" layer="21"/>
<wire x1="3.302" y1="1.397" x2="-3.302" y2="1.397" width="0.1524" layer="21"/>
<wire x1="3.302" y1="-1.397" x2="3.429" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="3.302" y1="-1.397" x2="-3.302" y2="-1.397" width="0.1524" layer="21"/>
<wire x1="4.064" y1="1.524" x2="3.429" y2="1.524" width="0.1524" layer="21"/>
<wire x1="4.064" y1="-1.524" x2="3.429" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="4.318" y1="-1.27" x2="4.318" y2="1.27" width="0.1524" layer="21"/>
<pad name="1" x="-6.35" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="6.35" y="0" drill="0.8128" shape="octagon"/>
<text x="-4.191" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-0.6858" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="4.318" y1="-0.3048" x2="5.1816" y2="0.3048" layer="21"/>
<rectangle x1="-5.1816" y1="-0.3048" x2="-4.318" y2="0.3048" layer="21"/>
</package>
<package name="0309V">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0309, grid 2.5 mm</description>
<wire x1="1.27" y1="0" x2="0.635" y2="0" width="0.6096" layer="51"/>
<wire x1="-0.635" y1="0" x2="-1.27" y2="0" width="0.6096" layer="51"/>
<circle x="-1.27" y="0" radius="1.524" width="0.1524" layer="21"/>
<circle x="-1.27" y="0" radius="0.762" width="0.1524" layer="51"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="0.254" y="1.016" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="0.254" y="-2.2098" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="0.254" y1="-0.3048" x2="0.5588" y2="0.3048" layer="51"/>
<rectangle x1="-0.635" y1="-0.3048" x2="-0.3302" y2="0.3048" layer="51"/>
<rectangle x1="-0.3302" y1="-0.3048" x2="0.254" y2="0.3048" layer="21"/>
</package>
<package name="0411/12">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0411, grid 12.5 mm</description>
<wire x1="6.35" y1="0" x2="5.461" y2="0" width="0.762" layer="51"/>
<wire x1="-6.35" y1="0" x2="-5.461" y2="0" width="0.762" layer="51"/>
<wire x1="5.08" y1="-1.651" x2="5.08" y2="1.651" width="0.1524" layer="21"/>
<wire x1="4.699" y1="2.032" x2="5.08" y2="1.651" width="0.1524" layer="21" curve="-90"/>
<wire x1="-5.08" y1="-1.651" x2="-4.699" y2="-2.032" width="0.1524" layer="21" curve="90"/>
<wire x1="4.699" y1="-2.032" x2="5.08" y2="-1.651" width="0.1524" layer="21" curve="90"/>
<wire x1="-5.08" y1="1.651" x2="-4.699" y2="2.032" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.699" y1="2.032" x2="4.064" y2="2.032" width="0.1524" layer="21"/>
<wire x1="3.937" y1="1.905" x2="4.064" y2="2.032" width="0.1524" layer="21"/>
<wire x1="4.699" y1="-2.032" x2="4.064" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="3.937" y1="-1.905" x2="4.064" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="-3.937" y1="1.905" x2="-4.064" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-3.937" y1="1.905" x2="3.937" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-3.937" y1="-1.905" x2="-4.064" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="-3.937" y1="-1.905" x2="3.937" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="1.651" x2="-5.08" y2="-1.651" width="0.1524" layer="21"/>
<wire x1="-4.699" y1="2.032" x2="-4.064" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-4.699" y1="-2.032" x2="-4.064" y2="-2.032" width="0.1524" layer="21"/>
<pad name="1" x="-6.35" y="0" drill="0.9144" shape="octagon"/>
<pad name="2" x="6.35" y="0" drill="0.9144" shape="octagon"/>
<text x="-5.08" y="2.413" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.5814" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-5.3594" y1="-0.381" x2="-5.08" y2="0.381" layer="21"/>
<rectangle x1="5.08" y1="-0.381" x2="5.3594" y2="0.381" layer="21"/>
</package>
<package name="0411/15">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0411, grid 15 mm</description>
<wire x1="5.08" y1="-1.651" x2="5.08" y2="1.651" width="0.1524" layer="21"/>
<wire x1="4.699" y1="2.032" x2="5.08" y2="1.651" width="0.1524" layer="21" curve="-90"/>
<wire x1="-5.08" y1="-1.651" x2="-4.699" y2="-2.032" width="0.1524" layer="21" curve="90"/>
<wire x1="4.699" y1="-2.032" x2="5.08" y2="-1.651" width="0.1524" layer="21" curve="90"/>
<wire x1="-5.08" y1="1.651" x2="-4.699" y2="2.032" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.699" y1="2.032" x2="4.064" y2="2.032" width="0.1524" layer="21"/>
<wire x1="3.937" y1="1.905" x2="4.064" y2="2.032" width="0.1524" layer="21"/>
<wire x1="4.699" y1="-2.032" x2="4.064" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="3.937" y1="-1.905" x2="4.064" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="-3.937" y1="1.905" x2="-4.064" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-3.937" y1="1.905" x2="3.937" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-3.937" y1="-1.905" x2="-4.064" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="-3.937" y1="-1.905" x2="3.937" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="1.651" x2="-5.08" y2="-1.651" width="0.1524" layer="21"/>
<wire x1="-4.699" y1="2.032" x2="-4.064" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-4.699" y1="-2.032" x2="-4.064" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="0" x2="-6.35" y2="0" width="0.762" layer="51"/>
<wire x1="6.35" y1="0" x2="7.62" y2="0" width="0.762" layer="51"/>
<pad name="1" x="-7.62" y="0" drill="0.9144" shape="octagon"/>
<pad name="2" x="7.62" y="0" drill="0.9144" shape="octagon"/>
<text x="-5.08" y="2.413" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.5814" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="5.08" y1="-0.381" x2="6.477" y2="0.381" layer="21"/>
<rectangle x1="-6.477" y1="-0.381" x2="-5.08" y2="0.381" layer="21"/>
</package>
<package name="0411V">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0411, grid 3.81 mm</description>
<wire x1="1.27" y1="0" x2="0.3048" y2="0" width="0.762" layer="51"/>
<wire x1="-1.5748" y1="0" x2="-2.54" y2="0" width="0.762" layer="51"/>
<circle x="-2.54" y="0" radius="2.032" width="0.1524" layer="21"/>
<circle x="-2.54" y="0" radius="1.016" width="0.1524" layer="51"/>
<pad name="1" x="-2.54" y="0" drill="0.9144" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="0.9144" shape="octagon"/>
<text x="-0.508" y="1.143" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-0.5334" y="-2.413" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-1.4732" y1="-0.381" x2="0.2032" y2="0.381" layer="21"/>
</package>
<package name="0414/15">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0414, grid 15 mm</description>
<wire x1="7.62" y1="0" x2="6.604" y2="0" width="0.8128" layer="51"/>
<wire x1="-7.62" y1="0" x2="-6.604" y2="0" width="0.8128" layer="51"/>
<wire x1="-6.096" y1="1.905" x2="-5.842" y2="2.159" width="0.1524" layer="21" curve="-90"/>
<wire x1="-6.096" y1="-1.905" x2="-5.842" y2="-2.159" width="0.1524" layer="21" curve="90"/>
<wire x1="5.842" y1="-2.159" x2="6.096" y2="-1.905" width="0.1524" layer="21" curve="90"/>
<wire x1="5.842" y1="2.159" x2="6.096" y2="1.905" width="0.1524" layer="21" curve="-90"/>
<wire x1="-6.096" y1="-1.905" x2="-6.096" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-5.842" y1="2.159" x2="-4.953" y2="2.159" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="2.032" x2="-4.953" y2="2.159" width="0.1524" layer="21"/>
<wire x1="-5.842" y1="-2.159" x2="-4.953" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="-2.032" x2="-4.953" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="4.826" y1="2.032" x2="4.953" y2="2.159" width="0.1524" layer="21"/>
<wire x1="4.826" y1="2.032" x2="-4.826" y2="2.032" width="0.1524" layer="21"/>
<wire x1="4.826" y1="-2.032" x2="4.953" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="4.826" y1="-2.032" x2="-4.826" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="5.842" y1="2.159" x2="4.953" y2="2.159" width="0.1524" layer="21"/>
<wire x1="5.842" y1="-2.159" x2="4.953" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="6.096" y1="-1.905" x2="6.096" y2="1.905" width="0.1524" layer="21"/>
<pad name="1" x="-7.62" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="7.62" y="0" drill="1.016" shape="octagon"/>
<text x="-6.096" y="2.5654" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.318" y="-0.5842" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="6.096" y1="-0.4064" x2="6.5024" y2="0.4064" layer="21"/>
<rectangle x1="-6.5024" y1="-0.4064" x2="-6.096" y2="0.4064" layer="21"/>
</package>
<package name="0414V">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0414, grid 5 mm</description>
<wire x1="2.54" y1="0" x2="1.397" y2="0" width="0.8128" layer="51"/>
<wire x1="-2.54" y1="0" x2="-1.397" y2="0" width="0.8128" layer="51"/>
<circle x="-2.54" y="0" radius="2.159" width="0.1524" layer="21"/>
<circle x="-2.54" y="0" radius="1.143" width="0.1524" layer="51"/>
<pad name="1" x="-2.54" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1.016" shape="octagon"/>
<text x="-0.381" y="1.1684" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-0.381" y="-2.3622" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-1.2954" y1="-0.4064" x2="1.2954" y2="0.4064" layer="21"/>
</package>
<package name="0617/17">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0617, grid 17.5 mm</description>
<wire x1="-8.89" y1="0" x2="-8.636" y2="0" width="0.8128" layer="51"/>
<wire x1="-7.874" y1="3.048" x2="-6.985" y2="3.048" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="2.794" x2="-6.985" y2="3.048" width="0.1524" layer="21"/>
<wire x1="-7.874" y1="-3.048" x2="-6.985" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="-2.794" x2="-6.985" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="6.731" y1="2.794" x2="6.985" y2="3.048" width="0.1524" layer="21"/>
<wire x1="6.731" y1="2.794" x2="-6.731" y2="2.794" width="0.1524" layer="21"/>
<wire x1="6.731" y1="-2.794" x2="6.985" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="6.731" y1="-2.794" x2="-6.731" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="7.874" y1="3.048" x2="6.985" y2="3.048" width="0.1524" layer="21"/>
<wire x1="7.874" y1="-3.048" x2="6.985" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="-2.667" x2="-8.255" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-8.255" y1="1.016" x2="-8.255" y2="-1.016" width="0.1524" layer="51"/>
<wire x1="-8.255" y1="1.016" x2="-8.255" y2="2.667" width="0.1524" layer="21"/>
<wire x1="8.255" y1="-2.667" x2="8.255" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="8.255" y1="1.016" x2="8.255" y2="-1.016" width="0.1524" layer="51"/>
<wire x1="8.255" y1="1.016" x2="8.255" y2="2.667" width="0.1524" layer="21"/>
<wire x1="8.636" y1="0" x2="8.89" y2="0" width="0.8128" layer="51"/>
<wire x1="-8.255" y1="2.667" x2="-7.874" y2="3.048" width="0.1524" layer="21" curve="-90"/>
<wire x1="7.874" y1="3.048" x2="8.255" y2="2.667" width="0.1524" layer="21" curve="-90"/>
<wire x1="-8.255" y1="-2.667" x2="-7.874" y2="-3.048" width="0.1524" layer="21" curve="90"/>
<wire x1="7.874" y1="-3.048" x2="8.255" y2="-2.667" width="0.1524" layer="21" curve="90"/>
<pad name="1" x="-8.89" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="8.89" y="0" drill="1.016" shape="octagon"/>
<text x="-8.128" y="3.4544" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-6.096" y="-0.7112" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-8.5344" y1="-0.4064" x2="-8.2296" y2="0.4064" layer="51"/>
<rectangle x1="8.2296" y1="-0.4064" x2="8.5344" y2="0.4064" layer="51"/>
</package>
<package name="0617/22">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0617, grid 22.5 mm</description>
<wire x1="-10.287" y1="0" x2="-11.43" y2="0" width="0.8128" layer="51"/>
<wire x1="-8.255" y1="-2.667" x2="-8.255" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-7.874" y1="3.048" x2="-6.985" y2="3.048" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="2.794" x2="-6.985" y2="3.048" width="0.1524" layer="21"/>
<wire x1="-7.874" y1="-3.048" x2="-6.985" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="-2.794" x2="-6.985" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="6.731" y1="2.794" x2="6.985" y2="3.048" width="0.1524" layer="21"/>
<wire x1="6.731" y1="2.794" x2="-6.731" y2="2.794" width="0.1524" layer="21"/>
<wire x1="6.731" y1="-2.794" x2="6.985" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="6.731" y1="-2.794" x2="-6.731" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="7.874" y1="3.048" x2="6.985" y2="3.048" width="0.1524" layer="21"/>
<wire x1="7.874" y1="-3.048" x2="6.985" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="8.255" y1="-2.667" x2="8.255" y2="2.667" width="0.1524" layer="21"/>
<wire x1="11.43" y1="0" x2="10.287" y2="0" width="0.8128" layer="51"/>
<wire x1="-8.255" y1="2.667" x2="-7.874" y2="3.048" width="0.1524" layer="21" curve="-90"/>
<wire x1="-8.255" y1="-2.667" x2="-7.874" y2="-3.048" width="0.1524" layer="21" curve="90"/>
<wire x1="7.874" y1="3.048" x2="8.255" y2="2.667" width="0.1524" layer="21" curve="-90"/>
<wire x1="7.874" y1="-3.048" x2="8.255" y2="-2.667" width="0.1524" layer="21" curve="90"/>
<pad name="1" x="-11.43" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="11.43" y="0" drill="1.016" shape="octagon"/>
<text x="-8.255" y="3.4544" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-6.477" y="-0.5842" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-10.1854" y1="-0.4064" x2="-8.255" y2="0.4064" layer="21"/>
<rectangle x1="8.255" y1="-0.4064" x2="10.1854" y2="0.4064" layer="21"/>
</package>
<package name="0617V">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0617, grid 5 mm</description>
<wire x1="-2.54" y1="0" x2="-1.27" y2="0" width="0.8128" layer="51"/>
<wire x1="1.27" y1="0" x2="2.54" y2="0" width="0.8128" layer="51"/>
<circle x="-2.54" y="0" radius="3.048" width="0.1524" layer="21"/>
<circle x="-2.54" y="0" radius="1.143" width="0.1524" layer="51"/>
<pad name="1" x="-2.54" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1.016" shape="octagon"/>
<text x="0.635" y="1.4224" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="0.635" y="-2.6162" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-1.3208" y1="-0.4064" x2="1.3208" y2="0.4064" layer="21"/>
</package>
<package name="0922/22">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0922, grid 22.5 mm</description>
<wire x1="11.43" y1="0" x2="10.795" y2="0" width="0.8128" layer="51"/>
<wire x1="-11.43" y1="0" x2="-10.795" y2="0" width="0.8128" layer="51"/>
<wire x1="-10.16" y1="-4.191" x2="-10.16" y2="4.191" width="0.1524" layer="21"/>
<wire x1="-9.779" y1="4.572" x2="-8.89" y2="4.572" width="0.1524" layer="21"/>
<wire x1="-8.636" y1="4.318" x2="-8.89" y2="4.572" width="0.1524" layer="21"/>
<wire x1="-9.779" y1="-4.572" x2="-8.89" y2="-4.572" width="0.1524" layer="21"/>
<wire x1="-8.636" y1="-4.318" x2="-8.89" y2="-4.572" width="0.1524" layer="21"/>
<wire x1="8.636" y1="4.318" x2="8.89" y2="4.572" width="0.1524" layer="21"/>
<wire x1="8.636" y1="4.318" x2="-8.636" y2="4.318" width="0.1524" layer="21"/>
<wire x1="8.636" y1="-4.318" x2="8.89" y2="-4.572" width="0.1524" layer="21"/>
<wire x1="8.636" y1="-4.318" x2="-8.636" y2="-4.318" width="0.1524" layer="21"/>
<wire x1="9.779" y1="4.572" x2="8.89" y2="4.572" width="0.1524" layer="21"/>
<wire x1="9.779" y1="-4.572" x2="8.89" y2="-4.572" width="0.1524" layer="21"/>
<wire x1="10.16" y1="-4.191" x2="10.16" y2="4.191" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="-4.191" x2="-9.779" y2="-4.572" width="0.1524" layer="21" curve="90"/>
<wire x1="-10.16" y1="4.191" x2="-9.779" y2="4.572" width="0.1524" layer="21" curve="-90"/>
<wire x1="9.779" y1="-4.572" x2="10.16" y2="-4.191" width="0.1524" layer="21" curve="90"/>
<wire x1="9.779" y1="4.572" x2="10.16" y2="4.191" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-11.43" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="11.43" y="0" drill="1.016" shape="octagon"/>
<text x="-10.16" y="5.1054" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-6.477" y="-0.5842" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-10.7188" y1="-0.4064" x2="-10.16" y2="0.4064" layer="51"/>
<rectangle x1="10.16" y1="-0.4064" x2="10.3124" y2="0.4064" layer="21"/>
<rectangle x1="-10.3124" y1="-0.4064" x2="-10.16" y2="0.4064" layer="21"/>
<rectangle x1="10.16" y1="-0.4064" x2="10.7188" y2="0.4064" layer="51"/>
</package>
<package name="P0613V">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0613, grid 5 mm</description>
<wire x1="2.54" y1="0" x2="1.397" y2="0" width="0.8128" layer="51"/>
<wire x1="-2.54" y1="0" x2="-1.397" y2="0" width="0.8128" layer="51"/>
<circle x="-2.54" y="0" radius="2.286" width="0.1524" layer="21"/>
<circle x="-2.54" y="0" radius="1.143" width="0.1524" layer="51"/>
<pad name="1" x="-2.54" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1.016" shape="octagon"/>
<text x="-0.254" y="1.143" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-0.254" y="-2.413" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-1.2954" y1="-0.4064" x2="1.3208" y2="0.4064" layer="21"/>
</package>
<package name="P0613/15">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0613, grid 15 mm</description>
<wire x1="7.62" y1="0" x2="6.985" y2="0" width="0.8128" layer="51"/>
<wire x1="-7.62" y1="0" x2="-6.985" y2="0" width="0.8128" layer="51"/>
<wire x1="-6.477" y1="2.032" x2="-6.223" y2="2.286" width="0.1524" layer="21" curve="-90"/>
<wire x1="-6.477" y1="-2.032" x2="-6.223" y2="-2.286" width="0.1524" layer="21" curve="90"/>
<wire x1="6.223" y1="-2.286" x2="6.477" y2="-2.032" width="0.1524" layer="21" curve="90"/>
<wire x1="6.223" y1="2.286" x2="6.477" y2="2.032" width="0.1524" layer="21" curve="-90"/>
<wire x1="-6.223" y1="2.286" x2="-5.334" y2="2.286" width="0.1524" layer="21"/>
<wire x1="-5.207" y1="2.159" x2="-5.334" y2="2.286" width="0.1524" layer="21"/>
<wire x1="-6.223" y1="-2.286" x2="-5.334" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-5.207" y1="-2.159" x2="-5.334" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="5.207" y1="2.159" x2="5.334" y2="2.286" width="0.1524" layer="21"/>
<wire x1="5.207" y1="2.159" x2="-5.207" y2="2.159" width="0.1524" layer="21"/>
<wire x1="5.207" y1="-2.159" x2="5.334" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="5.207" y1="-2.159" x2="-5.207" y2="-2.159" width="0.1524" layer="21"/>
<wire x1="6.223" y1="2.286" x2="5.334" y2="2.286" width="0.1524" layer="21"/>
<wire x1="6.223" y1="-2.286" x2="5.334" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="6.477" y1="-0.635" x2="6.477" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="6.477" y1="-0.635" x2="6.477" y2="0.635" width="0.1524" layer="51"/>
<wire x1="6.477" y1="2.032" x2="6.477" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-6.477" y1="-2.032" x2="-6.477" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-6.477" y1="0.635" x2="-6.477" y2="-0.635" width="0.1524" layer="51"/>
<wire x1="-6.477" y1="0.635" x2="-6.477" y2="2.032" width="0.1524" layer="21"/>
<pad name="1" x="-7.62" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="7.62" y="0" drill="1.016" shape="octagon"/>
<text x="-6.477" y="2.6924" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.318" y="-0.7112" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-7.0358" y1="-0.4064" x2="-6.477" y2="0.4064" layer="51"/>
<rectangle x1="6.477" y1="-0.4064" x2="7.0358" y2="0.4064" layer="51"/>
</package>
<package name="P0817/22">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0817, grid 22.5 mm</description>
<wire x1="-10.414" y1="0" x2="-11.43" y2="0" width="0.8128" layer="51"/>
<wire x1="-8.509" y1="-3.429" x2="-8.509" y2="3.429" width="0.1524" layer="21"/>
<wire x1="-8.128" y1="3.81" x2="-7.239" y2="3.81" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="3.556" x2="-7.239" y2="3.81" width="0.1524" layer="21"/>
<wire x1="-8.128" y1="-3.81" x2="-7.239" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="-3.556" x2="-7.239" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="6.985" y1="3.556" x2="7.239" y2="3.81" width="0.1524" layer="21"/>
<wire x1="6.985" y1="3.556" x2="-6.985" y2="3.556" width="0.1524" layer="21"/>
<wire x1="6.985" y1="-3.556" x2="7.239" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="6.985" y1="-3.556" x2="-6.985" y2="-3.556" width="0.1524" layer="21"/>
<wire x1="8.128" y1="3.81" x2="7.239" y2="3.81" width="0.1524" layer="21"/>
<wire x1="8.128" y1="-3.81" x2="7.239" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="8.509" y1="-3.429" x2="8.509" y2="3.429" width="0.1524" layer="21"/>
<wire x1="11.43" y1="0" x2="10.414" y2="0" width="0.8128" layer="51"/>
<wire x1="-8.509" y1="3.429" x2="-8.128" y2="3.81" width="0.1524" layer="21" curve="-90"/>
<wire x1="-8.509" y1="-3.429" x2="-8.128" y2="-3.81" width="0.1524" layer="21" curve="90"/>
<wire x1="8.128" y1="3.81" x2="8.509" y2="3.429" width="0.1524" layer="21" curve="-90"/>
<wire x1="8.128" y1="-3.81" x2="8.509" y2="-3.429" width="0.1524" layer="21" curve="90"/>
<pad name="1" x="-11.43" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="11.43" y="0" drill="1.016" shape="octagon"/>
<text x="-8.382" y="4.2164" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-6.223" y="-0.5842" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="6.604" y="-2.2606" size="1.27" layer="51" ratio="10" rot="R90">0817</text>
<rectangle x1="8.509" y1="-0.4064" x2="10.3124" y2="0.4064" layer="21"/>
<rectangle x1="-10.3124" y1="-0.4064" x2="-8.509" y2="0.4064" layer="21"/>
</package>
<package name="P0817V">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0817, grid 6.35 mm</description>
<wire x1="-3.81" y1="0" x2="-5.08" y2="0" width="0.8128" layer="51"/>
<wire x1="1.27" y1="0" x2="0" y2="0" width="0.8128" layer="51"/>
<circle x="-5.08" y="0" radius="3.81" width="0.1524" layer="21"/>
<circle x="-5.08" y="0" radius="1.27" width="0.1524" layer="51"/>
<pad name="1" x="-5.08" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="1.016" shape="octagon"/>
<text x="-1.016" y="1.27" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.016" y="-2.54" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-6.858" y="2.032" size="1.016" layer="21" ratio="12">0817</text>
<rectangle x1="-3.81" y1="-0.4064" x2="0" y2="0.4064" layer="21"/>
</package>
<package name="V234/12">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type V234, grid 12.5 mm</description>
<wire x1="-4.953" y1="1.524" x2="-4.699" y2="1.778" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.699" y1="1.778" x2="4.953" y2="1.524" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.699" y1="-1.778" x2="4.953" y2="-1.524" width="0.1524" layer="21" curve="90"/>
<wire x1="-4.953" y1="-1.524" x2="-4.699" y2="-1.778" width="0.1524" layer="21" curve="90"/>
<wire x1="-4.699" y1="1.778" x2="4.699" y2="1.778" width="0.1524" layer="21"/>
<wire x1="-4.953" y1="1.524" x2="-4.953" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="4.699" y1="-1.778" x2="-4.699" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="4.953" y1="1.524" x2="4.953" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="6.35" y1="0" x2="5.461" y2="0" width="0.8128" layer="51"/>
<wire x1="-6.35" y1="0" x2="-5.461" y2="0" width="0.8128" layer="51"/>
<pad name="1" x="-6.35" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="6.35" y="0" drill="1.016" shape="octagon"/>
<text x="-4.953" y="2.159" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.81" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="4.953" y1="-0.4064" x2="5.4102" y2="0.4064" layer="21"/>
<rectangle x1="-5.4102" y1="-0.4064" x2="-4.953" y2="0.4064" layer="21"/>
</package>
<package name="V235/17">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type V235, grid 17.78 mm</description>
<wire x1="-6.731" y1="2.921" x2="6.731" y2="2.921" width="0.1524" layer="21"/>
<wire x1="-7.112" y1="2.54" x2="-7.112" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="6.731" y1="-2.921" x2="-6.731" y2="-2.921" width="0.1524" layer="21"/>
<wire x1="7.112" y1="2.54" x2="7.112" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="8.89" y1="0" x2="7.874" y2="0" width="1.016" layer="51"/>
<wire x1="-7.874" y1="0" x2="-8.89" y2="0" width="1.016" layer="51"/>
<wire x1="-7.112" y1="-2.54" x2="-6.731" y2="-2.921" width="0.1524" layer="21" curve="90"/>
<wire x1="6.731" y1="2.921" x2="7.112" y2="2.54" width="0.1524" layer="21" curve="-90"/>
<wire x1="6.731" y1="-2.921" x2="7.112" y2="-2.54" width="0.1524" layer="21" curve="90"/>
<wire x1="-7.112" y1="2.54" x2="-6.731" y2="2.921" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-8.89" y="0" drill="1.1938" shape="octagon"/>
<pad name="2" x="8.89" y="0" drill="1.1938" shape="octagon"/>
<text x="-6.858" y="3.302" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.842" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="7.112" y1="-0.508" x2="7.747" y2="0.508" layer="21"/>
<rectangle x1="-7.747" y1="-0.508" x2="-7.112" y2="0.508" layer="21"/>
</package>
<package name="V526-0">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type V526-0, grid 2.5 mm</description>
<wire x1="-2.54" y1="1.016" x2="-2.286" y2="1.27" width="0.1524" layer="21" curve="-90"/>
<wire x1="2.286" y1="1.27" x2="2.54" y2="1.016" width="0.1524" layer="21" curve="-90"/>
<wire x1="2.286" y1="-1.27" x2="2.54" y2="-1.016" width="0.1524" layer="21" curve="90"/>
<wire x1="-2.54" y1="-1.016" x2="-2.286" y2="-1.27" width="0.1524" layer="21" curve="90"/>
<wire x1="2.286" y1="1.27" x2="-2.286" y2="1.27" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-1.016" x2="2.54" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="-1.27" x2="2.286" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="1.016" x2="-2.54" y2="-1.016" width="0.1524" layer="21"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="-2.413" y="1.651" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.413" y="-2.794" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="MINI_MELF-0102R">
<description>&lt;b&gt;CECC Size RC2211&lt;/b&gt; Reflow Soldering&lt;p&gt;
source Beyschlag</description>
<wire x1="-1" y1="-0.5" x2="1" y2="-0.5" width="0.2032" layer="51"/>
<wire x1="1" y1="-0.5" x2="1" y2="0.5" width="0.2032" layer="51"/>
<wire x1="1" y1="0.5" x2="-1" y2="0.5" width="0.2032" layer="51"/>
<wire x1="-1" y1="0.5" x2="-1" y2="-0.5" width="0.2032" layer="51"/>
<smd name="1" x="-0.9" y="0" dx="0.5" dy="1.3" layer="1"/>
<smd name="2" x="0.9" y="0" dx="0.5" dy="1.3" layer="1"/>
<text x="-1.27" y="0.9525" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.2225" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="MINI_MELF-0102W">
<description>&lt;b&gt;CECC Size RC2211&lt;/b&gt; Wave Soldering&lt;p&gt;
source Beyschlag</description>
<wire x1="-1" y1="-0.5" x2="1" y2="-0.5" width="0.2032" layer="51"/>
<wire x1="1" y1="-0.5" x2="1" y2="0.5" width="0.2032" layer="51"/>
<wire x1="1" y1="0.5" x2="-1" y2="0.5" width="0.2032" layer="51"/>
<wire x1="-1" y1="0.5" x2="-1" y2="-0.5" width="0.2032" layer="51"/>
<smd name="1" x="-0.95" y="0" dx="0.6" dy="1.3" layer="1"/>
<smd name="2" x="0.95" y="0" dx="0.6" dy="1.3" layer="1"/>
<text x="-1.27" y="0.9525" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.2225" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="MINI_MELF-0204R">
<description>&lt;b&gt;CECC Size RC3715&lt;/b&gt; Reflow Soldering&lt;p&gt;
source Beyschlag</description>
<wire x1="-1.7" y1="-0.6" x2="1.7" y2="-0.6" width="0.2032" layer="51"/>
<wire x1="1.7" y1="-0.6" x2="1.7" y2="0.6" width="0.2032" layer="51"/>
<wire x1="1.7" y1="0.6" x2="-1.7" y2="0.6" width="0.2032" layer="51"/>
<wire x1="-1.7" y1="0.6" x2="-1.7" y2="-0.6" width="0.2032" layer="51"/>
<wire x1="0.938" y1="0.6" x2="-0.938" y2="0.6" width="0.2032" layer="21"/>
<wire x1="-0.938" y1="-0.6" x2="0.938" y2="-0.6" width="0.2032" layer="21"/>
<smd name="1" x="-1.5" y="0" dx="0.8" dy="1.6" layer="1"/>
<smd name="2" x="1.5" y="0" dx="0.8" dy="1.6" layer="1"/>
<text x="-1.27" y="0.9525" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.2225" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="MINI_MELF-0204W">
<description>&lt;b&gt;CECC Size RC3715&lt;/b&gt; Wave Soldering&lt;p&gt;
source Beyschlag</description>
<wire x1="-1.7" y1="-0.6" x2="1.7" y2="-0.6" width="0.2032" layer="51"/>
<wire x1="1.7" y1="-0.6" x2="1.7" y2="0.6" width="0.2032" layer="51"/>
<wire x1="1.7" y1="0.6" x2="-1.7" y2="0.6" width="0.2032" layer="51"/>
<wire x1="-1.7" y1="0.6" x2="-1.7" y2="-0.6" width="0.2032" layer="51"/>
<wire x1="0.684" y1="0.6" x2="-0.684" y2="0.6" width="0.2032" layer="21"/>
<wire x1="-0.684" y1="-0.6" x2="0.684" y2="-0.6" width="0.2032" layer="21"/>
<smd name="1" x="-1.5" y="0" dx="1.2" dy="1.6" layer="1"/>
<smd name="2" x="1.5" y="0" dx="1.2" dy="1.6" layer="1"/>
<text x="-1.27" y="0.9525" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.2225" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="MINI_MELF-0207R">
<description>&lt;b&gt;CECC Size RC6123&lt;/b&gt; Reflow Soldering&lt;p&gt;
source Beyschlag</description>
<wire x1="-2.8" y1="-1" x2="2.8" y2="-1" width="0.2032" layer="51"/>
<wire x1="2.8" y1="-1" x2="2.8" y2="1" width="0.2032" layer="51"/>
<wire x1="2.8" y1="1" x2="-2.8" y2="1" width="0.2032" layer="51"/>
<wire x1="-2.8" y1="1" x2="-2.8" y2="-1" width="0.2032" layer="51"/>
<wire x1="1.2125" y1="1" x2="-1.2125" y2="1" width="0.2032" layer="21"/>
<wire x1="-1.2125" y1="-1" x2="1.2125" y2="-1" width="0.2032" layer="21"/>
<smd name="1" x="-2.25" y="0" dx="1.6" dy="2.5" layer="1"/>
<smd name="2" x="2.25" y="0" dx="1.6" dy="2.5" layer="1"/>
<text x="-2.2225" y="1.5875" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.2225" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="MINI_MELF-0207W">
<description>&lt;b&gt;CECC Size RC6123&lt;/b&gt; Wave Soldering&lt;p&gt;
source Beyschlag</description>
<wire x1="-2.8" y1="-1" x2="2.8" y2="-1" width="0.2032" layer="51"/>
<wire x1="2.8" y1="-1" x2="2.8" y2="1" width="0.2032" layer="51"/>
<wire x1="2.8" y1="1" x2="-2.8" y2="1" width="0.2032" layer="51"/>
<wire x1="-2.8" y1="1" x2="-2.8" y2="-1" width="0.2032" layer="51"/>
<wire x1="1.149" y1="1" x2="-1.149" y2="1" width="0.2032" layer="21"/>
<wire x1="-1.149" y1="-1" x2="1.149" y2="-1" width="0.2032" layer="21"/>
<smd name="1" x="-2.6" y="0" dx="2.4" dy="2.5" layer="1"/>
<smd name="2" x="2.6" y="0" dx="2.4" dy="2.5" layer="1"/>
<text x="-2.54" y="1.5875" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="0922V">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type 0922, grid 7.5 mm</description>
<wire x1="2.54" y1="0" x2="1.397" y2="0" width="0.8128" layer="51"/>
<wire x1="-5.08" y1="0" x2="-3.81" y2="0" width="0.8128" layer="51"/>
<circle x="-5.08" y="0" radius="4.572" width="0.1524" layer="21"/>
<circle x="-5.08" y="0" radius="1.905" width="0.1524" layer="21"/>
<pad name="1" x="-5.08" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="1.016" shape="octagon"/>
<text x="-0.508" y="1.6764" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-0.508" y="-2.9972" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-6.858" y="2.54" size="1.016" layer="21" ratio="12">0922</text>
<rectangle x1="-3.81" y1="-0.4064" x2="1.3208" y2="0.4064" layer="21"/>
</package>
<package name="RDH/15">
<description>&lt;b&gt;RESISTOR&lt;/b&gt;&lt;p&gt;
type RDH, grid 15 mm</description>
<wire x1="-7.62" y1="0" x2="-6.858" y2="0" width="0.8128" layer="51"/>
<wire x1="-6.096" y1="3.048" x2="-5.207" y2="3.048" width="0.1524" layer="21"/>
<wire x1="-4.953" y1="2.794" x2="-5.207" y2="3.048" width="0.1524" layer="21"/>
<wire x1="-6.096" y1="-3.048" x2="-5.207" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-4.953" y1="-2.794" x2="-5.207" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="4.953" y1="2.794" x2="5.207" y2="3.048" width="0.1524" layer="21"/>
<wire x1="4.953" y1="2.794" x2="-4.953" y2="2.794" width="0.1524" layer="21"/>
<wire x1="4.953" y1="-2.794" x2="5.207" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="4.953" y1="-2.794" x2="-4.953" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="6.096" y1="3.048" x2="5.207" y2="3.048" width="0.1524" layer="21"/>
<wire x1="6.096" y1="-3.048" x2="5.207" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-6.477" y1="-2.667" x2="-6.477" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-6.477" y1="1.016" x2="-6.477" y2="-1.016" width="0.1524" layer="51"/>
<wire x1="-6.477" y1="1.016" x2="-6.477" y2="2.667" width="0.1524" layer="21"/>
<wire x1="6.477" y1="-2.667" x2="6.477" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="6.477" y1="1.016" x2="6.477" y2="-1.016" width="0.1524" layer="51"/>
<wire x1="6.477" y1="1.016" x2="6.477" y2="2.667" width="0.1524" layer="21"/>
<wire x1="6.858" y1="0" x2="7.62" y2="0" width="0.8128" layer="51"/>
<wire x1="-6.477" y1="2.667" x2="-6.096" y2="3.048" width="0.1524" layer="21" curve="-90"/>
<wire x1="6.096" y1="3.048" x2="6.477" y2="2.667" width="0.1524" layer="21" curve="-90"/>
<wire x1="-6.477" y1="-2.667" x2="-6.096" y2="-3.048" width="0.1524" layer="21" curve="90"/>
<wire x1="6.096" y1="-3.048" x2="6.477" y2="-2.667" width="0.1524" layer="21" curve="90"/>
<pad name="1" x="-7.62" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="7.62" y="0" drill="1.016" shape="octagon"/>
<text x="-6.35" y="3.4544" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.318" y="-0.5842" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="4.572" y="-1.7272" size="1.27" layer="51" ratio="10" rot="R90">RDH</text>
<rectangle x1="-6.7564" y1="-0.4064" x2="-6.4516" y2="0.4064" layer="51"/>
<rectangle x1="6.4516" y1="-0.4064" x2="6.7564" y2="0.4064" layer="51"/>
</package>
<package name="MINI_MELF-0102AX">
<description>&lt;b&gt;Mini MELF 0102 Axial&lt;/b&gt;</description>
<circle x="0" y="0" radius="0.6" width="0" layer="51"/>
<circle x="0" y="0" radius="0.6" width="0" layer="52"/>
<smd name="1" x="0" y="0" dx="1.9" dy="1.9" layer="1" roundness="100"/>
<smd name="2" x="0" y="0" dx="1.9" dy="1.9" layer="16" roundness="100"/>
<text x="-1.27" y="0.9525" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.2225" size="1.27" layer="27">&gt;VALUE</text>
<hole x="0" y="0" drill="1.3"/>
</package>
<package name="R0201">
<description>&lt;b&gt;RESISTOR&lt;/b&gt; chip&lt;p&gt;
Source: http://www.vishay.com/docs/20008/dcrcw.pdf</description>
<smd name="1" x="-0.255" y="0" dx="0.28" dy="0.43" layer="1"/>
<smd name="2" x="0.255" y="0" dx="0.28" dy="0.43" layer="1"/>
<text x="-0.635" y="0.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.3" y1="-0.15" x2="-0.15" y2="0.15" layer="51"/>
<rectangle x1="0.15" y1="-0.15" x2="0.3" y2="0.15" layer="51"/>
<rectangle x1="-0.15" y1="-0.15" x2="0.15" y2="0.15" layer="21"/>
</package>
<package name="VTA52">
<description>&lt;b&gt;Bulk Metal® Foil Technology&lt;/b&gt;, Tubular Axial Lead Resistors, Meets or Exceeds MIL-R-39005 Requirements&lt;p&gt;
MIL SIZE RBR52&lt;br&gt;
Source: VISHAY .. vta56.pdf</description>
<wire x1="-15.24" y1="0" x2="-13.97" y2="0" width="0.6096" layer="51"/>
<wire x1="12.6225" y1="0.025" x2="12.6225" y2="4.725" width="0.1524" layer="21"/>
<wire x1="12.6225" y1="4.725" x2="-12.6225" y2="4.725" width="0.1524" layer="21"/>
<wire x1="-12.6225" y1="4.725" x2="-12.6225" y2="0.025" width="0.1524" layer="21"/>
<wire x1="-12.6225" y1="0.025" x2="-12.6225" y2="-4.65" width="0.1524" layer="21"/>
<wire x1="-12.6225" y1="-4.65" x2="12.6225" y2="-4.65" width="0.1524" layer="21"/>
<wire x1="12.6225" y1="-4.65" x2="12.6225" y2="0.025" width="0.1524" layer="21"/>
<wire x1="13.97" y1="0" x2="15.24" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-15.24" y="0" drill="1.1" shape="octagon"/>
<pad name="2" x="15.24" y="0" drill="1.1" shape="octagon"/>
<text x="-3.81" y="5.08" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-13.97" y1="-0.3048" x2="-12.5675" y2="0.3048" layer="21"/>
<rectangle x1="12.5675" y1="-0.3048" x2="13.97" y2="0.3048" layer="21"/>
</package>
<package name="VTA53">
<description>&lt;b&gt;Bulk Metal® Foil Technology&lt;/b&gt;, Tubular Axial Lead Resistors, Meets or Exceeds MIL-R-39005 Requirements&lt;p&gt;
MIL SIZE RBR53&lt;br&gt;
Source: VISHAY .. vta56.pdf</description>
<wire x1="-12.065" y1="0" x2="-10.795" y2="0" width="0.6096" layer="51"/>
<wire x1="9.8975" y1="0" x2="9.8975" y2="4.7" width="0.1524" layer="21"/>
<wire x1="9.8975" y1="4.7" x2="-9.8975" y2="4.7" width="0.1524" layer="21"/>
<wire x1="-9.8975" y1="4.7" x2="-9.8975" y2="0" width="0.1524" layer="21"/>
<wire x1="-9.8975" y1="0" x2="-9.8975" y2="-4.675" width="0.1524" layer="21"/>
<wire x1="-9.8975" y1="-4.675" x2="9.8975" y2="-4.675" width="0.1524" layer="21"/>
<wire x1="9.8975" y1="-4.675" x2="9.8975" y2="0" width="0.1524" layer="21"/>
<wire x1="10.795" y1="0" x2="12.065" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-12.065" y="0" drill="1.1" shape="octagon"/>
<pad name="2" x="12.065" y="0" drill="1.1" shape="octagon"/>
<text x="-3.81" y="5.08" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-10.795" y1="-0.3048" x2="-9.8425" y2="0.3048" layer="21"/>
<rectangle x1="9.8425" y1="-0.3048" x2="10.795" y2="0.3048" layer="21"/>
</package>
<package name="VTA54">
<description>&lt;b&gt;Bulk Metal® Foil Technology&lt;/b&gt;, Tubular Axial Lead Resistors, Meets or Exceeds MIL-R-39005 Requirements&lt;p&gt;
MIL SIZE RBR54&lt;br&gt;
Source: VISHAY .. vta56.pdf</description>
<wire x1="-12.065" y1="0" x2="-10.795" y2="0" width="0.6096" layer="51"/>
<wire x1="9.8975" y1="0" x2="9.8975" y2="3.3" width="0.1524" layer="21"/>
<wire x1="9.8975" y1="3.3" x2="-9.8975" y2="3.3" width="0.1524" layer="21"/>
<wire x1="-9.8975" y1="3.3" x2="-9.8975" y2="0" width="0.1524" layer="21"/>
<wire x1="-9.8975" y1="0" x2="-9.8975" y2="-3.3" width="0.1524" layer="21"/>
<wire x1="-9.8975" y1="-3.3" x2="9.8975" y2="-3.3" width="0.1524" layer="21"/>
<wire x1="9.8975" y1="-3.3" x2="9.8975" y2="0" width="0.1524" layer="21"/>
<wire x1="10.795" y1="0" x2="12.065" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-12.065" y="0" drill="1.1" shape="octagon"/>
<pad name="2" x="12.065" y="0" drill="1.1" shape="octagon"/>
<text x="-3.81" y="3.81" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-10.795" y1="-0.3048" x2="-9.8425" y2="0.3048" layer="21"/>
<rectangle x1="9.8425" y1="-0.3048" x2="10.795" y2="0.3048" layer="21"/>
</package>
<package name="VTA55">
<description>&lt;b&gt;Bulk Metal® Foil Technology&lt;/b&gt;, Tubular Axial Lead Resistors, Meets or Exceeds MIL-R-39005 Requirements&lt;p&gt;
MIL SIZE RBR55&lt;br&gt;
Source: VISHAY .. vta56.pdf</description>
<wire x1="-8.255" y1="0" x2="-6.985" y2="0" width="0.6096" layer="51"/>
<wire x1="6.405" y1="0" x2="6.405" y2="3.3" width="0.1524" layer="21"/>
<wire x1="6.405" y1="3.3" x2="-6.405" y2="3.3" width="0.1524" layer="21"/>
<wire x1="-6.405" y1="3.3" x2="-6.405" y2="0" width="0.1524" layer="21"/>
<wire x1="-6.405" y1="0" x2="-6.405" y2="-3.3" width="0.1524" layer="21"/>
<wire x1="-6.405" y1="-3.3" x2="6.405" y2="-3.3" width="0.1524" layer="21"/>
<wire x1="6.405" y1="-3.3" x2="6.405" y2="0" width="0.1524" layer="21"/>
<wire x1="6.985" y1="0" x2="8.255" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-8.255" y="0" drill="1.1" shape="octagon"/>
<pad name="2" x="8.255" y="0" drill="1.1" shape="octagon"/>
<text x="-3.81" y="3.81" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-6.985" y1="-0.3048" x2="-6.35" y2="0.3048" layer="21"/>
<rectangle x1="6.35" y1="-0.3048" x2="6.985" y2="0.3048" layer="21"/>
</package>
<package name="VTA56">
<description>&lt;b&gt;Bulk Metal® Foil Technology&lt;/b&gt;, Tubular Axial Lead Resistors, Meets or Exceeds MIL-R-39005 Requirements&lt;p&gt;
MIL SIZE RBR56&lt;br&gt;
Source: VISHAY .. vta56.pdf</description>
<wire x1="-6.35" y1="0" x2="-5.08" y2="0" width="0.6096" layer="51"/>
<wire x1="4.5" y1="0" x2="4.5" y2="3.3" width="0.1524" layer="21"/>
<wire x1="4.5" y1="3.3" x2="-4.5" y2="3.3" width="0.1524" layer="21"/>
<wire x1="-4.5" y1="3.3" x2="-4.5" y2="0" width="0.1524" layer="21"/>
<wire x1="-4.5" y1="0" x2="-4.5" y2="-3.3" width="0.1524" layer="21"/>
<wire x1="-4.5" y1="-3.3" x2="4.5" y2="-3.3" width="0.1524" layer="21"/>
<wire x1="4.5" y1="-3.3" x2="4.5" y2="0" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0" x2="6.35" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-6.35" y="0" drill="1.1" shape="octagon"/>
<pad name="2" x="6.35" y="0" drill="1.1" shape="octagon"/>
<text x="-3.81" y="3.81" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-5.08" y1="-0.3048" x2="-4.445" y2="0.3048" layer="21"/>
<rectangle x1="4.445" y1="-0.3048" x2="5.08" y2="0.3048" layer="21"/>
</package>
<package name="VMTA55">
<description>&lt;b&gt;Bulk Metal® Foil Technology&lt;/b&gt;, Tubular Axial Lead Resistors, Meets or Exceeds MIL-R-39005 Requirements&lt;p&gt;
MIL SIZE RNC55&lt;br&gt;
Source: VISHAY .. vta56.pdf</description>
<wire x1="-5.08" y1="0" x2="-4.26" y2="0" width="0.6096" layer="51"/>
<wire x1="3.3375" y1="-1.45" x2="3.3375" y2="1.45" width="0.1524" layer="21"/>
<wire x1="3.3375" y1="1.45" x2="-3.3625" y2="1.45" width="0.1524" layer="21"/>
<wire x1="-3.3625" y1="1.45" x2="-3.3625" y2="-1.45" width="0.1524" layer="21"/>
<wire x1="-3.3625" y1="-1.45" x2="3.3375" y2="-1.45" width="0.1524" layer="21"/>
<wire x1="4.235" y1="0" x2="5.08" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-5.08" y="0" drill="1.1" shape="octagon"/>
<pad name="2" x="5.08" y="0" drill="1.1" shape="octagon"/>
<text x="-3.175" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-4.26" y1="-0.3048" x2="-3.3075" y2="0.3048" layer="21"/>
<rectangle x1="3.2825" y1="-0.3048" x2="4.235" y2="0.3048" layer="21"/>
</package>
<package name="VMTB60">
<description>&lt;b&gt;Bulk Metal® Foil Technology&lt;/b&gt;, Tubular Axial Lead Resistors, Meets or Exceeds MIL-R-39005 Requirements&lt;p&gt;
MIL SIZE RNC60&lt;br&gt;
Source: VISHAY .. vta56.pdf</description>
<wire x1="-6.35" y1="0" x2="-5.585" y2="0" width="0.6096" layer="51"/>
<wire x1="4.6875" y1="-1.95" x2="4.6875" y2="1.95" width="0.1524" layer="21"/>
<wire x1="4.6875" y1="1.95" x2="-4.6875" y2="1.95" width="0.1524" layer="21"/>
<wire x1="-4.6875" y1="1.95" x2="-4.6875" y2="-1.95" width="0.1524" layer="21"/>
<wire x1="-4.6875" y1="-1.95" x2="4.6875" y2="-1.95" width="0.1524" layer="21"/>
<wire x1="5.585" y1="0" x2="6.35" y2="0" width="0.6096" layer="51"/>
<pad name="1" x="-6.35" y="0" drill="1.1" shape="octagon"/>
<pad name="2" x="6.35" y="0" drill="1.1" shape="octagon"/>
<text x="-4.445" y="2.54" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.445" y="-0.635" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-5.585" y1="-0.3048" x2="-4.6325" y2="0.3048" layer="21"/>
<rectangle x1="4.6325" y1="-0.3048" x2="5.585" y2="0.3048" layer="21"/>
</package>
<package name="R4527">
<description>&lt;b&gt;Package 4527&lt;/b&gt;&lt;p&gt;
Source: http://www.vishay.com/docs/31059/wsrhigh.pdf</description>
<wire x1="-5.675" y1="-3.375" x2="5.65" y2="-3.375" width="0.2032" layer="21"/>
<wire x1="5.65" y1="-3.375" x2="5.65" y2="3.375" width="0.2032" layer="51"/>
<wire x1="5.65" y1="3.375" x2="-5.675" y2="3.375" width="0.2032" layer="21"/>
<wire x1="-5.675" y1="3.375" x2="-5.675" y2="-3.375" width="0.2032" layer="51"/>
<smd name="1" x="-4.575" y="0" dx="3.94" dy="5.84" layer="1"/>
<smd name="2" x="4.575" y="0" dx="3.94" dy="5.84" layer="1"/>
<text x="-5.715" y="3.81" size="1.27" layer="25">&gt;NAME</text>
<text x="-5.715" y="-5.08" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="WSC0001">
<description>&lt;b&gt;Wirewound Resistors, Precision Power&lt;/b&gt;&lt;p&gt;
Source: VISHAY wscwsn.pdf</description>
<wire x1="-3.075" y1="1.8" x2="-3.075" y2="-1.8" width="0.2032" layer="51"/>
<wire x1="-3.075" y1="-1.8" x2="3.075" y2="-1.8" width="0.2032" layer="21"/>
<wire x1="3.075" y1="-1.8" x2="3.075" y2="1.8" width="0.2032" layer="51"/>
<wire x1="3.075" y1="1.8" x2="-3.075" y2="1.8" width="0.2032" layer="21"/>
<wire x1="-3.075" y1="1.8" x2="-3.075" y2="1.606" width="0.2032" layer="21"/>
<wire x1="-3.075" y1="-1.606" x2="-3.075" y2="-1.8" width="0.2032" layer="21"/>
<wire x1="3.075" y1="1.606" x2="3.075" y2="1.8" width="0.2032" layer="21"/>
<wire x1="3.075" y1="-1.8" x2="3.075" y2="-1.606" width="0.2032" layer="21"/>
<smd name="1" x="-2.675" y="0" dx="2.29" dy="2.92" layer="1"/>
<smd name="2" x="2.675" y="0" dx="2.29" dy="2.92" layer="1"/>
<text x="-2.544" y="2.229" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.544" y="-3.501" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="WSC0002">
<description>&lt;b&gt;Wirewound Resistors, Precision Power&lt;/b&gt;&lt;p&gt;
Source: VISHAY wscwsn.pdf</description>
<wire x1="-5.55" y1="3.375" x2="-5.55" y2="-3.375" width="0.2032" layer="51"/>
<wire x1="-5.55" y1="-3.375" x2="5.55" y2="-3.375" width="0.2032" layer="21"/>
<wire x1="5.55" y1="-3.375" x2="5.55" y2="3.375" width="0.2032" layer="51"/>
<wire x1="5.55" y1="3.375" x2="-5.55" y2="3.375" width="0.2032" layer="21"/>
<smd name="1" x="-4.575" y="0.025" dx="3.94" dy="5.84" layer="1"/>
<smd name="2" x="4.575" y="0" dx="3.94" dy="5.84" layer="1"/>
<text x="-5.65" y="3.9" size="1.27" layer="25">&gt;NAME</text>
<text x="-5.65" y="-5.15" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="WSC01/2">
<description>&lt;b&gt;Wirewound Resistors, Precision Power&lt;/b&gt;&lt;p&gt;
Source: VISHAY wscwsn.pdf</description>
<wire x1="-2.45" y1="1.475" x2="-2.45" y2="-1.475" width="0.2032" layer="51"/>
<wire x1="-2.45" y1="-1.475" x2="2.45" y2="-1.475" width="0.2032" layer="21"/>
<wire x1="2.45" y1="-1.475" x2="2.45" y2="1.475" width="0.2032" layer="51"/>
<wire x1="2.45" y1="1.475" x2="-2.45" y2="1.475" width="0.2032" layer="21"/>
<wire x1="-2.45" y1="1.475" x2="-2.45" y2="1.106" width="0.2032" layer="21"/>
<wire x1="-2.45" y1="-1.106" x2="-2.45" y2="-1.475" width="0.2032" layer="21"/>
<wire x1="2.45" y1="1.106" x2="2.45" y2="1.475" width="0.2032" layer="21"/>
<wire x1="2.45" y1="-1.475" x2="2.45" y2="-1.106" width="0.2032" layer="21"/>
<smd name="1" x="-2.1" y="0" dx="2.16" dy="1.78" layer="1"/>
<smd name="2" x="2.1" y="0" dx="2.16" dy="1.78" layer="1"/>
<text x="-2.544" y="1.904" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.544" y="-3.176" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="WSC2515">
<description>&lt;b&gt;Wirewound Resistors, Precision Power&lt;/b&gt;&lt;p&gt;
Source: VISHAY wscwsn.pdf</description>
<wire x1="-3.075" y1="1.8" x2="-3.075" y2="-1.8" width="0.2032" layer="51"/>
<wire x1="-3.075" y1="-1.8" x2="3.05" y2="-1.8" width="0.2032" layer="21"/>
<wire x1="3.05" y1="-1.8" x2="3.05" y2="1.8" width="0.2032" layer="51"/>
<wire x1="3.05" y1="1.8" x2="-3.075" y2="1.8" width="0.2032" layer="21"/>
<wire x1="-3.075" y1="1.8" x2="-3.075" y2="1.606" width="0.2032" layer="21"/>
<wire x1="-3.075" y1="-1.606" x2="-3.075" y2="-1.8" width="0.2032" layer="21"/>
<wire x1="3.05" y1="1.606" x2="3.05" y2="1.8" width="0.2032" layer="21"/>
<wire x1="3.05" y1="-1.8" x2="3.05" y2="-1.606" width="0.2032" layer="21"/>
<smd name="1" x="-2.675" y="0" dx="2.29" dy="2.92" layer="1"/>
<smd name="2" x="2.675" y="0" dx="2.29" dy="2.92" layer="1"/>
<text x="-3.2" y="2.15" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.2" y="-3.4" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="WSC4527">
<description>&lt;b&gt;Wirewound Resistors, Precision Power&lt;/b&gt;&lt;p&gt;
Source: VISHAY wscwsn.pdf</description>
<wire x1="-5.675" y1="3.4" x2="-5.675" y2="-3.375" width="0.2032" layer="51"/>
<wire x1="-5.675" y1="-3.375" x2="5.675" y2="-3.375" width="0.2032" layer="21"/>
<wire x1="5.675" y1="-3.375" x2="5.675" y2="3.4" width="0.2032" layer="51"/>
<wire x1="5.675" y1="3.4" x2="-5.675" y2="3.4" width="0.2032" layer="21"/>
<smd name="1" x="-4.575" y="0.025" dx="3.94" dy="5.84" layer="1"/>
<smd name="2" x="4.575" y="0" dx="3.94" dy="5.84" layer="1"/>
<text x="-5.775" y="3.925" size="1.27" layer="25">&gt;NAME</text>
<text x="-5.775" y="-5.15" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="WSC6927">
<description>&lt;b&gt;Wirewound Resistors, Precision Power&lt;/b&gt;&lt;p&gt;
Source: VISHAY wscwsn.pdf</description>
<wire x1="-8.65" y1="3.375" x2="-8.65" y2="-3.375" width="0.2032" layer="51"/>
<wire x1="-8.65" y1="-3.375" x2="8.65" y2="-3.375" width="0.2032" layer="21"/>
<wire x1="8.65" y1="-3.375" x2="8.65" y2="3.375" width="0.2032" layer="51"/>
<wire x1="8.65" y1="3.375" x2="-8.65" y2="3.375" width="0.2032" layer="21"/>
<smd name="1" x="-7.95" y="0.025" dx="3.94" dy="5.97" layer="1"/>
<smd name="2" x="7.95" y="0" dx="3.94" dy="5.97" layer="1"/>
<text x="-8.75" y="3.9" size="1.27" layer="25">&gt;NAME</text>
<text x="-8.75" y="-5.15" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="R1218">
<description>&lt;b&gt;CRCW1218 Thick Film, Rectangular Chip Resistors&lt;/b&gt;&lt;p&gt;
Source: http://www.vishay.com .. dcrcw.pdf</description>
<wire x1="-0.913" y1="-2.219" x2="0.939" y2="-2.219" width="0.1524" layer="51"/>
<wire x1="0.913" y1="2.219" x2="-0.939" y2="2.219" width="0.1524" layer="51"/>
<smd name="1" x="-1.475" y="0" dx="1.05" dy="4.9" layer="1"/>
<smd name="2" x="1.475" y="0" dx="1.05" dy="4.9" layer="1"/>
<text x="-2.54" y="2.54" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-3.81" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.651" y1="-2.3" x2="-0.9009" y2="2.3" layer="51"/>
<rectangle x1="0.9144" y1="-2.3" x2="1.6645" y2="2.3" layer="51"/>
</package>
<package name="1812X7R">
<description>&lt;b&gt;Chip Monolithic Ceramic Capacitors&lt;/b&gt; Medium Voltage High Capacitance for General Use&lt;p&gt;
Source: http://www.murata.com .. GRM43DR72E224KW01.pdf</description>
<wire x1="-1.1" y1="1.5" x2="1.1" y2="1.5" width="0.2032" layer="51"/>
<wire x1="1.1" y1="-1.5" x2="-1.1" y2="-1.5" width="0.2032" layer="51"/>
<wire x1="-0.6" y1="1.5" x2="0.6" y2="1.5" width="0.2032" layer="21"/>
<wire x1="0.6" y1="-1.5" x2="-0.6" y2="-1.5" width="0.2032" layer="21"/>
<smd name="1" x="-1.425" y="0" dx="0.8" dy="3.5" layer="1"/>
<smd name="2" x="1.425" y="0" dx="0.8" dy="3.5" layer="1" rot="R180"/>
<text x="-1.9456" y="1.9958" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.9456" y="-3.7738" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.4" y1="-1.6" x2="-1.1" y2="1.6" layer="51"/>
<rectangle x1="1.1" y1="-1.6" x2="1.4" y2="1.6" layer="51" rot="R180"/>
</package>
<package name="PRL1632">
<description>&lt;b&gt;PRL1632 are realized as 1W for 3.2 × 1.6mm(1206)&lt;/b&gt;&lt;p&gt;
Source: http://www.mouser.com/ds/2/392/products_18-2245.pdf</description>
<wire x1="0.7275" y1="-1.5228" x2="-0.7277" y2="-1.5228" width="0.1524" layer="51"/>
<wire x1="0.7275" y1="1.5228" x2="-0.7152" y2="1.5228" width="0.1524" layer="51"/>
<smd name="2" x="0.822" y="0" dx="1" dy="3.2" layer="1"/>
<smd name="1" x="-0.822" y="0" dx="1" dy="3.2" layer="1"/>
<text x="-1.4" y="1.8" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.4" y="-3" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.8" y1="-1.6" x2="-0.4" y2="1.6" layer="51"/>
<rectangle x1="0.4" y1="-1.6" x2="0.8" y2="1.6" layer="51"/>
</package>
<package name="R01005">
<smd name="1" x="-0.1625" y="0" dx="0.2" dy="0.25" layer="1"/>
<smd name="2" x="0.1625" y="0" dx="0.2" dy="0.25" layer="1"/>
<text x="-0.4" y="0.3" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.4" y="-1.6" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.2" y1="-0.1" x2="-0.075" y2="0.1" layer="51"/>
<rectangle x1="0.075" y1="-0.1" x2="0.2" y2="0.1" layer="51"/>
<rectangle x1="-0.15" y1="0.05" x2="0.15" y2="0.1" layer="51"/>
<rectangle x1="-0.15" y1="-0.1" x2="0.15" y2="-0.05" layer="51"/>
</package>
<package name="C0402">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;</description>
<wire x1="-0.245" y1="0.224" x2="0.245" y2="0.224" width="0.1524" layer="51"/>
<wire x1="0.245" y1="-0.224" x2="-0.245" y2="-0.224" width="0.1524" layer="51"/>
<wire x1="-1.473" y1="0.483" x2="1.473" y2="0.483" width="0.0508" layer="39"/>
<wire x1="1.473" y1="0.483" x2="1.473" y2="-0.483" width="0.0508" layer="39"/>
<wire x1="1.473" y1="-0.483" x2="-1.473" y2="-0.483" width="0.0508" layer="39"/>
<wire x1="-1.473" y1="-0.483" x2="-1.473" y2="0.483" width="0.0508" layer="39"/>
<smd name="1" x="-0.65" y="0" dx="0.7" dy="0.9" layer="1"/>
<smd name="2" x="0.65" y="0" dx="0.7" dy="0.9" layer="1"/>
<text x="-0.635" y="0.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.554" y1="-0.3048" x2="-0.254" y2="0.2951" layer="51"/>
<rectangle x1="0.2588" y1="-0.3048" x2="0.5588" y2="0.2951" layer="51"/>
<rectangle x1="-0.1999" y1="-0.3" x2="0.1999" y2="0.3" layer="35"/>
</package>
<package name="C0504">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;</description>
<wire x1="-1.473" y1="0.983" x2="1.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.473" y1="0.983" x2="1.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.473" y1="-0.983" x2="-1.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.473" y1="-0.983" x2="-1.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="-0.294" y1="0.559" x2="0.294" y2="0.559" width="0.1016" layer="51"/>
<wire x1="-0.294" y1="-0.559" x2="0.294" y2="-0.559" width="0.1016" layer="51"/>
<smd name="1" x="-0.7" y="0" dx="1" dy="1.3" layer="1"/>
<smd name="2" x="0.7" y="0" dx="1" dy="1.3" layer="1"/>
<text x="-0.635" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.6604" y1="-0.6223" x2="-0.2804" y2="0.6276" layer="51"/>
<rectangle x1="0.2794" y1="-0.6223" x2="0.6594" y2="0.6276" layer="51"/>
<rectangle x1="-0.1001" y1="-0.4001" x2="0.1001" y2="0.4001" layer="35"/>
</package>
<package name="C0603">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;</description>
<wire x1="-1.473" y1="0.983" x2="1.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.473" y1="0.983" x2="1.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.473" y1="-0.983" x2="-1.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.473" y1="-0.983" x2="-1.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="-0.356" y1="0.432" x2="0.356" y2="0.432" width="0.1016" layer="51"/>
<wire x1="-0.356" y1="-0.419" x2="0.356" y2="-0.419" width="0.1016" layer="51"/>
<smd name="1" x="-0.85" y="0" dx="1.1" dy="1" layer="1"/>
<smd name="2" x="0.85" y="0" dx="1.1" dy="1" layer="1"/>
<text x="-0.635" y="0.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.8382" y1="-0.4699" x2="-0.3381" y2="0.4801" layer="51"/>
<rectangle x1="0.3302" y1="-0.4699" x2="0.8303" y2="0.4801" layer="51"/>
<rectangle x1="-0.1999" y1="-0.3" x2="0.1999" y2="0.3" layer="35"/>
</package>
<package name="C0805">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;</description>
<wire x1="-1.973" y1="0.983" x2="1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="-0.983" x2="-1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.973" y1="-0.983" x2="-1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="-0.381" y1="0.66" x2="0.381" y2="0.66" width="0.1016" layer="51"/>
<wire x1="-0.356" y1="-0.66" x2="0.381" y2="-0.66" width="0.1016" layer="51"/>
<wire x1="1.973" y1="0.983" x2="1.973" y2="-0.983" width="0.0508" layer="39"/>
<smd name="1" x="-0.95" y="0" dx="1.3" dy="1.5" layer="1"/>
<smd name="2" x="0.95" y="0" dx="1.3" dy="1.5" layer="1"/>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.0922" y1="-0.7239" x2="-0.3421" y2="0.7262" layer="51"/>
<rectangle x1="0.3556" y1="-0.7239" x2="1.1057" y2="0.7262" layer="51"/>
<rectangle x1="-0.1001" y1="-0.4001" x2="0.1001" y2="0.4001" layer="35"/>
</package>
<package name="C1206">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;</description>
<wire x1="-2.473" y1="0.983" x2="2.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-0.983" x2="-2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-0.983" x2="-2.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="0.983" x2="2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-0.965" y1="0.787" x2="0.965" y2="0.787" width="0.1016" layer="51"/>
<wire x1="-0.965" y1="-0.787" x2="0.965" y2="-0.787" width="0.1016" layer="51"/>
<smd name="1" x="-1.4" y="0" dx="1.6" dy="1.8" layer="1"/>
<smd name="2" x="1.4" y="0" dx="1.6" dy="1.8" layer="1"/>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.7018" y1="-0.8509" x2="-0.9517" y2="0.8491" layer="51"/>
<rectangle x1="0.9517" y1="-0.8491" x2="1.7018" y2="0.8509" layer="51"/>
<rectangle x1="-0.1999" y1="-0.4001" x2="0.1999" y2="0.4001" layer="35"/>
</package>
<package name="C1210">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;</description>
<wire x1="-2.473" y1="1.483" x2="2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-1.483" x2="-2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-1.483" x2="-2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="-0.9652" y1="1.2446" x2="0.9652" y2="1.2446" width="0.1016" layer="51"/>
<wire x1="-0.9652" y1="-1.2446" x2="0.9652" y2="-1.2446" width="0.1016" layer="51"/>
<wire x1="2.473" y1="1.483" x2="2.473" y2="-1.483" width="0.0508" layer="39"/>
<smd name="1" x="-1.4" y="0" dx="1.6" dy="2.7" layer="1"/>
<smd name="2" x="1.4" y="0" dx="1.6" dy="2.7" layer="1"/>
<text x="-1.905" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.7018" y1="-1.2954" x2="-0.9517" y2="1.3045" layer="51"/>
<rectangle x1="0.9517" y1="-1.3045" x2="1.7018" y2="1.2954" layer="51"/>
<rectangle x1="-0.1999" y1="-0.4001" x2="0.1999" y2="0.4001" layer="35"/>
</package>
<package name="C1310">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;</description>
<wire x1="-1.473" y1="0.983" x2="1.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.473" y1="0.983" x2="1.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.473" y1="-0.983" x2="-1.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.473" y1="-0.983" x2="-1.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="-0.294" y1="0.559" x2="0.294" y2="0.559" width="0.1016" layer="51"/>
<wire x1="-0.294" y1="-0.559" x2="0.294" y2="-0.559" width="0.1016" layer="51"/>
<smd name="1" x="-0.7" y="0" dx="1" dy="1.3" layer="1"/>
<smd name="2" x="0.7" y="0" dx="1" dy="1.3" layer="1"/>
<text x="-0.635" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.6604" y1="-0.6223" x2="-0.2804" y2="0.6276" layer="51"/>
<rectangle x1="0.2794" y1="-0.6223" x2="0.6594" y2="0.6276" layer="51"/>
<rectangle x1="-0.1001" y1="-0.3" x2="0.1001" y2="0.3" layer="35"/>
</package>
<package name="C1608">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;</description>
<wire x1="-1.473" y1="0.983" x2="1.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.473" y1="0.983" x2="1.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.473" y1="-0.983" x2="-1.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.473" y1="-0.983" x2="-1.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="-0.356" y1="0.432" x2="0.356" y2="0.432" width="0.1016" layer="51"/>
<wire x1="-0.356" y1="-0.419" x2="0.356" y2="-0.419" width="0.1016" layer="51"/>
<smd name="1" x="-0.85" y="0" dx="1.1" dy="1" layer="1"/>
<smd name="2" x="0.85" y="0" dx="1.1" dy="1" layer="1"/>
<text x="-0.635" y="0.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.8382" y1="-0.4699" x2="-0.3381" y2="0.4801" layer="51"/>
<rectangle x1="0.3302" y1="-0.4699" x2="0.8303" y2="0.4801" layer="51"/>
<rectangle x1="-0.1999" y1="-0.3" x2="0.1999" y2="0.3" layer="35"/>
</package>
<package name="C1812">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;</description>
<wire x1="-2.973" y1="1.983" x2="2.973" y2="1.983" width="0.0508" layer="39"/>
<wire x1="2.973" y1="-1.983" x2="-2.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="-2.973" y1="-1.983" x2="-2.973" y2="1.983" width="0.0508" layer="39"/>
<wire x1="-1.4732" y1="1.6002" x2="1.4732" y2="1.6002" width="0.1016" layer="51"/>
<wire x1="-1.4478" y1="-1.6002" x2="1.4732" y2="-1.6002" width="0.1016" layer="51"/>
<wire x1="2.973" y1="1.983" x2="2.973" y2="-1.983" width="0.0508" layer="39"/>
<smd name="1" x="-1.95" y="0" dx="1.9" dy="3.4" layer="1"/>
<smd name="2" x="1.95" y="0" dx="1.9" dy="3.4" layer="1"/>
<text x="-1.905" y="2.54" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.81" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-2.3876" y1="-1.651" x2="-1.4376" y2="1.649" layer="51"/>
<rectangle x1="1.4478" y1="-1.651" x2="2.3978" y2="1.649" layer="51"/>
<rectangle x1="-0.3" y1="-0.4001" x2="0.3" y2="0.4001" layer="35"/>
</package>
<package name="C1825">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;</description>
<wire x1="-2.973" y1="3.483" x2="2.973" y2="3.483" width="0.0508" layer="39"/>
<wire x1="2.973" y1="-3.483" x2="-2.973" y2="-3.483" width="0.0508" layer="39"/>
<wire x1="-2.973" y1="-3.483" x2="-2.973" y2="3.483" width="0.0508" layer="39"/>
<wire x1="-1.4986" y1="3.2766" x2="1.4732" y2="3.2766" width="0.1016" layer="51"/>
<wire x1="-1.4732" y1="-3.2766" x2="1.4986" y2="-3.2766" width="0.1016" layer="51"/>
<wire x1="2.973" y1="3.483" x2="2.973" y2="-3.483" width="0.0508" layer="39"/>
<smd name="1" x="-1.95" y="0" dx="1.9" dy="6.8" layer="1"/>
<smd name="2" x="1.95" y="0" dx="1.9" dy="6.8" layer="1"/>
<text x="-1.905" y="3.81" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-5.08" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-2.413" y1="-3.3528" x2="-1.463" y2="3.3472" layer="51"/>
<rectangle x1="1.4478" y1="-3.3528" x2="2.3978" y2="3.3472" layer="51"/>
<rectangle x1="-0.7" y1="-0.7" x2="0.7" y2="0.7" layer="35"/>
</package>
<package name="C2012">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;</description>
<wire x1="-1.973" y1="0.983" x2="1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="0.983" x2="1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="1.973" y1="-0.983" x2="-1.973" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-1.973" y1="-0.983" x2="-1.973" y2="0.983" width="0.0508" layer="39"/>
<wire x1="-0.381" y1="0.66" x2="0.381" y2="0.66" width="0.1016" layer="51"/>
<wire x1="-0.356" y1="-0.66" x2="0.381" y2="-0.66" width="0.1016" layer="51"/>
<smd name="1" x="-0.85" y="0" dx="1.3" dy="1.5" layer="1"/>
<smd name="2" x="0.85" y="0" dx="1.3" dy="1.5" layer="1"/>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.0922" y1="-0.7239" x2="-0.3421" y2="0.7262" layer="51"/>
<rectangle x1="0.3556" y1="-0.7239" x2="1.1057" y2="0.7262" layer="51"/>
<rectangle x1="-0.1001" y1="-0.4001" x2="0.1001" y2="0.4001" layer="35"/>
</package>
<package name="C3216">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;</description>
<wire x1="-2.473" y1="0.983" x2="2.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-0.983" x2="-2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-0.983" x2="-2.473" y2="0.983" width="0.0508" layer="39"/>
<wire x1="2.473" y1="0.983" x2="2.473" y2="-0.983" width="0.0508" layer="39"/>
<wire x1="-0.965" y1="0.787" x2="0.965" y2="0.787" width="0.1016" layer="51"/>
<wire x1="-0.965" y1="-0.787" x2="0.965" y2="-0.787" width="0.1016" layer="51"/>
<smd name="1" x="-1.4" y="0" dx="1.6" dy="1.8" layer="1"/>
<smd name="2" x="1.4" y="0" dx="1.6" dy="1.8" layer="1"/>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.7018" y1="-0.8509" x2="-0.9517" y2="0.8491" layer="51"/>
<rectangle x1="0.9517" y1="-0.8491" x2="1.7018" y2="0.8509" layer="51"/>
<rectangle x1="-0.3" y1="-0.5001" x2="0.3" y2="0.5001" layer="35"/>
</package>
<package name="C3225">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;</description>
<wire x1="-2.473" y1="1.483" x2="2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="2.473" y1="-1.483" x2="-2.473" y2="-1.483" width="0.0508" layer="39"/>
<wire x1="-2.473" y1="-1.483" x2="-2.473" y2="1.483" width="0.0508" layer="39"/>
<wire x1="-0.9652" y1="1.2446" x2="0.9652" y2="1.2446" width="0.1016" layer="51"/>
<wire x1="-0.9652" y1="-1.2446" x2="0.9652" y2="-1.2446" width="0.1016" layer="51"/>
<wire x1="2.473" y1="1.483" x2="2.473" y2="-1.483" width="0.0508" layer="39"/>
<smd name="1" x="-1.4" y="0" dx="1.6" dy="2.7" layer="1"/>
<smd name="2" x="1.4" y="0" dx="1.6" dy="2.7" layer="1"/>
<text x="-1.905" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.7018" y1="-1.2954" x2="-0.9517" y2="1.3045" layer="51"/>
<rectangle x1="0.9517" y1="-1.3045" x2="1.7018" y2="1.2954" layer="51"/>
<rectangle x1="-0.1999" y1="-0.5001" x2="0.1999" y2="0.5001" layer="35"/>
</package>
<package name="C4532">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;</description>
<wire x1="-2.973" y1="1.983" x2="2.973" y2="1.983" width="0.0508" layer="39"/>
<wire x1="2.973" y1="-1.983" x2="-2.973" y2="-1.983" width="0.0508" layer="39"/>
<wire x1="-2.973" y1="-1.983" x2="-2.973" y2="1.983" width="0.0508" layer="39"/>
<wire x1="-1.4732" y1="1.6002" x2="1.4732" y2="1.6002" width="0.1016" layer="51"/>
<wire x1="-1.4478" y1="-1.6002" x2="1.4732" y2="-1.6002" width="0.1016" layer="51"/>
<wire x1="2.973" y1="1.983" x2="2.973" y2="-1.983" width="0.0508" layer="39"/>
<smd name="1" x="-1.95" y="0" dx="1.9" dy="3.4" layer="1"/>
<smd name="2" x="1.95" y="0" dx="1.9" dy="3.4" layer="1"/>
<text x="-1.905" y="2.54" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.81" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-2.3876" y1="-1.651" x2="-1.4376" y2="1.649" layer="51"/>
<rectangle x1="1.4478" y1="-1.651" x2="2.3978" y2="1.649" layer="51"/>
<rectangle x1="-0.4001" y1="-0.7" x2="0.4001" y2="0.7" layer="35"/>
</package>
<package name="C4564">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;</description>
<wire x1="-2.973" y1="3.483" x2="2.973" y2="3.483" width="0.0508" layer="39"/>
<wire x1="2.973" y1="-3.483" x2="-2.973" y2="-3.483" width="0.0508" layer="39"/>
<wire x1="-2.973" y1="-3.483" x2="-2.973" y2="3.483" width="0.0508" layer="39"/>
<wire x1="-1.4986" y1="3.2766" x2="1.4732" y2="3.2766" width="0.1016" layer="51"/>
<wire x1="-1.4732" y1="-3.2766" x2="1.4986" y2="-3.2766" width="0.1016" layer="51"/>
<wire x1="2.973" y1="3.483" x2="2.973" y2="-3.483" width="0.0508" layer="39"/>
<smd name="1" x="-1.95" y="0" dx="1.9" dy="6.8" layer="1"/>
<smd name="2" x="1.95" y="0" dx="1.9" dy="6.8" layer="1"/>
<text x="-1.905" y="3.81" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-5.08" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-2.413" y1="-3.3528" x2="-1.463" y2="3.3472" layer="51"/>
<rectangle x1="1.4478" y1="-3.3528" x2="2.3978" y2="3.3472" layer="51"/>
<rectangle x1="-0.5001" y1="-1" x2="0.5001" y2="1" layer="35"/>
</package>
<package name="C025-024X044">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 2.5 mm, outline 2.4 x 4.4 mm</description>
<wire x1="-2.159" y1="-0.635" x2="-2.159" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-2.159" y1="0.635" x2="-1.651" y2="1.143" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.159" y1="-0.635" x2="-1.651" y2="-1.143" width="0.1524" layer="21" curve="90"/>
<wire x1="1.651" y1="1.143" x2="-1.651" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.159" y1="-0.635" x2="2.159" y2="0.635" width="0.1524" layer="21"/>
<wire x1="1.651" y1="-1.143" x2="-1.651" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="1.651" y1="1.143" x2="2.159" y2="0.635" width="0.1524" layer="21" curve="-90"/>
<wire x1="1.651" y1="-1.143" x2="2.159" y2="-0.635" width="0.1524" layer="21" curve="90"/>
<wire x1="-0.3048" y1="0.762" x2="-0.3048" y2="-0.762" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="0.762" x2="0.3302" y2="-0.762" width="0.3048" layer="21"/>
<wire x1="1.27" y1="0" x2="0.3302" y2="0" width="0.1524" layer="51"/>
<wire x1="-1.27" y1="0" x2="-0.3048" y2="0" width="0.1524" layer="51"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="-1.778" y="1.397" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.778" y="-2.667" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C025-025X050">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 2.5 mm, outline 2.5 x 5 mm</description>
<wire x1="-2.159" y1="1.27" x2="2.159" y2="1.27" width="0.1524" layer="21"/>
<wire x1="2.159" y1="-1.27" x2="-2.159" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="2.413" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="1.016" x2="-2.413" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="2.159" y1="1.27" x2="2.413" y2="1.016" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.413" y1="1.016" x2="-2.159" y2="1.27" width="0.1524" layer="21" curve="-90"/>
<wire x1="2.159" y1="-1.27" x2="2.413" y2="-1.016" width="0.1524" layer="21" curve="90"/>
<wire x1="-2.413" y1="-1.016" x2="-2.159" y2="-1.27" width="0.1524" layer="21" curve="90"/>
<wire x1="0.762" y1="0" x2="0.381" y2="0" width="0.1524" layer="51"/>
<wire x1="0.381" y1="0" x2="0.254" y2="0" width="0.1524" layer="21"/>
<wire x1="0.254" y1="0" x2="0.254" y2="0.762" width="0.254" layer="21"/>
<wire x1="0.254" y1="0" x2="0.254" y2="-0.762" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0.762" x2="-0.254" y2="0" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0" x2="-0.254" y2="-0.762" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0" x2="-0.381" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="0" x2="-0.762" y2="0" width="0.1524" layer="51"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="-2.286" y="1.524" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.286" y="-2.794" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C025-030X050">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 2.5 mm, outline 3 x 5 mm</description>
<wire x1="-2.159" y1="1.524" x2="2.159" y2="1.524" width="0.1524" layer="21"/>
<wire x1="2.159" y1="-1.524" x2="-2.159" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.27" x2="2.413" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="1.27" x2="-2.413" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="2.159" y1="1.524" x2="2.413" y2="1.27" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.413" y1="1.27" x2="-2.159" y2="1.524" width="0.1524" layer="21" curve="-90"/>
<wire x1="2.159" y1="-1.524" x2="2.413" y2="-1.27" width="0.1524" layer="21" curve="90"/>
<wire x1="-2.413" y1="-1.27" x2="-2.159" y2="-1.524" width="0.1524" layer="21" curve="90"/>
<wire x1="0.762" y1="0" x2="0.381" y2="0" width="0.1524" layer="51"/>
<wire x1="0.381" y1="0" x2="0.254" y2="0" width="0.1524" layer="21"/>
<wire x1="0.254" y1="0" x2="0.254" y2="0.762" width="0.254" layer="21"/>
<wire x1="0.254" y1="0" x2="0.254" y2="-0.762" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0.762" x2="-0.254" y2="0" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0" x2="-0.254" y2="-0.762" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0" x2="-0.381" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="0" x2="-0.762" y2="0" width="0.1524" layer="51"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="-2.286" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.286" y="-3.048" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C025-040X050">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 2.5 mm, outline 4 x 5 mm</description>
<wire x1="-2.159" y1="1.905" x2="2.159" y2="1.905" width="0.1524" layer="21"/>
<wire x1="2.159" y1="-1.905" x2="-2.159" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.651" x2="2.413" y2="-1.651" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="1.651" x2="-2.413" y2="-1.651" width="0.1524" layer="21"/>
<wire x1="2.159" y1="1.905" x2="2.413" y2="1.651" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.413" y1="1.651" x2="-2.159" y2="1.905" width="0.1524" layer="21" curve="-90"/>
<wire x1="2.159" y1="-1.905" x2="2.413" y2="-1.651" width="0.1524" layer="21" curve="90"/>
<wire x1="-2.413" y1="-1.651" x2="-2.159" y2="-1.905" width="0.1524" layer="21" curve="90"/>
<wire x1="0.762" y1="0" x2="0.381" y2="0" width="0.1524" layer="51"/>
<wire x1="0.381" y1="0" x2="0.254" y2="0" width="0.1524" layer="21"/>
<wire x1="0.254" y1="0" x2="0.254" y2="0.762" width="0.254" layer="21"/>
<wire x1="0.254" y1="0" x2="0.254" y2="-0.762" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0.762" x2="-0.254" y2="0" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0" x2="-0.254" y2="-0.762" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0" x2="-0.381" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="0" x2="-0.762" y2="0" width="0.1524" layer="51"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="-2.286" y="2.159" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.286" y="-3.429" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C025-050X050">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 2.5 mm, outline 5 x 5 mm</description>
<wire x1="-2.159" y1="2.286" x2="2.159" y2="2.286" width="0.1524" layer="21"/>
<wire x1="2.159" y1="-2.286" x2="-2.159" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="2.413" y1="2.032" x2="2.413" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="2.032" x2="-2.413" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="2.159" y1="2.286" x2="2.413" y2="2.032" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.413" y1="2.032" x2="-2.159" y2="2.286" width="0.1524" layer="21" curve="-90"/>
<wire x1="2.159" y1="-2.286" x2="2.413" y2="-2.032" width="0.1524" layer="21" curve="90"/>
<wire x1="-2.413" y1="-2.032" x2="-2.159" y2="-2.286" width="0.1524" layer="21" curve="90"/>
<wire x1="0.762" y1="0" x2="0.381" y2="0" width="0.1524" layer="51"/>
<wire x1="0.381" y1="0" x2="0.254" y2="0" width="0.1524" layer="21"/>
<wire x1="0.254" y1="0" x2="0.254" y2="0.762" width="0.254" layer="21"/>
<wire x1="0.254" y1="0" x2="0.254" y2="-0.762" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0.762" x2="-0.254" y2="0" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0" x2="-0.254" y2="-0.762" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0" x2="-0.381" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="0" x2="-0.762" y2="0" width="0.1524" layer="51"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="-2.286" y="2.54" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.286" y="-3.81" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C025-060X050">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 2.5 mm, outline 6 x 5 mm</description>
<wire x1="-2.159" y1="2.794" x2="2.159" y2="2.794" width="0.1524" layer="21"/>
<wire x1="2.159" y1="-2.794" x2="-2.159" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="2.413" y1="2.54" x2="2.413" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="2.54" x2="-2.413" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="2.159" y1="2.794" x2="2.413" y2="2.54" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.413" y1="2.54" x2="-2.159" y2="2.794" width="0.1524" layer="21" curve="-90"/>
<wire x1="2.159" y1="-2.794" x2="2.413" y2="-2.54" width="0.1524" layer="21" curve="90"/>
<wire x1="-2.413" y1="-2.54" x2="-2.159" y2="-2.794" width="0.1524" layer="21" curve="90"/>
<wire x1="0.762" y1="0" x2="0.381" y2="0" width="0.1524" layer="51"/>
<wire x1="0.381" y1="0" x2="0.254" y2="0" width="0.1524" layer="21"/>
<wire x1="0.254" y1="0" x2="0.254" y2="0.762" width="0.254" layer="21"/>
<wire x1="0.254" y1="0" x2="0.254" y2="-0.762" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0.762" x2="-0.254" y2="0" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0" x2="-0.254" y2="-0.762" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0" x2="-0.381" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="0" x2="-0.762" y2="0" width="0.1524" layer="51"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="-2.286" y="3.048" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.032" y="-2.413" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C025_050-024X070">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 2.5 mm + 5 mm, outline 2.4 x 7 mm</description>
<wire x1="-2.159" y1="-0.635" x2="-2.159" y2="0.635" width="0.1524" layer="51"/>
<wire x1="-2.159" y1="0.635" x2="-1.651" y2="1.143" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.159" y1="-0.635" x2="-1.651" y2="-1.143" width="0.1524" layer="21" curve="90"/>
<wire x1="1.651" y1="1.143" x2="-1.651" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.159" y1="-0.635" x2="2.159" y2="0.635" width="0.1524" layer="51"/>
<wire x1="1.651" y1="-1.143" x2="-1.651" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="1.651" y1="1.143" x2="2.159" y2="0.635" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.191" y1="-1.143" x2="-3.9624" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="-4.191" y1="1.143" x2="-3.9624" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-4.699" y1="-0.635" x2="-4.191" y2="-1.143" width="0.1524" layer="21" curve="90"/>
<wire x1="1.651" y1="-1.143" x2="2.159" y2="-0.635" width="0.1524" layer="21" curve="90"/>
<wire x1="-4.699" y1="0.635" x2="-4.191" y2="1.143" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.699" y1="-0.635" x2="-4.699" y2="0.635" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="1.143" x2="-2.5654" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="-1.143" x2="-2.5654" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="-0.3048" y1="0.762" x2="-0.3048" y2="-0.762" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="0.762" x2="0.3302" y2="-0.762" width="0.3048" layer="21"/>
<wire x1="1.27" y1="0" x2="0.3302" y2="0" width="0.1524" layer="51"/>
<wire x1="-1.27" y1="0" x2="-0.3048" y2="0" width="0.1524" layer="51"/>
<pad name="1" x="-3.81" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="3" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="-3.81" y="1.397" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.81" y="-2.667" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C025_050-025X075">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 2.5 + 5 mm, outline 2.5 x 7.5 mm</description>
<wire x1="-2.159" y1="1.27" x2="2.159" y2="1.27" width="0.1524" layer="21"/>
<wire x1="2.159" y1="-1.27" x2="-2.159" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="1.016" x2="-2.413" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="2.159" y1="1.27" x2="2.413" y2="1.016" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.413" y1="1.016" x2="-2.159" y2="1.27" width="0.1524" layer="21" curve="-90"/>
<wire x1="2.159" y1="-1.27" x2="2.413" y2="-1.016" width="0.1524" layer="21" curve="90"/>
<wire x1="-2.413" y1="-1.016" x2="-2.159" y2="-1.27" width="0.1524" layer="21" curve="90"/>
<wire x1="0.381" y1="0" x2="0.254" y2="0" width="0.1524" layer="21"/>
<wire x1="0.254" y1="0" x2="0.254" y2="0.762" width="0.254" layer="21"/>
<wire x1="0.254" y1="0" x2="0.254" y2="-0.762" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0.762" x2="-0.254" y2="0" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0" x2="-0.254" y2="-0.762" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0" x2="-0.381" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="0" x2="-0.762" y2="0" width="0.1524" layer="51"/>
<wire x1="4.953" y1="1.016" x2="4.953" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="4.699" y1="1.27" x2="4.953" y2="1.016" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.699" y1="-1.27" x2="4.953" y2="-1.016" width="0.1524" layer="21" curve="90"/>
<wire x1="2.794" y1="1.27" x2="4.699" y2="1.27" width="0.1524" layer="21"/>
<wire x1="4.699" y1="-1.27" x2="2.794" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.016" x2="2.413" y2="0.762" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-0.762" x2="2.413" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="2.413" y1="0.254" x2="2.413" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="1.778" y1="0" x2="2.286" y2="0" width="0.1524" layer="51"/>
<wire x1="2.286" y1="0" x2="2.794" y2="0" width="0.1524" layer="21"/>
<wire x1="2.794" y1="0" x2="3.302" y2="0" width="0.1524" layer="51"/>
<wire x1="0.762" y1="0" x2="0.381" y2="0" width="0.1524" layer="51"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="3" x="3.81" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="-2.159" y="1.651" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.159" y="-2.794" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C025_050-035X075">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 2.5 + 5 mm, outline 3.5 x 7.5 mm</description>
<wire x1="-2.159" y1="1.778" x2="2.159" y2="1.778" width="0.1524" layer="21"/>
<wire x1="2.159" y1="-1.778" x2="-2.159" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="1.524" x2="-2.413" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="2.159" y1="1.778" x2="2.413" y2="1.524" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.413" y1="1.524" x2="-2.159" y2="1.778" width="0.1524" layer="21" curve="-90"/>
<wire x1="2.159" y1="-1.778" x2="2.413" y2="-1.524" width="0.1524" layer="21" curve="90"/>
<wire x1="-2.413" y1="-1.524" x2="-2.159" y2="-1.778" width="0.1524" layer="21" curve="90"/>
<wire x1="0.381" y1="0" x2="0.254" y2="0" width="0.1524" layer="21"/>
<wire x1="0.254" y1="0" x2="0.254" y2="0.762" width="0.254" layer="21"/>
<wire x1="0.254" y1="0" x2="0.254" y2="-0.762" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0.762" x2="-0.254" y2="0" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0" x2="-0.254" y2="-0.762" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0" x2="-0.381" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="0" x2="-0.762" y2="0" width="0.1524" layer="51"/>
<wire x1="4.953" y1="1.524" x2="4.953" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="4.699" y1="1.778" x2="4.953" y2="1.524" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.699" y1="-1.778" x2="4.953" y2="-1.524" width="0.1524" layer="21" curve="90"/>
<wire x1="2.794" y1="1.778" x2="4.699" y2="1.778" width="0.1524" layer="21"/>
<wire x1="4.699" y1="-1.778" x2="2.794" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="2.413" y1="1.524" x2="2.413" y2="1.016" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.016" x2="2.413" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="2.413" y1="0.508" x2="2.413" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="0.381" y1="0" x2="0.762" y2="0" width="0.1524" layer="51"/>
<wire x1="2.286" y1="0" x2="2.794" y2="0" width="0.1524" layer="21"/>
<wire x1="2.794" y1="0" x2="3.302" y2="0" width="0.1524" layer="51"/>
<wire x1="2.286" y1="0" x2="1.778" y2="0" width="0.1524" layer="51"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="3" x="3.81" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="-2.286" y="2.159" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.286" y="-3.302" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C025_050-045X075">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 2.5 + 5 mm, outline 4.5 x 7.5 mm</description>
<wire x1="-2.159" y1="2.286" x2="2.159" y2="2.286" width="0.1524" layer="21"/>
<wire x1="2.159" y1="-2.286" x2="-2.159" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="2.032" x2="-2.413" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="2.159" y1="2.286" x2="2.413" y2="2.032" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.413" y1="2.032" x2="-2.159" y2="2.286" width="0.1524" layer="21" curve="-90"/>
<wire x1="2.159" y1="-2.286" x2="2.413" y2="-2.032" width="0.1524" layer="21" curve="90"/>
<wire x1="-2.413" y1="-2.032" x2="-2.159" y2="-2.286" width="0.1524" layer="21" curve="90"/>
<wire x1="0.381" y1="0" x2="0.254" y2="0" width="0.1524" layer="21"/>
<wire x1="0.254" y1="0" x2="0.254" y2="0.762" width="0.254" layer="21"/>
<wire x1="0.254" y1="0" x2="0.254" y2="-0.762" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0.762" x2="-0.254" y2="0" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0" x2="-0.254" y2="-0.762" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0" x2="-0.381" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="0" x2="-0.762" y2="0" width="0.1524" layer="51"/>
<wire x1="4.953" y1="2.032" x2="4.953" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="4.699" y1="2.286" x2="4.953" y2="2.032" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.699" y1="-2.286" x2="4.953" y2="-2.032" width="0.1524" layer="21" curve="90"/>
<wire x1="2.794" y1="2.286" x2="4.699" y2="2.286" width="0.1524" layer="21"/>
<wire x1="4.699" y1="-2.286" x2="2.794" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="2.413" y1="2.032" x2="2.413" y2="1.397" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-1.397" x2="2.413" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="2.413" y1="0.762" x2="2.413" y2="-0.762" width="0.1524" layer="21"/>
<wire x1="2.286" y1="0" x2="2.794" y2="0" width="0.1524" layer="21"/>
<wire x1="2.794" y1="0" x2="3.302" y2="0" width="0.1524" layer="51"/>
<wire x1="0.381" y1="0" x2="0.762" y2="0" width="0.1524" layer="51"/>
<wire x1="2.286" y1="0" x2="1.778" y2="0" width="0.1524" layer="51"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="3" x="3.81" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="-2.286" y="2.667" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.286" y="-3.81" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C025_050-055X075">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 2.5 + 5 mm, outline 5.5 x 7.5 mm</description>
<wire x1="-2.159" y1="2.794" x2="2.159" y2="2.794" width="0.1524" layer="21"/>
<wire x1="2.159" y1="-2.794" x2="-2.159" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="2.54" x2="-2.413" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="2.159" y1="2.794" x2="2.413" y2="2.54" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.413" y1="2.54" x2="-2.159" y2="2.794" width="0.1524" layer="21" curve="-90"/>
<wire x1="2.159" y1="-2.794" x2="2.413" y2="-2.54" width="0.1524" layer="21" curve="90"/>
<wire x1="-2.413" y1="-2.54" x2="-2.159" y2="-2.794" width="0.1524" layer="21" curve="90"/>
<wire x1="0.381" y1="0" x2="0.254" y2="0" width="0.1524" layer="21"/>
<wire x1="0.254" y1="0" x2="0.254" y2="0.762" width="0.254" layer="21"/>
<wire x1="0.254" y1="0" x2="0.254" y2="-0.762" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0.762" x2="-0.254" y2="0" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0" x2="-0.254" y2="-0.762" width="0.254" layer="21"/>
<wire x1="-0.254" y1="0" x2="-0.381" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="0" x2="-0.762" y2="0" width="0.1524" layer="51"/>
<wire x1="4.953" y1="2.54" x2="4.953" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="4.699" y1="2.794" x2="4.953" y2="2.54" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.699" y1="-2.794" x2="4.953" y2="-2.54" width="0.1524" layer="21" curve="90"/>
<wire x1="2.794" y1="2.794" x2="4.699" y2="2.794" width="0.1524" layer="21"/>
<wire x1="4.699" y1="-2.794" x2="2.794" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="2.413" y1="2.54" x2="2.413" y2="2.032" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-2.032" x2="2.413" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="2.413" y1="0.762" x2="2.413" y2="-0.762" width="0.1524" layer="21"/>
<wire x1="1.778" y1="0" x2="2.286" y2="0" width="0.1524" layer="51"/>
<wire x1="2.286" y1="0" x2="2.794" y2="0" width="0.1524" layer="21"/>
<wire x1="2.794" y1="0" x2="3.302" y2="0" width="0.1524" layer="51"/>
<wire x1="0.381" y1="0" x2="0.762" y2="0" width="0.1524" layer="51"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="3" x="3.81" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="-2.286" y="3.175" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.032" y="-2.286" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C050-024X044">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 5 mm, outline 2.4 x 4.4 mm</description>
<wire x1="-2.159" y1="-0.635" x2="-2.159" y2="0.635" width="0.1524" layer="51"/>
<wire x1="-2.159" y1="0.635" x2="-1.651" y2="1.143" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.159" y1="-0.635" x2="-1.651" y2="-1.143" width="0.1524" layer="21" curve="90"/>
<wire x1="1.651" y1="1.143" x2="-1.651" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.159" y1="-0.635" x2="2.159" y2="0.635" width="0.1524" layer="51"/>
<wire x1="1.651" y1="-1.143" x2="-1.651" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="1.651" y1="1.143" x2="2.159" y2="0.635" width="0.1524" layer="21" curve="-90"/>
<wire x1="1.651" y1="-1.143" x2="2.159" y2="-0.635" width="0.1524" layer="21" curve="90"/>
<wire x1="-0.3048" y1="0.762" x2="-0.3048" y2="0" width="0.3048" layer="21"/>
<wire x1="-0.3048" y1="0" x2="-0.3048" y2="-0.762" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="0.762" x2="0.3302" y2="0" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="0" x2="0.3302" y2="-0.762" width="0.3048" layer="21"/>
<wire x1="1.27" y1="0" x2="0.3302" y2="0" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0" x2="-0.3048" y2="0" width="0.1524" layer="21"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.8128" shape="octagon"/>
<text x="-2.159" y="1.397" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.159" y="-2.667" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="2.159" y1="-0.381" x2="2.54" y2="0.381" layer="51"/>
<rectangle x1="-2.54" y1="-0.381" x2="-2.159" y2="0.381" layer="51"/>
</package>
<package name="C050-025X075">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 5 mm, outline 2.5 x 7.5 mm</description>
<wire x1="-0.3048" y1="0.635" x2="-0.3048" y2="0" width="0.3048" layer="21"/>
<wire x1="-0.3048" y1="0" x2="-0.3048" y2="-0.635" width="0.3048" layer="21"/>
<wire x1="-0.3048" y1="0" x2="-1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="0.3302" y1="0.635" x2="0.3302" y2="0" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="0" x2="0.3302" y2="-0.635" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="0" x2="1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="-3.683" y1="1.016" x2="-3.683" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="-1.27" x2="3.429" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.683" y1="-1.016" x2="3.683" y2="1.016" width="0.1524" layer="21"/>
<wire x1="3.429" y1="1.27" x2="-3.429" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.429" y1="1.27" x2="3.683" y2="1.016" width="0.1524" layer="21" curve="-90"/>
<wire x1="3.429" y1="-1.27" x2="3.683" y2="-1.016" width="0.1524" layer="21" curve="90"/>
<wire x1="-3.683" y1="-1.016" x2="-3.429" y2="-1.27" width="0.1524" layer="21" curve="90"/>
<wire x1="-3.683" y1="1.016" x2="-3.429" y2="1.27" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.8128" shape="octagon"/>
<text x="-3.429" y="1.651" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.429" y="-2.794" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C050-045X075">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 5 mm, outline 4.5 x 7.5 mm</description>
<wire x1="-0.3048" y1="0.635" x2="-0.3048" y2="0" width="0.3048" layer="21"/>
<wire x1="-0.3048" y1="0" x2="-0.3048" y2="-0.635" width="0.3048" layer="21"/>
<wire x1="-0.3048" y1="0" x2="-1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="0.3302" y1="0.635" x2="0.3302" y2="0" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="0" x2="0.3302" y2="-0.635" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="0" x2="1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="-3.683" y1="2.032" x2="-3.683" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="-2.286" x2="3.429" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="3.683" y1="-2.032" x2="3.683" y2="2.032" width="0.1524" layer="21"/>
<wire x1="3.429" y1="2.286" x2="-3.429" y2="2.286" width="0.1524" layer="21"/>
<wire x1="3.429" y1="2.286" x2="3.683" y2="2.032" width="0.1524" layer="21" curve="-90"/>
<wire x1="3.429" y1="-2.286" x2="3.683" y2="-2.032" width="0.1524" layer="21" curve="90"/>
<wire x1="-3.683" y1="-2.032" x2="-3.429" y2="-2.286" width="0.1524" layer="21" curve="90"/>
<wire x1="-3.683" y1="2.032" x2="-3.429" y2="2.286" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.8128" shape="octagon"/>
<text x="-3.556" y="2.667" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.556" y="-3.81" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C050-030X075">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 5 mm, outline 3 x 7.5 mm</description>
<wire x1="-0.3048" y1="0.635" x2="-0.3048" y2="0" width="0.3048" layer="21"/>
<wire x1="-0.3048" y1="0" x2="-0.3048" y2="-0.635" width="0.3048" layer="21"/>
<wire x1="-0.3048" y1="0" x2="-1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="0.3302" y1="0.635" x2="0.3302" y2="0" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="0" x2="0.3302" y2="-0.635" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="0" x2="1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="-3.683" y1="1.27" x2="-3.683" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="-1.524" x2="3.429" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="3.683" y1="-1.27" x2="3.683" y2="1.27" width="0.1524" layer="21"/>
<wire x1="3.429" y1="1.524" x2="-3.429" y2="1.524" width="0.1524" layer="21"/>
<wire x1="3.429" y1="1.524" x2="3.683" y2="1.27" width="0.1524" layer="21" curve="-90"/>
<wire x1="3.429" y1="-1.524" x2="3.683" y2="-1.27" width="0.1524" layer="21" curve="90"/>
<wire x1="-3.683" y1="-1.27" x2="-3.429" y2="-1.524" width="0.1524" layer="21" curve="90"/>
<wire x1="-3.683" y1="1.27" x2="-3.429" y2="1.524" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.8128" shape="octagon"/>
<text x="-3.556" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.556" y="-3.048" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C050-050X075">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 5 mm, outline 5 x 7.5 mm</description>
<wire x1="-0.3048" y1="0.635" x2="-0.3048" y2="0" width="0.3048" layer="21"/>
<wire x1="-0.3048" y1="0" x2="-0.3048" y2="-0.635" width="0.3048" layer="21"/>
<wire x1="-0.3048" y1="0" x2="-1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="0.3302" y1="0.635" x2="0.3302" y2="0" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="0" x2="0.3302" y2="-0.635" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="0" x2="1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="-3.683" y1="2.286" x2="-3.683" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="-2.54" x2="3.429" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="3.683" y1="-2.286" x2="3.683" y2="2.286" width="0.1524" layer="21"/>
<wire x1="3.429" y1="2.54" x2="-3.429" y2="2.54" width="0.1524" layer="21"/>
<wire x1="3.429" y1="2.54" x2="3.683" y2="2.286" width="0.1524" layer="21" curve="-90"/>
<wire x1="3.429" y1="-2.54" x2="3.683" y2="-2.286" width="0.1524" layer="21" curve="90"/>
<wire x1="-3.683" y1="-2.286" x2="-3.429" y2="-2.54" width="0.1524" layer="21" curve="90"/>
<wire x1="-3.683" y1="2.286" x2="-3.429" y2="2.54" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.8128" shape="octagon"/>
<text x="-3.429" y="2.921" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-2.159" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C050-055X075">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 5 mm, outline 5.5 x 7.5 mm</description>
<wire x1="-0.3048" y1="0.635" x2="-0.3048" y2="0" width="0.3048" layer="21"/>
<wire x1="-0.3048" y1="0" x2="-0.3048" y2="-0.635" width="0.3048" layer="21"/>
<wire x1="-0.3048" y1="0" x2="-1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="0.3302" y1="0.635" x2="0.3302" y2="0" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="0" x2="0.3302" y2="-0.635" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="0" x2="1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="-3.683" y1="2.54" x2="-3.683" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="-2.794" x2="3.429" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="3.683" y1="-2.54" x2="3.683" y2="2.54" width="0.1524" layer="21"/>
<wire x1="3.429" y1="2.794" x2="-3.429" y2="2.794" width="0.1524" layer="21"/>
<wire x1="3.429" y1="2.794" x2="3.683" y2="2.54" width="0.1524" layer="21" curve="-90"/>
<wire x1="3.429" y1="-2.794" x2="3.683" y2="-2.54" width="0.1524" layer="21" curve="90"/>
<wire x1="-3.683" y1="-2.54" x2="-3.429" y2="-2.794" width="0.1524" layer="21" curve="90"/>
<wire x1="-3.683" y1="2.54" x2="-3.429" y2="2.794" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.8128" shape="octagon"/>
<text x="-3.429" y="3.175" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.302" y="-2.286" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C050-075X075">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 5 mm, outline 7.5 x 7.5 mm</description>
<wire x1="-1.524" y1="0" x2="-0.4572" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.4572" y1="0" x2="-0.4572" y2="0.762" width="0.4064" layer="21"/>
<wire x1="-0.4572" y1="0" x2="-0.4572" y2="-0.762" width="0.4064" layer="21"/>
<wire x1="0.4318" y1="0.762" x2="0.4318" y2="0" width="0.4064" layer="21"/>
<wire x1="0.4318" y1="0" x2="1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="0.4318" y1="0" x2="0.4318" y2="-0.762" width="0.4064" layer="21"/>
<wire x1="-3.683" y1="3.429" x2="-3.683" y2="-3.429" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="-3.683" x2="3.429" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="3.683" y1="-3.429" x2="3.683" y2="3.429" width="0.1524" layer="21"/>
<wire x1="3.429" y1="3.683" x2="-3.429" y2="3.683" width="0.1524" layer="21"/>
<wire x1="3.429" y1="3.683" x2="3.683" y2="3.429" width="0.1524" layer="21" curve="-90"/>
<wire x1="3.429" y1="-3.683" x2="3.683" y2="-3.429" width="0.1524" layer="21" curve="90"/>
<wire x1="-3.683" y1="-3.429" x2="-3.429" y2="-3.683" width="0.1524" layer="21" curve="90"/>
<wire x1="-3.683" y1="3.429" x2="-3.429" y2="3.683" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.8128" shape="octagon"/>
<text x="-3.429" y="4.064" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-2.921" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C050H075X075">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
Horizontal, grid 5 mm, outline 7.5 x 7.5 mm</description>
<wire x1="-3.683" y1="7.112" x2="-3.683" y2="0.508" width="0.1524" layer="21"/>
<wire x1="-3.683" y1="0.508" x2="-3.302" y2="0.508" width="0.1524" layer="21"/>
<wire x1="-3.302" y1="0.508" x2="-1.778" y2="0.508" width="0.1524" layer="51"/>
<wire x1="-1.778" y1="0.508" x2="1.778" y2="0.508" width="0.1524" layer="21"/>
<wire x1="1.778" y1="0.508" x2="3.302" y2="0.508" width="0.1524" layer="51"/>
<wire x1="3.302" y1="0.508" x2="3.683" y2="0.508" width="0.1524" layer="21"/>
<wire x1="3.683" y1="0.508" x2="3.683" y2="7.112" width="0.1524" layer="21"/>
<wire x1="3.175" y1="7.62" x2="-3.175" y2="7.62" width="0.1524" layer="21"/>
<wire x1="-0.3048" y1="2.413" x2="-0.3048" y2="1.778" width="0.3048" layer="21"/>
<wire x1="-0.3048" y1="1.778" x2="-0.3048" y2="1.143" width="0.3048" layer="21"/>
<wire x1="-0.3048" y1="1.778" x2="-1.651" y2="1.778" width="0.1524" layer="21"/>
<wire x1="0.3302" y1="2.413" x2="0.3302" y2="1.778" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="1.778" x2="0.3302" y2="1.143" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="1.778" x2="1.651" y2="1.778" width="0.1524" layer="21"/>
<wire x1="-3.683" y1="7.112" x2="-3.175" y2="7.62" width="0.1524" layer="21" curve="-90"/>
<wire x1="3.175" y1="7.62" x2="3.683" y2="7.112" width="0.1524" layer="21" curve="-90"/>
<wire x1="-2.54" y1="0" x2="-2.54" y2="0.254" width="0.508" layer="51"/>
<wire x1="2.54" y1="0" x2="2.54" y2="0.254" width="0.508" layer="51"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.8128" shape="octagon"/>
<text x="-3.302" y="8.001" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="3.175" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-2.794" y1="0.127" x2="-2.286" y2="0.508" layer="51"/>
<rectangle x1="2.286" y1="0.127" x2="2.794" y2="0.508" layer="51"/>
</package>
<package name="C075-032X103">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 7.5 mm, outline 3.2 x 10.3 mm</description>
<wire x1="4.826" y1="1.524" x2="-4.826" y2="1.524" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="1.27" x2="-5.08" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="-1.524" x2="4.826" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.27" x2="5.08" y2="1.27" width="0.1524" layer="21"/>
<wire x1="4.826" y1="1.524" x2="5.08" y2="1.27" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.826" y1="-1.524" x2="5.08" y2="-1.27" width="0.1524" layer="21" curve="90"/>
<wire x1="-5.08" y1="-1.27" x2="-4.826" y2="-1.524" width="0.1524" layer="21" curve="90"/>
<wire x1="-5.08" y1="1.27" x2="-4.826" y2="1.524" width="0.1524" layer="21" curve="-90"/>
<wire x1="0.508" y1="0" x2="2.54" y2="0" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0" x2="-0.508" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.508" y1="0.889" x2="-0.508" y2="0" width="0.4064" layer="21"/>
<wire x1="-0.508" y1="0" x2="-0.508" y2="-0.889" width="0.4064" layer="21"/>
<wire x1="0.508" y1="0.889" x2="0.508" y2="0" width="0.4064" layer="21"/>
<wire x1="0.508" y1="0" x2="0.508" y2="-0.889" width="0.4064" layer="21"/>
<pad name="1" x="-3.81" y="0" drill="0.9144" shape="octagon"/>
<pad name="2" x="3.81" y="0" drill="0.9144" shape="octagon"/>
<text x="-4.826" y="1.905" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.826" y="-3.048" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C075-042X103">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 7.5 mm, outline 4.2 x 10.3 mm</description>
<wire x1="4.826" y1="2.032" x2="-4.826" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="1.778" x2="-5.08" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="-2.032" x2="4.826" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-1.778" x2="5.08" y2="1.778" width="0.1524" layer="21"/>
<wire x1="4.826" y1="2.032" x2="5.08" y2="1.778" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.826" y1="-2.032" x2="5.08" y2="-1.778" width="0.1524" layer="21" curve="90"/>
<wire x1="-5.08" y1="-1.778" x2="-4.826" y2="-2.032" width="0.1524" layer="21" curve="90"/>
<wire x1="-5.08" y1="1.778" x2="-4.826" y2="2.032" width="0.1524" layer="21" curve="-90"/>
<wire x1="-1.27" y1="0" x2="2.667" y2="0" width="0.1524" layer="21"/>
<wire x1="-2.667" y1="0" x2="-2.159" y2="0" width="0.1524" layer="21"/>
<wire x1="-2.159" y1="1.27" x2="-2.159" y2="0" width="0.4064" layer="21"/>
<wire x1="-2.159" y1="0" x2="-2.159" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="0" width="0.4064" layer="21"/>
<wire x1="-1.27" y1="0" x2="-1.27" y2="-1.27" width="0.4064" layer="21"/>
<pad name="1" x="-3.81" y="0" drill="0.9144" shape="octagon"/>
<pad name="2" x="3.81" y="0" drill="0.9144" shape="octagon"/>
<text x="-4.699" y="2.413" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-0.635" y="-1.651" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C075-052X106">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 7.5 mm, outline 5.2 x 10.6 mm</description>
<wire x1="4.953" y1="2.54" x2="-4.953" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-5.207" y1="2.286" x2="-5.207" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-4.953" y1="-2.54" x2="4.953" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="5.207" y1="-2.286" x2="5.207" y2="2.286" width="0.1524" layer="21"/>
<wire x1="4.953" y1="2.54" x2="5.207" y2="2.286" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.953" y1="-2.54" x2="5.207" y2="-2.286" width="0.1524" layer="21" curve="90"/>
<wire x1="-5.207" y1="-2.286" x2="-4.953" y2="-2.54" width="0.1524" layer="21" curve="90"/>
<wire x1="-5.207" y1="2.286" x2="-4.953" y2="2.54" width="0.1524" layer="21" curve="-90"/>
<wire x1="-1.27" y1="0" x2="2.667" y2="0" width="0.1524" layer="21"/>
<wire x1="-2.667" y1="0" x2="-2.159" y2="0" width="0.1524" layer="21"/>
<wire x1="-2.159" y1="1.27" x2="-2.159" y2="0" width="0.4064" layer="21"/>
<wire x1="-2.159" y1="0" x2="-2.159" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="0" width="0.4064" layer="21"/>
<wire x1="-1.27" y1="0" x2="-1.27" y2="-1.27" width="0.4064" layer="21"/>
<pad name="1" x="-3.81" y="0" drill="0.9144" shape="octagon"/>
<pad name="2" x="3.81" y="0" drill="0.9144" shape="octagon"/>
<text x="-4.826" y="2.921" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-0.635" y="-2.032" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C102-043X133">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 10.2 mm, outline 4.3 x 13.3 mm</description>
<wire x1="-3.175" y1="1.27" x2="-3.175" y2="0" width="0.4064" layer="21"/>
<wire x1="-2.286" y1="1.27" x2="-2.286" y2="0" width="0.4064" layer="21"/>
<wire x1="3.81" y1="0" x2="-2.286" y2="0" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="0" x2="-2.286" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-3.81" y1="0" x2="-3.175" y2="0" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="0" x2="-3.175" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-6.096" y1="2.032" x2="6.096" y2="2.032" width="0.1524" layer="21"/>
<wire x1="6.604" y1="1.524" x2="6.604" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="6.096" y1="-2.032" x2="-6.096" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="-6.604" y1="-1.524" x2="-6.604" y2="1.524" width="0.1524" layer="21"/>
<wire x1="6.096" y1="2.032" x2="6.604" y2="1.524" width="0.1524" layer="21" curve="-90"/>
<wire x1="6.096" y1="-2.032" x2="6.604" y2="-1.524" width="0.1524" layer="21" curve="90"/>
<wire x1="-6.604" y1="-1.524" x2="-6.096" y2="-2.032" width="0.1524" layer="21" curve="90"/>
<wire x1="-6.604" y1="1.524" x2="-6.096" y2="2.032" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-5.08" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="5.08" y="0" drill="1.016" shape="octagon"/>
<text x="-6.096" y="2.413" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.524" y="-1.651" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C102-054X133">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 10.2 mm, outline 5.4 x 13.3 mm</description>
<wire x1="-3.175" y1="1.27" x2="-3.175" y2="0" width="0.4064" layer="21"/>
<wire x1="-2.286" y1="1.27" x2="-2.286" y2="0" width="0.4064" layer="21"/>
<wire x1="3.81" y1="0" x2="-2.286" y2="0" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="0" x2="-2.286" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-3.81" y1="0" x2="-3.175" y2="0" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="0" x2="-3.175" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-6.096" y1="2.54" x2="6.096" y2="2.54" width="0.1524" layer="21"/>
<wire x1="6.604" y1="2.032" x2="6.604" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="6.096" y1="-2.54" x2="-6.096" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-6.604" y1="-2.032" x2="-6.604" y2="2.032" width="0.1524" layer="21"/>
<wire x1="6.096" y1="2.54" x2="6.604" y2="2.032" width="0.1524" layer="21" curve="-90"/>
<wire x1="6.096" y1="-2.54" x2="6.604" y2="-2.032" width="0.1524" layer="21" curve="90"/>
<wire x1="-6.604" y1="-2.032" x2="-6.096" y2="-2.54" width="0.1524" layer="21" curve="90"/>
<wire x1="-6.604" y1="2.032" x2="-6.096" y2="2.54" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-5.08" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="5.08" y="0" drill="1.016" shape="octagon"/>
<text x="-6.096" y="2.921" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.524" y="-1.905" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C102-064X133">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 10.2 mm, outline 6.4 x 13.3 mm</description>
<wire x1="-3.175" y1="1.27" x2="-3.175" y2="0" width="0.4064" layer="21"/>
<wire x1="-2.286" y1="1.27" x2="-2.286" y2="0" width="0.4064" layer="21"/>
<wire x1="3.81" y1="0" x2="-2.286" y2="0" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="0" x2="-2.286" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-3.81" y1="0" x2="-3.175" y2="0" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="0" x2="-3.175" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-6.096" y1="3.048" x2="6.096" y2="3.048" width="0.1524" layer="21"/>
<wire x1="6.604" y1="2.54" x2="6.604" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="6.096" y1="-3.048" x2="-6.096" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-6.604" y1="-2.54" x2="-6.604" y2="2.54" width="0.1524" layer="21"/>
<wire x1="6.096" y1="3.048" x2="6.604" y2="2.54" width="0.1524" layer="21" curve="-90"/>
<wire x1="6.096" y1="-3.048" x2="6.604" y2="-2.54" width="0.1524" layer="21" curve="90"/>
<wire x1="-6.604" y1="-2.54" x2="-6.096" y2="-3.048" width="0.1524" layer="21" curve="90"/>
<wire x1="-6.604" y1="2.54" x2="-6.096" y2="3.048" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-5.08" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="5.08" y="0" drill="1.016" shape="octagon"/>
<text x="-6.096" y="3.429" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.524" y="-2.032" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C102_152-062X184">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 10.2 mm + 15.2 mm, outline 6.2 x 18.4 mm</description>
<wire x1="-2.286" y1="1.27" x2="-2.286" y2="0" width="0.4064" layer="21"/>
<wire x1="-2.286" y1="0" x2="-2.286" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-3.175" y1="1.27" x2="-3.175" y2="0" width="0.4064" layer="21"/>
<wire x1="-3.175" y1="0" x2="-3.175" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-3.683" y1="0" x2="-3.175" y2="0" width="0.1524" layer="21"/>
<wire x1="-2.286" y1="0" x2="3.683" y2="0" width="0.1524" layer="21"/>
<wire x1="6.477" y1="0" x2="8.636" y2="0" width="0.1524" layer="21"/>
<wire x1="-6.096" y1="3.048" x2="6.223" y2="3.048" width="0.1524" layer="21"/>
<wire x1="6.223" y1="-3.048" x2="-6.096" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-6.604" y1="-2.54" x2="-6.604" y2="2.54" width="0.1524" layer="21"/>
<wire x1="6.223" y1="3.048" x2="6.731" y2="2.54" width="0.1524" layer="21" curve="-90"/>
<wire x1="6.223" y1="-3.048" x2="6.731" y2="-2.54" width="0.1524" layer="21" curve="90"/>
<wire x1="-6.604" y1="-2.54" x2="-6.096" y2="-3.048" width="0.1524" layer="21" curve="90"/>
<wire x1="-6.604" y1="2.54" x2="-6.096" y2="3.048" width="0.1524" layer="21" curve="-90"/>
<wire x1="6.731" y1="2.54" x2="6.731" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="11.176" y1="3.048" x2="11.684" y2="2.54" width="0.1524" layer="21" curve="-90"/>
<wire x1="11.176" y1="-3.048" x2="11.684" y2="-2.54" width="0.1524" layer="21" curve="90"/>
<wire x1="11.176" y1="-3.048" x2="7.112" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="7.112" y1="3.048" x2="11.176" y2="3.048" width="0.1524" layer="21"/>
<wire x1="11.684" y1="2.54" x2="11.684" y2="-2.54" width="0.1524" layer="21"/>
<pad name="1" x="-5.08" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="5.08" y="0" drill="1.016" shape="octagon"/>
<pad name="3" x="10.033" y="0" drill="1.016" shape="octagon"/>
<text x="-5.969" y="3.429" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.524" y="-2.286" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C150-054X183">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 15 mm, outline 5.4 x 18.3 mm</description>
<wire x1="-5.08" y1="1.27" x2="-5.08" y2="0" width="0.4064" layer="21"/>
<wire x1="-5.08" y1="0" x2="-5.08" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-4.191" y1="1.27" x2="-4.191" y2="0" width="0.4064" layer="21"/>
<wire x1="-4.191" y1="0" x2="-4.191" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-4.191" y1="0" x2="6.096" y2="0" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0" x2="-6.096" y2="0" width="0.1524" layer="21"/>
<wire x1="9.017" y1="2.032" x2="9.017" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="8.509" y1="-2.54" x2="-8.509" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-9.017" y1="-2.032" x2="-9.017" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-8.509" y1="2.54" x2="8.509" y2="2.54" width="0.1524" layer="21"/>
<wire x1="8.509" y1="2.54" x2="9.017" y2="2.032" width="0.1524" layer="21" curve="-90"/>
<wire x1="8.509" y1="-2.54" x2="9.017" y2="-2.032" width="0.1524" layer="21" curve="90"/>
<wire x1="-9.017" y1="-2.032" x2="-8.509" y2="-2.54" width="0.1524" layer="21" curve="90"/>
<wire x1="-9.017" y1="2.032" x2="-8.509" y2="2.54" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-7.493" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="7.493" y="0" drill="1.016" shape="octagon"/>
<text x="-8.382" y="2.921" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.429" y="-2.032" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C150-064X183">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 15 mm, outline 6.4 x 18.3 mm</description>
<wire x1="-5.08" y1="1.27" x2="-5.08" y2="0" width="0.4064" layer="21"/>
<wire x1="-5.08" y1="0" x2="-5.08" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-4.191" y1="1.27" x2="-4.191" y2="0" width="0.4064" layer="21"/>
<wire x1="-4.191" y1="0" x2="-4.191" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-4.191" y1="0" x2="6.096" y2="0" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0" x2="-6.096" y2="0" width="0.1524" layer="21"/>
<wire x1="9.017" y1="2.54" x2="9.017" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="8.509" y1="-3.048" x2="-8.509" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-9.017" y1="-2.54" x2="-9.017" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-8.509" y1="3.048" x2="8.509" y2="3.048" width="0.1524" layer="21"/>
<wire x1="8.509" y1="3.048" x2="9.017" y2="2.54" width="0.1524" layer="21" curve="-90"/>
<wire x1="8.509" y1="-3.048" x2="9.017" y2="-2.54" width="0.1524" layer="21" curve="90"/>
<wire x1="-9.017" y1="-2.54" x2="-8.509" y2="-3.048" width="0.1524" layer="21" curve="90"/>
<wire x1="-9.017" y1="2.54" x2="-8.509" y2="3.048" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-7.493" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="7.493" y="0" drill="1.016" shape="octagon"/>
<text x="-8.509" y="3.429" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.429" y="-2.032" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C150-072X183">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 15 mm, outline 7.2 x 18.3 mm</description>
<wire x1="-5.08" y1="1.27" x2="-5.08" y2="0" width="0.4064" layer="21"/>
<wire x1="-5.08" y1="0" x2="-5.08" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-4.191" y1="1.27" x2="-4.191" y2="0" width="0.4064" layer="21"/>
<wire x1="-4.191" y1="0" x2="-4.191" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-4.191" y1="0" x2="6.096" y2="0" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0" x2="-6.096" y2="0" width="0.1524" layer="21"/>
<wire x1="9.017" y1="3.048" x2="9.017" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="8.509" y1="-3.556" x2="-8.509" y2="-3.556" width="0.1524" layer="21"/>
<wire x1="-9.017" y1="-3.048" x2="-9.017" y2="3.048" width="0.1524" layer="21"/>
<wire x1="-8.509" y1="3.556" x2="8.509" y2="3.556" width="0.1524" layer="21"/>
<wire x1="8.509" y1="3.556" x2="9.017" y2="3.048" width="0.1524" layer="21" curve="-90"/>
<wire x1="8.509" y1="-3.556" x2="9.017" y2="-3.048" width="0.1524" layer="21" curve="90"/>
<wire x1="-9.017" y1="-3.048" x2="-8.509" y2="-3.556" width="0.1524" layer="21" curve="90"/>
<wire x1="-9.017" y1="3.048" x2="-8.509" y2="3.556" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-7.493" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="7.493" y="0" drill="1.016" shape="octagon"/>
<text x="-8.509" y="3.937" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.429" y="-2.286" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C150-084X183">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 15 mm, outline 8.4 x 18.3 mm</description>
<wire x1="-5.08" y1="1.27" x2="-5.08" y2="0" width="0.4064" layer="21"/>
<wire x1="-5.08" y1="0" x2="-5.08" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-4.191" y1="1.27" x2="-4.191" y2="0" width="0.4064" layer="21"/>
<wire x1="-4.191" y1="0" x2="-4.191" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-4.191" y1="0" x2="6.096" y2="0" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0" x2="-6.096" y2="0" width="0.1524" layer="21"/>
<wire x1="9.017" y1="3.556" x2="9.017" y2="-3.556" width="0.1524" layer="21"/>
<wire x1="8.509" y1="-4.064" x2="-8.509" y2="-4.064" width="0.1524" layer="21"/>
<wire x1="-9.017" y1="-3.556" x2="-9.017" y2="3.556" width="0.1524" layer="21"/>
<wire x1="-8.509" y1="4.064" x2="8.509" y2="4.064" width="0.1524" layer="21"/>
<wire x1="8.509" y1="4.064" x2="9.017" y2="3.556" width="0.1524" layer="21" curve="-90"/>
<wire x1="8.509" y1="-4.064" x2="9.017" y2="-3.556" width="0.1524" layer="21" curve="90"/>
<wire x1="-9.017" y1="-3.556" x2="-8.509" y2="-4.064" width="0.1524" layer="21" curve="90"/>
<wire x1="-9.017" y1="3.556" x2="-8.509" y2="4.064" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-7.493" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="7.493" y="0" drill="1.016" shape="octagon"/>
<text x="-8.509" y="4.445" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.429" y="-2.54" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C150-091X182">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 15 mm, outline 9.1 x 18.2 mm</description>
<wire x1="-5.08" y1="1.27" x2="-5.08" y2="0" width="0.4064" layer="21"/>
<wire x1="-5.08" y1="0" x2="-5.08" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-4.191" y1="1.27" x2="-4.191" y2="0" width="0.4064" layer="21"/>
<wire x1="-4.191" y1="0" x2="-4.191" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-4.191" y1="0" x2="6.096" y2="0" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0" x2="-6.096" y2="0" width="0.1524" layer="21"/>
<wire x1="9.017" y1="3.937" x2="9.017" y2="-3.937" width="0.1524" layer="21"/>
<wire x1="8.509" y1="-4.445" x2="-8.509" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="-9.017" y1="-3.937" x2="-9.017" y2="3.937" width="0.1524" layer="21"/>
<wire x1="-8.509" y1="4.445" x2="8.509" y2="4.445" width="0.1524" layer="21"/>
<wire x1="8.509" y1="4.445" x2="9.017" y2="3.937" width="0.1524" layer="21" curve="-90"/>
<wire x1="8.509" y1="-4.445" x2="9.017" y2="-3.937" width="0.1524" layer="21" curve="90"/>
<wire x1="-9.017" y1="-3.937" x2="-8.509" y2="-4.445" width="0.1524" layer="21" curve="90"/>
<wire x1="-9.017" y1="3.937" x2="-8.509" y2="4.445" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-7.493" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="7.493" y="0" drill="1.016" shape="octagon"/>
<text x="-8.509" y="4.826" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.429" y="-2.54" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C225-062X268">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 22.5 mm, outline 6.2 x 26.8 mm</description>
<wire x1="-12.827" y1="3.048" x2="12.827" y2="3.048" width="0.1524" layer="21"/>
<wire x1="13.335" y1="2.54" x2="13.335" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="12.827" y1="-3.048" x2="-12.827" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-13.335" y1="-2.54" x2="-13.335" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="1.905" x2="-6.731" y2="0" width="0.4064" layer="21"/>
<wire x1="-6.731" y1="0" x2="-6.731" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-7.62" y2="0" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="12.827" y1="3.048" x2="13.335" y2="2.54" width="0.1524" layer="21" curve="-90"/>
<wire x1="12.827" y1="-3.048" x2="13.335" y2="-2.54" width="0.1524" layer="21" curve="90"/>
<wire x1="-13.335" y1="-2.54" x2="-12.827" y2="-3.048" width="0.1524" layer="21" curve="90"/>
<wire x1="-13.335" y1="2.54" x2="-12.827" y2="3.048" width="0.1524" layer="21" curve="-90"/>
<wire x1="-9.652" y1="0" x2="-7.62" y2="0" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="0" x2="9.652" y2="0" width="0.1524" layer="21"/>
<pad name="1" x="-11.303" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="11.303" y="0" drill="1.016" shape="octagon"/>
<text x="-12.7" y="3.429" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-2.54" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C225-074X268">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 22.5 mm, outline 7.4 x 26.8 mm</description>
<wire x1="-12.827" y1="3.556" x2="12.827" y2="3.556" width="0.1524" layer="21"/>
<wire x1="13.335" y1="3.048" x2="13.335" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="12.827" y1="-3.556" x2="-12.827" y2="-3.556" width="0.1524" layer="21"/>
<wire x1="-13.335" y1="-3.048" x2="-13.335" y2="3.048" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="1.905" x2="-6.731" y2="0" width="0.4064" layer="21"/>
<wire x1="-6.731" y1="0" x2="-6.731" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-7.62" y2="0" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="12.827" y1="3.556" x2="13.335" y2="3.048" width="0.1524" layer="21" curve="-90"/>
<wire x1="12.827" y1="-3.556" x2="13.335" y2="-3.048" width="0.1524" layer="21" curve="90"/>
<wire x1="-13.335" y1="-3.048" x2="-12.827" y2="-3.556" width="0.1524" layer="21" curve="90"/>
<wire x1="-13.335" y1="3.048" x2="-12.827" y2="3.556" width="0.1524" layer="21" curve="-90"/>
<wire x1="-9.652" y1="0" x2="-7.62" y2="0" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="0" x2="9.652" y2="0" width="0.1524" layer="21"/>
<pad name="1" x="-11.303" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="11.303" y="0" drill="1.016" shape="octagon"/>
<text x="-12.827" y="3.937" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-2.54" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C225-087X268">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 22.5 mm, outline 8.7 x 26.8 mm</description>
<wire x1="-12.827" y1="4.318" x2="12.827" y2="4.318" width="0.1524" layer="21"/>
<wire x1="13.335" y1="3.81" x2="13.335" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="12.827" y1="-4.318" x2="-12.827" y2="-4.318" width="0.1524" layer="21"/>
<wire x1="-13.335" y1="-3.81" x2="-13.335" y2="3.81" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="1.905" x2="-6.731" y2="0" width="0.4064" layer="21"/>
<wire x1="-6.731" y1="0" x2="-6.731" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-7.62" y2="0" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="12.827" y1="4.318" x2="13.335" y2="3.81" width="0.1524" layer="21" curve="-90"/>
<wire x1="12.827" y1="-4.318" x2="13.335" y2="-3.81" width="0.1524" layer="21" curve="90"/>
<wire x1="-13.335" y1="-3.81" x2="-12.827" y2="-4.318" width="0.1524" layer="21" curve="90"/>
<wire x1="-13.335" y1="3.81" x2="-12.827" y2="4.318" width="0.1524" layer="21" curve="-90"/>
<wire x1="-9.652" y1="0" x2="-7.62" y2="0" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="0" x2="9.652" y2="0" width="0.1524" layer="21"/>
<pad name="1" x="-11.303" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="11.303" y="0" drill="1.016" shape="octagon"/>
<text x="-12.827" y="4.699" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-2.54" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C225-108X268">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 22.5 mm, outline 10.8 x 26.8 mm</description>
<wire x1="-12.827" y1="5.334" x2="12.827" y2="5.334" width="0.1524" layer="21"/>
<wire x1="13.335" y1="4.826" x2="13.335" y2="-4.826" width="0.1524" layer="21"/>
<wire x1="12.827" y1="-5.334" x2="-12.827" y2="-5.334" width="0.1524" layer="21"/>
<wire x1="-13.335" y1="-4.826" x2="-13.335" y2="4.826" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="1.905" x2="-6.731" y2="0" width="0.4064" layer="21"/>
<wire x1="-6.731" y1="0" x2="-6.731" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-7.62" y2="0" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="12.827" y1="5.334" x2="13.335" y2="4.826" width="0.1524" layer="21" curve="-90"/>
<wire x1="12.827" y1="-5.334" x2="13.335" y2="-4.826" width="0.1524" layer="21" curve="90"/>
<wire x1="-13.335" y1="-4.826" x2="-12.827" y2="-5.334" width="0.1524" layer="21" curve="90"/>
<wire x1="-13.335" y1="4.826" x2="-12.827" y2="5.334" width="0.1524" layer="21" curve="-90"/>
<wire x1="-9.652" y1="0" x2="-7.62" y2="0" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="0" x2="9.652" y2="0" width="0.1524" layer="21"/>
<pad name="1" x="-11.303" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="11.303" y="0" drill="1.016" shape="octagon"/>
<text x="-12.954" y="5.715" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-2.54" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C225-113X268">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 22.5 mm, outline 11.3 x 26.8 mm</description>
<wire x1="-12.827" y1="5.588" x2="12.827" y2="5.588" width="0.1524" layer="21"/>
<wire x1="13.335" y1="5.08" x2="13.335" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="12.827" y1="-5.588" x2="-12.827" y2="-5.588" width="0.1524" layer="21"/>
<wire x1="-13.335" y1="-5.08" x2="-13.335" y2="5.08" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="1.905" x2="-6.731" y2="0" width="0.4064" layer="21"/>
<wire x1="-6.731" y1="0" x2="-6.731" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-7.62" y2="0" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="12.827" y1="5.588" x2="13.335" y2="5.08" width="0.1524" layer="21" curve="-90"/>
<wire x1="12.827" y1="-5.588" x2="13.335" y2="-5.08" width="0.1524" layer="21" curve="90"/>
<wire x1="-13.335" y1="-5.08" x2="-12.827" y2="-5.588" width="0.1524" layer="21" curve="90"/>
<wire x1="-13.335" y1="5.08" x2="-12.827" y2="5.588" width="0.1524" layer="21" curve="-90"/>
<wire x1="-9.652" y1="0" x2="-7.62" y2="0" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="0" x2="9.652" y2="0" width="0.1524" layer="21"/>
<pad name="1" x="-11.303" y="0" drill="1.016" shape="octagon"/>
<pad name="2" x="11.303" y="0" drill="1.016" shape="octagon"/>
<text x="-12.954" y="5.969" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-2.54" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C275-093X316">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 27.5 mm, outline 9.3 x 31.6 mm</description>
<wire x1="-15.24" y1="4.572" x2="15.24" y2="4.572" width="0.1524" layer="21"/>
<wire x1="15.748" y1="4.064" x2="15.748" y2="-4.064" width="0.1524" layer="21"/>
<wire x1="15.24" y1="-4.572" x2="-15.24" y2="-4.572" width="0.1524" layer="21"/>
<wire x1="-15.748" y1="-4.064" x2="-15.748" y2="4.064" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="1.905" x2="-6.731" y2="0" width="0.4064" layer="21"/>
<wire x1="-6.731" y1="0" x2="-6.731" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-7.62" y2="0" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="15.24" y1="4.572" x2="15.748" y2="4.064" width="0.1524" layer="21" curve="-90"/>
<wire x1="15.24" y1="-4.572" x2="15.748" y2="-4.064" width="0.1524" layer="21" curve="90"/>
<wire x1="-15.748" y1="-4.064" x2="-15.24" y2="-4.572" width="0.1524" layer="21" curve="90"/>
<wire x1="-15.748" y1="4.064" x2="-15.24" y2="4.572" width="0.1524" layer="21" curve="-90"/>
<wire x1="-11.557" y1="0" x2="-7.62" y2="0" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="0" x2="11.557" y2="0" width="0.1524" layer="21"/>
<pad name="1" x="-13.716" y="0" drill="1.1938" shape="octagon"/>
<pad name="2" x="13.716" y="0" drill="1.1938" shape="octagon"/>
<text x="-15.24" y="4.953" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-2.54" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C275-113X316">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 27.5 mm, outline 11.3 x 31.6 mm</description>
<wire x1="-15.24" y1="5.588" x2="15.24" y2="5.588" width="0.1524" layer="21"/>
<wire x1="15.748" y1="5.08" x2="15.748" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="15.24" y1="-5.588" x2="-15.24" y2="-5.588" width="0.1524" layer="21"/>
<wire x1="-15.748" y1="-5.08" x2="-15.748" y2="5.08" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="1.905" x2="-6.731" y2="0" width="0.4064" layer="21"/>
<wire x1="-6.731" y1="0" x2="-6.731" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-7.62" y2="0" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="15.24" y1="5.588" x2="15.748" y2="5.08" width="0.1524" layer="21" curve="-90"/>
<wire x1="15.24" y1="-5.588" x2="15.748" y2="-5.08" width="0.1524" layer="21" curve="90"/>
<wire x1="-15.748" y1="-5.08" x2="-15.24" y2="-5.588" width="0.1524" layer="21" curve="90"/>
<wire x1="-15.748" y1="5.08" x2="-15.24" y2="5.588" width="0.1524" layer="21" curve="-90"/>
<wire x1="-11.557" y1="0" x2="-7.62" y2="0" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="0" x2="11.557" y2="0" width="0.1524" layer="21"/>
<pad name="1" x="-13.716" y="0" drill="1.1938" shape="octagon"/>
<pad name="2" x="13.716" y="0" drill="1.1938" shape="octagon"/>
<text x="-15.24" y="5.969" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-2.54" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C275-134X316">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 27.5 mm, outline 13.4 x 31.6 mm</description>
<wire x1="-15.24" y1="6.604" x2="15.24" y2="6.604" width="0.1524" layer="21"/>
<wire x1="15.748" y1="6.096" x2="15.748" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="15.24" y1="-6.604" x2="-15.24" y2="-6.604" width="0.1524" layer="21"/>
<wire x1="-15.748" y1="-6.096" x2="-15.748" y2="6.096" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="1.905" x2="-6.731" y2="0" width="0.4064" layer="21"/>
<wire x1="-6.731" y1="0" x2="-6.731" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-7.62" y2="0" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="15.24" y1="6.604" x2="15.748" y2="6.096" width="0.1524" layer="21" curve="-90"/>
<wire x1="15.24" y1="-6.604" x2="15.748" y2="-6.096" width="0.1524" layer="21" curve="90"/>
<wire x1="-15.748" y1="-6.096" x2="-15.24" y2="-6.604" width="0.1524" layer="21" curve="90"/>
<wire x1="-15.748" y1="6.096" x2="-15.24" y2="6.604" width="0.1524" layer="21" curve="-90"/>
<wire x1="-11.557" y1="0" x2="-7.62" y2="0" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="0" x2="11.557" y2="0" width="0.1524" layer="21"/>
<pad name="1" x="-13.716" y="0" drill="1.1938" shape="octagon"/>
<pad name="2" x="13.716" y="0" drill="1.1938" shape="octagon"/>
<text x="-15.24" y="6.985" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-2.54" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C275-205X316">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 27.5 mm, outline 20.5 x 31.6 mm</description>
<wire x1="-15.24" y1="10.16" x2="15.24" y2="10.16" width="0.1524" layer="21"/>
<wire x1="15.748" y1="9.652" x2="15.748" y2="-9.652" width="0.1524" layer="21"/>
<wire x1="15.24" y1="-10.16" x2="-15.24" y2="-10.16" width="0.1524" layer="21"/>
<wire x1="-15.748" y1="-9.652" x2="-15.748" y2="9.652" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="1.905" x2="-6.731" y2="0" width="0.4064" layer="21"/>
<wire x1="-6.731" y1="0" x2="-6.731" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-7.62" y2="0" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="15.24" y1="10.16" x2="15.748" y2="9.652" width="0.1524" layer="21" curve="-90"/>
<wire x1="15.24" y1="-10.16" x2="15.748" y2="-9.652" width="0.1524" layer="21" curve="90"/>
<wire x1="-15.748" y1="-9.652" x2="-15.24" y2="-10.16" width="0.1524" layer="21" curve="90"/>
<wire x1="-15.748" y1="9.652" x2="-15.24" y2="10.16" width="0.1524" layer="21" curve="-90"/>
<wire x1="-11.557" y1="0" x2="-7.62" y2="0" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="0" x2="11.557" y2="0" width="0.1524" layer="21"/>
<pad name="1" x="-13.716" y="0" drill="1.1938" shape="octagon"/>
<pad name="2" x="13.716" y="0" drill="1.1938" shape="octagon"/>
<text x="-15.24" y="10.541" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-4.318" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C325-137X374">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 32.5 mm, outline 13.7 x 37.4 mm</description>
<wire x1="-14.2748" y1="0" x2="-12.7" y2="0" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="1.905" x2="-12.7" y2="0" width="0.4064" layer="21"/>
<wire x1="-11.811" y1="1.905" x2="-11.811" y2="0" width="0.4064" layer="21"/>
<wire x1="-11.811" y1="0" x2="14.2748" y2="0" width="0.1524" layer="21"/>
<wire x1="-11.811" y1="0" x2="-11.811" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="-12.7" y1="0" x2="-12.7" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="18.542" y1="6.731" x2="18.542" y2="-6.731" width="0.1524" layer="21"/>
<wire x1="-18.542" y1="6.731" x2="-18.542" y2="-6.731" width="0.1524" layer="21"/>
<wire x1="-18.542" y1="-6.731" x2="18.542" y2="-6.731" width="0.1524" layer="21"/>
<wire x1="18.542" y1="6.731" x2="-18.542" y2="6.731" width="0.1524" layer="21"/>
<pad name="1" x="-16.256" y="0" drill="1.1938" shape="octagon"/>
<pad name="2" x="16.256" y="0" drill="1.1938" shape="octagon"/>
<text x="-18.2372" y="7.0612" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-10.8458" y="-2.8702" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C325-162X374">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 32.5 mm, outline 16.2 x 37.4 mm</description>
<wire x1="-14.2748" y1="0" x2="-12.7" y2="0" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="1.905" x2="-12.7" y2="0" width="0.4064" layer="21"/>
<wire x1="-11.811" y1="1.905" x2="-11.811" y2="0" width="0.4064" layer="21"/>
<wire x1="-11.811" y1="0" x2="14.2748" y2="0" width="0.1524" layer="21"/>
<wire x1="-11.811" y1="0" x2="-11.811" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="-12.7" y1="0" x2="-12.7" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="18.542" y1="8.001" x2="18.542" y2="-8.001" width="0.1524" layer="21"/>
<wire x1="-18.542" y1="8.001" x2="-18.542" y2="-8.001" width="0.1524" layer="21"/>
<wire x1="-18.542" y1="-8.001" x2="18.542" y2="-8.001" width="0.1524" layer="21"/>
<wire x1="18.542" y1="8.001" x2="-18.542" y2="8.001" width="0.1524" layer="21"/>
<pad name="1" x="-16.256" y="0" drill="1.1938" shape="octagon"/>
<pad name="2" x="16.256" y="0" drill="1.1938" shape="octagon"/>
<text x="-18.3642" y="8.3312" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-10.8458" y="-2.8702" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C325-182X374">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 32.5 mm, outline 18.2 x 37.4 mm</description>
<wire x1="-14.2748" y1="0" x2="-12.7" y2="0" width="0.1524" layer="21"/>
<wire x1="-12.7" y1="1.905" x2="-12.7" y2="0" width="0.4064" layer="21"/>
<wire x1="-11.811" y1="1.905" x2="-11.811" y2="0" width="0.4064" layer="21"/>
<wire x1="-11.811" y1="0" x2="14.2748" y2="0" width="0.1524" layer="21"/>
<wire x1="-11.811" y1="0" x2="-11.811" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="-12.7" y1="0" x2="-12.7" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="18.542" y1="9.017" x2="18.542" y2="-9.017" width="0.1524" layer="21"/>
<wire x1="-18.542" y1="9.017" x2="-18.542" y2="-9.017" width="0.1524" layer="21"/>
<wire x1="-18.542" y1="-9.017" x2="18.542" y2="-9.017" width="0.1524" layer="21"/>
<wire x1="18.542" y1="9.017" x2="-18.542" y2="9.017" width="0.1524" layer="21"/>
<pad name="1" x="-16.256" y="0" drill="1.1938" shape="octagon"/>
<pad name="2" x="16.256" y="0" drill="1.1938" shape="octagon"/>
<text x="-18.3642" y="9.3472" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-10.8458" y="-2.8702" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C375-192X418">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 37.5 mm, outline 19.2 x 41.8 mm</description>
<wire x1="-20.32" y1="8.509" x2="20.32" y2="8.509" width="0.1524" layer="21"/>
<wire x1="20.828" y1="8.001" x2="20.828" y2="-8.001" width="0.1524" layer="21"/>
<wire x1="20.32" y1="-8.509" x2="-20.32" y2="-8.509" width="0.1524" layer="21"/>
<wire x1="-20.828" y1="-8.001" x2="-20.828" y2="8.001" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="1.905" x2="-6.731" y2="0" width="0.4064" layer="21"/>
<wire x1="-6.731" y1="0" x2="-6.731" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-7.62" y2="0" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="20.32" y1="8.509" x2="20.828" y2="8.001" width="0.1524" layer="21" curve="-90"/>
<wire x1="20.32" y1="-8.509" x2="20.828" y2="-8.001" width="0.1524" layer="21" curve="90"/>
<wire x1="-20.828" y1="-8.001" x2="-20.32" y2="-8.509" width="0.1524" layer="21" curve="90"/>
<wire x1="-20.828" y1="8.001" x2="-20.32" y2="8.509" width="0.1524" layer="21" curve="-90"/>
<wire x1="-16.002" y1="0" x2="-7.62" y2="0" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="0" x2="16.002" y2="0" width="0.1524" layer="21"/>
<pad name="1" x="-18.796" y="0" drill="1.3208" shape="octagon"/>
<pad name="2" x="18.796" y="0" drill="1.3208" shape="octagon"/>
<text x="-20.447" y="8.89" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-2.54" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C375-203X418">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 37.5 mm, outline 20.3 x 41.8 mm</description>
<wire x1="-20.32" y1="10.16" x2="20.32" y2="10.16" width="0.1524" layer="21"/>
<wire x1="20.828" y1="9.652" x2="20.828" y2="-9.652" width="0.1524" layer="21"/>
<wire x1="20.32" y1="-10.16" x2="-20.32" y2="-10.16" width="0.1524" layer="21"/>
<wire x1="-20.828" y1="-9.652" x2="-20.828" y2="9.652" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="1.905" x2="-6.731" y2="0" width="0.4064" layer="21"/>
<wire x1="-6.731" y1="0" x2="-6.731" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-7.62" y2="0" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="20.32" y1="10.16" x2="20.828" y2="9.652" width="0.1524" layer="21" curve="-90"/>
<wire x1="20.32" y1="-10.16" x2="20.828" y2="-9.652" width="0.1524" layer="21" curve="90"/>
<wire x1="-20.828" y1="-9.652" x2="-20.32" y2="-10.16" width="0.1524" layer="21" curve="90"/>
<wire x1="-20.828" y1="9.652" x2="-20.32" y2="10.16" width="0.1524" layer="21" curve="-90"/>
<wire x1="-16.002" y1="0" x2="-7.62" y2="0" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="0" x2="16.002" y2="0" width="0.1524" layer="21"/>
<pad name="1" x="-18.796" y="0" drill="1.3208" shape="octagon"/>
<pad name="2" x="18.796" y="0" drill="1.3208" shape="octagon"/>
<text x="-20.32" y="10.541" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-2.54" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C050-035X075">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 5 mm, outline 3.5 x 7.5 mm</description>
<wire x1="-0.3048" y1="0.635" x2="-0.3048" y2="0" width="0.3048" layer="21"/>
<wire x1="-0.3048" y1="0" x2="-0.3048" y2="-0.635" width="0.3048" layer="21"/>
<wire x1="-0.3048" y1="0" x2="-1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="0.3302" y1="0.635" x2="0.3302" y2="0" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="0" x2="0.3302" y2="-0.635" width="0.3048" layer="21"/>
<wire x1="0.3302" y1="0" x2="1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="-3.683" y1="1.524" x2="-3.683" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="-1.778" x2="3.429" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="3.683" y1="-1.524" x2="3.683" y2="1.524" width="0.1524" layer="21"/>
<wire x1="3.429" y1="1.778" x2="-3.429" y2="1.778" width="0.1524" layer="21"/>
<wire x1="3.429" y1="1.778" x2="3.683" y2="1.524" width="0.1524" layer="21" curve="-90"/>
<wire x1="3.429" y1="-1.778" x2="3.683" y2="-1.524" width="0.1524" layer="21" curve="90"/>
<wire x1="-3.683" y1="-1.524" x2="-3.429" y2="-1.778" width="0.1524" layer="21" curve="90"/>
<wire x1="-3.683" y1="1.524" x2="-3.429" y2="1.778" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.8128" shape="octagon"/>
<text x="-3.556" y="2.159" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.556" y="-3.429" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C375-155X418">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 37.5 mm, outline 15.5 x 41.8 mm</description>
<wire x1="-20.32" y1="7.62" x2="20.32" y2="7.62" width="0.1524" layer="21"/>
<wire x1="20.828" y1="7.112" x2="20.828" y2="-7.112" width="0.1524" layer="21"/>
<wire x1="20.32" y1="-7.62" x2="-20.32" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="-20.828" y1="-7.112" x2="-20.828" y2="7.112" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="1.905" x2="-6.731" y2="0" width="0.4064" layer="21"/>
<wire x1="-6.731" y1="0" x2="-6.731" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-7.62" y2="0" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="20.32" y1="7.62" x2="20.828" y2="7.112" width="0.1524" layer="21" curve="-90"/>
<wire x1="20.32" y1="-7.62" x2="20.828" y2="-7.112" width="0.1524" layer="21" curve="90"/>
<wire x1="-20.828" y1="-7.112" x2="-20.32" y2="-7.62" width="0.1524" layer="21" curve="90"/>
<wire x1="-20.828" y1="7.112" x2="-20.32" y2="7.62" width="0.1524" layer="21" curve="-90"/>
<wire x1="-16.002" y1="0" x2="-7.62" y2="0" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="0" x2="16.002" y2="0" width="0.1524" layer="21"/>
<pad name="1" x="-18.796" y="0" drill="1.3208" shape="octagon"/>
<pad name="2" x="18.796" y="0" drill="1.3208" shape="octagon"/>
<text x="-20.447" y="8.001" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-2.54" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C075-063X106">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 7.5 mm, outline 6.3 x 10.6 mm</description>
<wire x1="4.953" y1="3.048" x2="-4.953" y2="3.048" width="0.1524" layer="21"/>
<wire x1="-5.207" y1="2.794" x2="-5.207" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="-4.953" y1="-3.048" x2="4.953" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="5.207" y1="-2.794" x2="5.207" y2="2.794" width="0.1524" layer="21"/>
<wire x1="4.953" y1="3.048" x2="5.207" y2="2.794" width="0.1524" layer="21" curve="-90"/>
<wire x1="4.953" y1="-3.048" x2="5.207" y2="-2.794" width="0.1524" layer="21" curve="90"/>
<wire x1="-5.207" y1="-2.794" x2="-4.953" y2="-3.048" width="0.1524" layer="21" curve="90"/>
<wire x1="-5.207" y1="2.794" x2="-4.953" y2="3.048" width="0.1524" layer="21" curve="-90"/>
<wire x1="-1.27" y1="0" x2="2.667" y2="0" width="0.1524" layer="21"/>
<wire x1="-2.667" y1="0" x2="-2.159" y2="0" width="0.1524" layer="21"/>
<wire x1="-2.159" y1="1.27" x2="-2.159" y2="0" width="0.4064" layer="21"/>
<wire x1="-2.159" y1="0" x2="-2.159" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="0" width="0.4064" layer="21"/>
<wire x1="-1.27" y1="0" x2="-1.27" y2="-1.27" width="0.4064" layer="21"/>
<pad name="1" x="-3.81" y="0" drill="0.9144" shape="octagon"/>
<pad name="2" x="3.81" y="0" drill="0.9144" shape="octagon"/>
<text x="-4.826" y="3.429" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-0.635" y="-2.54" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C275-154X316">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 27.5 mm, outline 15.4 x 31.6 mm</description>
<wire x1="-15.24" y1="7.62" x2="15.24" y2="7.62" width="0.1524" layer="21"/>
<wire x1="15.748" y1="7.112" x2="15.748" y2="-7.112" width="0.1524" layer="21"/>
<wire x1="15.24" y1="-7.62" x2="-15.24" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="-15.748" y1="-7.112" x2="-15.748" y2="7.112" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="1.905" x2="-6.731" y2="0" width="0.4064" layer="21"/>
<wire x1="-6.731" y1="0" x2="-6.731" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-7.62" y2="0" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="15.24" y1="7.62" x2="15.748" y2="7.112" width="0.1524" layer="21" curve="-90"/>
<wire x1="15.24" y1="-7.62" x2="15.748" y2="-7.112" width="0.1524" layer="21" curve="90"/>
<wire x1="-15.748" y1="-7.112" x2="-15.24" y2="-7.62" width="0.1524" layer="21" curve="90"/>
<wire x1="-15.748" y1="7.112" x2="-15.24" y2="7.62" width="0.1524" layer="21" curve="-90"/>
<wire x1="-11.557" y1="0" x2="-7.62" y2="0" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="0" x2="11.557" y2="0" width="0.1524" layer="21"/>
<pad name="1" x="-13.716" y="0" drill="1.1938" shape="octagon"/>
<pad name="2" x="13.716" y="0" drill="1.1938" shape="octagon"/>
<text x="-15.24" y="8.001" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-2.54" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C275-173X316">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
grid 27.5 mm, outline 17.3 x 31.6 mm</description>
<wire x1="-15.24" y1="8.509" x2="15.24" y2="8.509" width="0.1524" layer="21"/>
<wire x1="15.748" y1="8.001" x2="15.748" y2="-8.001" width="0.1524" layer="21"/>
<wire x1="15.24" y1="-8.509" x2="-15.24" y2="-8.509" width="0.1524" layer="21"/>
<wire x1="-15.748" y1="-8.001" x2="-15.748" y2="8.001" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="1.905" x2="-6.731" y2="0" width="0.4064" layer="21"/>
<wire x1="-6.731" y1="0" x2="-6.731" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="1.905" x2="-7.62" y2="0" width="0.4064" layer="21"/>
<wire x1="-7.62" y1="0" x2="-7.62" y2="-1.905" width="0.4064" layer="21"/>
<wire x1="15.24" y1="8.509" x2="15.748" y2="8.001" width="0.1524" layer="21" curve="-90"/>
<wire x1="15.24" y1="-8.509" x2="15.748" y2="-8.001" width="0.1524" layer="21" curve="90"/>
<wire x1="-15.748" y1="-8.001" x2="-15.24" y2="-8.509" width="0.1524" layer="21" curve="90"/>
<wire x1="-15.748" y1="8.001" x2="-15.24" y2="8.509" width="0.1524" layer="21" curve="-90"/>
<wire x1="-11.557" y1="0" x2="-7.62" y2="0" width="0.1524" layer="21"/>
<wire x1="-6.731" y1="0" x2="11.557" y2="0" width="0.1524" layer="21"/>
<pad name="1" x="-13.716" y="0" drill="1.1938" shape="octagon"/>
<pad name="2" x="13.716" y="0" drill="1.1938" shape="octagon"/>
<text x="-15.24" y="8.89" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-2.54" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="C0402K">
<description>&lt;b&gt;Ceramic Chip Capacitor KEMET 0204 reflow solder&lt;/b&gt;&lt;p&gt;
Metric Code Size 1005</description>
<wire x1="-0.425" y1="0.2" x2="0.425" y2="0.2" width="0.1016" layer="51"/>
<wire x1="0.425" y1="-0.2" x2="-0.425" y2="-0.2" width="0.1016" layer="51"/>
<smd name="1" x="-0.6" y="0" dx="0.925" dy="0.74" layer="1"/>
<smd name="2" x="0.6" y="0" dx="0.925" dy="0.74" layer="1"/>
<text x="-0.5" y="0.425" size="1.016" layer="25">&gt;NAME</text>
<text x="-0.5" y="-1.45" size="1.016" layer="27">&gt;VALUE</text>
<rectangle x1="-0.5" y1="-0.25" x2="-0.225" y2="0.25" layer="51"/>
<rectangle x1="0.225" y1="-0.25" x2="0.5" y2="0.25" layer="51"/>
</package>
<package name="C0603K">
<description>&lt;b&gt;Ceramic Chip Capacitor KEMET 0603 reflow solder&lt;/b&gt;&lt;p&gt;
Metric Code Size 1608</description>
<wire x1="-0.725" y1="0.35" x2="0.725" y2="0.35" width="0.1016" layer="51"/>
<wire x1="0.725" y1="-0.35" x2="-0.725" y2="-0.35" width="0.1016" layer="51"/>
<smd name="1" x="-0.875" y="0" dx="1.05" dy="1.08" layer="1"/>
<smd name="2" x="0.875" y="0" dx="1.05" dy="1.08" layer="1"/>
<text x="-0.8" y="0.65" size="0.6096" layer="25">&gt;NAME</text>
<text x="-0.8" y="-1.65" size="0.6096" layer="27">&gt;VALUE</text>
<rectangle x1="-0.8" y1="-0.4" x2="-0.45" y2="0.4" layer="51"/>
<rectangle x1="0.45" y1="-0.4" x2="0.8" y2="0.4" layer="51"/>
</package>
<package name="C0805K">
<description>&lt;b&gt;Ceramic Chip Capacitor KEMET 0805 reflow solder&lt;/b&gt;&lt;p&gt;
Metric Code Size 2012</description>
<wire x1="-0.925" y1="0.6" x2="0.925" y2="0.6" width="0.1016" layer="51"/>
<wire x1="0.925" y1="-0.6" x2="-0.925" y2="-0.6" width="0.1016" layer="51"/>
<smd name="1" x="-1" y="0" dx="1.3" dy="1.6" layer="1"/>
<smd name="2" x="1" y="0" dx="1.3" dy="1.6" layer="1"/>
<text x="-1" y="0.875" size="1.016" layer="25">&gt;NAME</text>
<text x="-1" y="-1.9" size="1.016" layer="27">&gt;VALUE</text>
<rectangle x1="-1" y1="-0.65" x2="-0.5" y2="0.65" layer="51"/>
<rectangle x1="0.5" y1="-0.65" x2="1" y2="0.65" layer="51"/>
</package>
<package name="C1206K">
<description>&lt;b&gt;Ceramic Chip Capacitor KEMET 1206 reflow solder&lt;/b&gt;&lt;p&gt;
Metric Code Size 3216</description>
<wire x1="-1.525" y1="0.75" x2="1.525" y2="0.75" width="0.1016" layer="51"/>
<wire x1="1.525" y1="-0.75" x2="-1.525" y2="-0.75" width="0.1016" layer="51"/>
<smd name="1" x="-1.5" y="0" dx="1.5" dy="2" layer="1"/>
<smd name="2" x="1.5" y="0" dx="1.5" dy="2" layer="1"/>
<text x="-1.6" y="1.1" size="1.016" layer="25">&gt;NAME</text>
<text x="-1.6" y="-2.1" size="1.016" layer="27">&gt;VALUE</text>
<rectangle x1="-1.6" y1="-0.8" x2="-1.1" y2="0.8" layer="51"/>
<rectangle x1="1.1" y1="-0.8" x2="1.6" y2="0.8" layer="51"/>
</package>
<package name="C1210K">
<description>&lt;b&gt;Ceramic Chip Capacitor KEMET 1210 reflow solder&lt;/b&gt;&lt;p&gt;
Metric Code Size 3225</description>
<wire x1="-1.525" y1="1.175" x2="1.525" y2="1.175" width="0.1016" layer="51"/>
<wire x1="1.525" y1="-1.175" x2="-1.525" y2="-1.175" width="0.1016" layer="51"/>
<smd name="1" x="-1.5" y="0" dx="1.5" dy="2.9" layer="1"/>
<smd name="2" x="1.5" y="0" dx="1.5" dy="2.9" layer="1"/>
<text x="-1.6" y="1.55" size="1.016" layer="25">&gt;NAME</text>
<text x="-1.6" y="-2.575" size="1.016" layer="27">&gt;VALUE</text>
<rectangle x1="-1.6" y1="-1.25" x2="-1.1" y2="1.25" layer="51"/>
<rectangle x1="1.1" y1="-1.25" x2="1.6" y2="1.25" layer="51"/>
</package>
<package name="C1812K">
<description>&lt;b&gt;Ceramic Chip Capacitor KEMET 1812 reflow solder&lt;/b&gt;&lt;p&gt;
Metric Code Size 4532</description>
<wire x1="-2.175" y1="1.525" x2="2.175" y2="1.525" width="0.1016" layer="51"/>
<wire x1="2.175" y1="-1.525" x2="-2.175" y2="-1.525" width="0.1016" layer="51"/>
<smd name="1" x="-2.05" y="0" dx="1.8" dy="3.7" layer="1"/>
<smd name="2" x="2.05" y="0" dx="1.8" dy="3.7" layer="1"/>
<text x="-2.25" y="1.95" size="1.016" layer="25">&gt;NAME</text>
<text x="-2.25" y="-2.975" size="1.016" layer="27">&gt;VALUE</text>
<rectangle x1="-2.25" y1="-1.6" x2="-1.65" y2="1.6" layer="51"/>
<rectangle x1="1.65" y1="-1.6" x2="2.25" y2="1.6" layer="51"/>
</package>
<package name="C1825K">
<description>&lt;b&gt;Ceramic Chip Capacitor KEMET 1825 reflow solder&lt;/b&gt;&lt;p&gt;
Metric Code Size 4564</description>
<wire x1="-1.525" y1="3.125" x2="1.525" y2="3.125" width="0.1016" layer="51"/>
<wire x1="1.525" y1="-3.125" x2="-1.525" y2="-3.125" width="0.1016" layer="51"/>
<smd name="1" x="-1.5" y="0" dx="1.8" dy="6.9" layer="1"/>
<smd name="2" x="1.5" y="0" dx="1.8" dy="6.9" layer="1"/>
<text x="-1.6" y="3.55" size="1.016" layer="25">&gt;NAME</text>
<text x="-1.6" y="-4.625" size="1.016" layer="27">&gt;VALUE</text>
<rectangle x1="-1.6" y1="-3.2" x2="-1.1" y2="3.2" layer="51"/>
<rectangle x1="1.1" y1="-3.2" x2="1.6" y2="3.2" layer="51"/>
</package>
<package name="C2220K">
<description>&lt;b&gt;Ceramic Chip Capacitor KEMET 2220 reflow solder&lt;/b&gt;&lt;p&gt;Metric Code Size 5650</description>
<wire x1="-2.725" y1="2.425" x2="2.725" y2="2.425" width="0.1016" layer="51"/>
<wire x1="2.725" y1="-2.425" x2="-2.725" y2="-2.425" width="0.1016" layer="51"/>
<smd name="1" x="-2.55" y="0" dx="1.85" dy="5.5" layer="1"/>
<smd name="2" x="2.55" y="0" dx="1.85" dy="5.5" layer="1"/>
<text x="-2.8" y="2.95" size="1.016" layer="25">&gt;NAME</text>
<text x="-2.8" y="-3.975" size="1.016" layer="27">&gt;VALUE</text>
<rectangle x1="-2.8" y1="-2.5" x2="-2.2" y2="2.5" layer="51"/>
<rectangle x1="2.2" y1="-2.5" x2="2.8" y2="2.5" layer="51"/>
</package>
<package name="C2225K">
<description>&lt;b&gt;Ceramic Chip Capacitor KEMET 2225 reflow solder&lt;/b&gt;&lt;p&gt;Metric Code Size 5664</description>
<wire x1="-2.725" y1="3.075" x2="2.725" y2="3.075" width="0.1016" layer="51"/>
<wire x1="2.725" y1="-3.075" x2="-2.725" y2="-3.075" width="0.1016" layer="51"/>
<smd name="1" x="-2.55" y="0" dx="1.85" dy="6.8" layer="1"/>
<smd name="2" x="2.55" y="0" dx="1.85" dy="6.8" layer="1"/>
<text x="-2.8" y="3.6" size="1.016" layer="25">&gt;NAME</text>
<text x="-2.8" y="-4.575" size="1.016" layer="27">&gt;VALUE</text>
<rectangle x1="-2.8" y1="-3.15" x2="-2.2" y2="3.15" layer="51"/>
<rectangle x1="2.2" y1="-3.15" x2="2.8" y2="3.15" layer="51"/>
</package>
<package name="HPC0201">
<description>&lt;b&gt; &lt;/b&gt;&lt;p&gt;
Source: http://www.vishay.com/docs/10129/hpc0201a.pdf</description>
<smd name="1" x="-0.18" y="0" dx="0.2" dy="0.35" layer="1"/>
<smd name="2" x="0.18" y="0" dx="0.2" dy="0.35" layer="1"/>
<text x="-0.75" y="0.74" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.785" y="-1.865" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.305" y1="-0.15" x2="0.305" y2="0.15" layer="51"/>
</package>
<package name="C0201">
<description>Source: http://www.avxcorp.com/docs/catalogs/cx5r.pdf</description>
<smd name="1" x="-0.25" y="0" dx="0.25" dy="0.35" layer="1"/>
<smd name="2" x="0.25" y="0" dx="0.25" dy="0.35" layer="1"/>
<text x="-0.635" y="0.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.635" y="-1.905" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.3" y1="-0.15" x2="-0.15" y2="0.15" layer="51"/>
<rectangle x1="0.15" y1="-0.15" x2="0.3" y2="0.15" layer="51"/>
<rectangle x1="-0.15" y1="0.1" x2="0.15" y2="0.15" layer="51"/>
<rectangle x1="-0.15" y1="-0.15" x2="0.15" y2="-0.1" layer="51"/>
</package>
<package name="C1808">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
Source: AVX .. aphvc.pdf</description>
<wire x1="-1.4732" y1="0.9502" x2="1.4732" y2="0.9502" width="0.1016" layer="51"/>
<wire x1="-1.4478" y1="-0.9502" x2="1.4732" y2="-0.9502" width="0.1016" layer="51"/>
<smd name="1" x="-1.95" y="0" dx="1.6" dy="2.2" layer="1"/>
<smd name="2" x="1.95" y="0" dx="1.6" dy="2.2" layer="1"/>
<text x="-2.233" y="1.827" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.233" y="-2.842" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-2.275" y1="-1.015" x2="-1.225" y2="1.015" layer="51"/>
<rectangle x1="1.225" y1="-1.015" x2="2.275" y2="1.015" layer="51"/>
</package>
<package name="C3640">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;&lt;p&gt;
Source: AVX .. aphvc.pdf</description>
<wire x1="-3.8322" y1="5.0496" x2="3.8322" y2="5.0496" width="0.1016" layer="51"/>
<wire x1="-3.8322" y1="-5.0496" x2="3.8322" y2="-5.0496" width="0.1016" layer="51"/>
<smd name="1" x="-4.267" y="0" dx="2.6" dy="10.7" layer="1"/>
<smd name="2" x="4.267" y="0" dx="2.6" dy="10.7" layer="1"/>
<text x="-4.647" y="6.465" size="1.27" layer="25">&gt;NAME</text>
<text x="-4.647" y="-7.255" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-4.57" y1="-5.1" x2="-3.05" y2="5.1" layer="51"/>
<rectangle x1="3.05" y1="-5.1" x2="4.5688" y2="5.1" layer="51"/>
</package>
<package name="C01005">
<description>&lt;b&gt;CAPACITOR&lt;/b&gt;</description>
<rectangle x1="-0.1999" y1="-0.3" x2="0.1999" y2="0.3" layer="35"/>
<smd name="1" x="-0.1625" y="0" dx="0.2" dy="0.25" layer="1"/>
<smd name="2" x="0.1625" y="0" dx="0.2" dy="0.25" layer="1"/>
<text x="-0.4" y="0.3" size="1.27" layer="25">&gt;NAME</text>
<text x="-0.4" y="-1.6" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.2" y1="-0.1" x2="-0.075" y2="0.1" layer="51"/>
<rectangle x1="0.075" y1="-0.1" x2="0.2" y2="0.1" layer="51"/>
<rectangle x1="-0.15" y1="0.05" x2="0.15" y2="0.1" layer="51"/>
<rectangle x1="-0.15" y1="-0.1" x2="0.15" y2="-0.05" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="R-EU">
<wire x1="-2.54" y1="-0.889" x2="2.54" y2="-0.889" width="0.254" layer="94"/>
<wire x1="2.54" y1="0.889" x2="-2.54" y2="0.889" width="0.254" layer="94"/>
<wire x1="2.54" y1="-0.889" x2="2.54" y2="0.889" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-0.889" x2="-2.54" y2="0.889" width="0.254" layer="94"/>
<text x="-3.81" y="1.4986" size="1.778" layer="95">&gt;NAME</text>
<text x="-3.81" y="-3.302" size="1.778" layer="96">&gt;VALUE</text>
<pin name="2" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
</symbol>
<symbol name="C-EU">
<wire x1="0" y1="0" x2="0" y2="-0.508" width="0.1524" layer="94"/>
<wire x1="0" y1="-2.54" x2="0" y2="-2.032" width="0.1524" layer="94"/>
<text x="1.524" y="0.381" size="1.778" layer="95">&gt;NAME</text>
<text x="1.524" y="-4.699" size="1.778" layer="96">&gt;VALUE</text>
<rectangle x1="-2.032" y1="-2.032" x2="2.032" y2="-1.524" layer="94"/>
<rectangle x1="-2.032" y1="-1.016" x2="2.032" y2="-0.508" layer="94"/>
<pin name="1" x="0" y="2.54" visible="off" length="short" direction="pas" swaplevel="1" rot="R270"/>
<pin name="2" x="0" y="-5.08" visible="off" length="short" direction="pas" swaplevel="1" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="R-EU_" prefix="R" uservalue="yes">
<description>&lt;B&gt;RESISTOR&lt;/B&gt;, European symbol</description>
<gates>
<gate name="G$1" symbol="R-EU" x="0" y="0"/>
</gates>
<devices>
<device name="R0402" package="R0402">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R0603" package="R0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R0805" package="R0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R0805W" package="R0805W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R1206" package="R1206">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R1206W" package="R1206W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R1210" package="R1210">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R1210W" package="R1210W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R2010" package="R2010">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R2010W" package="R2010W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R2012" package="R2012">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R2012W" package="R2012W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R2512" package="R2512">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R2512W" package="R2512W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R3216" package="R3216">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R3216W" package="R3216W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R3225" package="R3225">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R3225W" package="R3225W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R5025" package="R5025">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R5025W" package="R5025W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R6332" package="R6332">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R6332W" package="R6332W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="M0805" package="M0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="M1206" package="M1206">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="M1406" package="M1406">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="M2012" package="M2012">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="M2309" package="M2309">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="M3216" package="M3216">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="M3516" package="M3516">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="M5923" package="M5923">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0204/5" package="0204/5">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0204/7" package="0204/7">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0204/2V" package="0204V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0207/10" package="0207/10">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0207/12" package="0207/12">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0207/15" package="0207/15">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0207/2V" package="0207/2V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0207/5V" package="0207/5V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0207/7" package="0207/7">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0309/10" package="0309/10">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0309/12" package="0309/12">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0309/V" package="0309V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0411/12" package="0411/12">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0411/15" package="0411/15">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0411/3V" package="0411V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0414/15" package="0414/15">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0414/5V" package="0414V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0617/17" package="0617/17">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0617/22" package="0617/22">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0617/5V" package="0617V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0922/22" package="0922/22">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0613/5V" package="P0613V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0613/15" package="P0613/15">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0817/22" package="P0817/22">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0817/7V" package="P0817V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="V234/12" package="V234/12">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="V235/17" package="V235/17">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="V526-0" package="V526-0">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="MELF0102R" package="MINI_MELF-0102R">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="MELF0102W" package="MINI_MELF-0102W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="MELF0204R" package="MINI_MELF-0204R">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="MELF0204W" package="MINI_MELF-0204W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="MELF0207R" package="MINI_MELF-0207R">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="MELF0207W" package="MINI_MELF-0207W">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0922V" package="0922V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="RDH/15" package="RDH/15">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="MELF0102AX" package="MINI_MELF-0102AX">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R0201" package="R0201">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="VTA52" package="VTA52">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="VTA53" package="VTA53">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="VTA54" package="VTA54">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="VTA55" package="VTA55">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="VTA56" package="VTA56">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="VMTA55" package="VMTA55">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="VMTB60" package="VMTB60">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R4527" package="R4527">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="WSC0001" package="WSC0001">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="WSC0002" package="WSC0002">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="WSC01/2" package="WSC01/2">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="WSC2515" package="WSC2515">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="WSC4527" package="WSC4527">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="WSC6927" package="WSC6927">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="R1218" package="R1218">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1812X7R" package="1812X7R">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PRL1632" package="PRL1632">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="01005" package="R01005">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="C-EU" prefix="C" uservalue="yes">
<description>&lt;B&gt;CAPACITOR&lt;/B&gt;, European symbol</description>
<gates>
<gate name="G$1" symbol="C-EU" x="0" y="0"/>
</gates>
<devices>
<device name="C0402" package="C0402">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C0504" package="C0504">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C0603" package="C0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C0805" package="C0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C1206" package="C1206">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C1210" package="C1210">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C1310" package="C1310">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C1608" package="C1608">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C1812" package="C1812">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C1825" package="C1825">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C2012" package="C2012">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C3216" package="C3216">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C3225" package="C3225">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C4532" package="C4532">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C4564" package="C4564">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="025-024X044" package="C025-024X044">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="025-025X050" package="C025-025X050">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="025-030X050" package="C025-030X050">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="025-040X050" package="C025-040X050">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="025-050X050" package="C025-050X050">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="025-060X050" package="C025-060X050">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C025_050-024X070" package="C025_050-024X070">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="025_050-025X075" package="C025_050-025X075">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="025_050-035X075" package="C025_050-035X075">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="025_050-045X075" package="C025_050-045X075">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="025_050-055X075" package="C025_050-055X075">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="050-024X044" package="C050-024X044">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="050-025X075" package="C050-025X075">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="050-045X075" package="C050-045X075">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="050-030X075" package="C050-030X075">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="050-050X075" package="C050-050X075">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="050-055X075" package="C050-055X075">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="050-075X075" package="C050-075X075">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="050H075X075" package="C050H075X075">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="075-032X103" package="C075-032X103">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="075-042X103" package="C075-042X103">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="075-052X106" package="C075-052X106">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="102-043X133" package="C102-043X133">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="102-054X133" package="C102-054X133">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="102-064X133" package="C102-064X133">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="102_152-062X184" package="C102_152-062X184">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="150-054X183" package="C150-054X183">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="150-064X183" package="C150-064X183">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="150-072X183" package="C150-072X183">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="150-084X183" package="C150-084X183">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="150-091X182" package="C150-091X182">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="225-062X268" package="C225-062X268">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="225-074X268" package="C225-074X268">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="225-087X268" package="C225-087X268">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="225-108X268" package="C225-108X268">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="225-113X268" package="C225-113X268">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="275-093X316" package="C275-093X316">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="275-113X316" package="C275-113X316">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="275-134X316" package="C275-134X316">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="275-205X316" package="C275-205X316">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="325-137X374" package="C325-137X374">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="325-162X374" package="C325-162X374">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="325-182X374" package="C325-182X374">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="375-192X418" package="C375-192X418">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="375-203X418" package="C375-203X418">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="050-035X075" package="C050-035X075">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="375-155X418" package="C375-155X418">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="075-063X106" package="C075-063X106">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="275-154X316" package="C275-154X316">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="275-173X316" package="C275-173X316">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C0402K" package="C0402K">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C0603K" package="C0603K">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C0805K" package="C0805K">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C1206K" package="C1206K">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C1210K" package="C1210K">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C1812K" package="C1812K">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C1825K" package="C1825K">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C2220K" package="C2220K">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C2225K" package="C2225K">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="HPC0201" package="HPC0201">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C0201" package="C0201">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C1808" package="C1808">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="C3640" package="C3640">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="01005" package="C01005">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="DTS-3">
<packages>
<package name="DTS-3">
<pad name="P$1" x="-3.175" y="0" drill="1.3" diameter="2.54"/>
<pad name="P$2" x="3.325" y="0" drill="1.3" diameter="2.54"/>
<wire x1="-3.175" y1="1.5" x2="-3.175" y2="2" width="0.1" layer="21"/>
<wire x1="-3.175" y1="2" x2="3.325" y2="2" width="0.1" layer="21"/>
<wire x1="3.325" y1="2" x2="3.325" y2="1.5" width="0.1" layer="21"/>
<wire x1="3.325" y1="-1.5" x2="3.325" y2="-2" width="0.1" layer="21"/>
<wire x1="3.325" y1="-2" x2="-3.175" y2="-2" width="0.1" layer="21"/>
<wire x1="-3.175" y1="-2" x2="-3.175" y2="-1.5" width="0.1" layer="21"/>
<wire x1="-1.675" y1="1" x2="-1.675" y2="-1" width="0.1" layer="21"/>
<wire x1="-1.675" y1="-1" x2="1.825" y2="-1" width="0.1" layer="21"/>
<wire x1="1.825" y1="-1" x2="1.825" y2="1" width="0.1" layer="21"/>
<wire x1="1.825" y1="1" x2="-1.675" y2="1" width="0.1" layer="21"/>
<text x="-3.175" y="2.54" size="0.6096" layer="21">&gt;NAME</text>
</package>
</packages>
<symbols>
<symbol name="DTS-3">
<pin name="P$1" x="-5.08" y="-2.54" visible="off" length="middle" rot="R90"/>
<pin name="P$2" x="5.08" y="-2.54" visible="off" length="middle" rot="R90"/>
<wire x1="-5.08" y1="0" x2="-5.08" y2="2.54" width="0.254" layer="94"/>
<wire x1="-5.08" y1="2.54" x2="-2.54" y2="2.54" width="0.254" layer="94"/>
<wire x1="5.08" y1="0" x2="5.08" y2="2.54" width="0.254" layer="94"/>
<wire x1="5.08" y1="2.54" x2="2.54" y2="2.54" width="0.254" layer="94"/>
<wire x1="2.54" y1="2.54" x2="-2.54" y2="5.08" width="0.254" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="DTS-3">
<gates>
<gate name="G$1" symbol="DTS-3" x="0" y="0"/>
</gates>
<devices>
<device name="" package="DTS-3">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="lm4875">
<packages>
<package name="SO-8">
<wire x1="1.9" y1="-2.4" x2="-1.4" y2="-2.4" width="0.2032" layer="51"/>
<wire x1="-1.4" y1="-2.4" x2="-1.9" y2="-2.4" width="0.2032" layer="51"/>
<wire x1="-1.9" y1="-2.4" x2="-1.9" y2="2.4" width="0.2032" layer="51"/>
<wire x1="-1.9" y1="2.4" x2="-1.4" y2="2.4" width="0.2032" layer="51"/>
<wire x1="-1.4" y1="2.4" x2="1.9" y2="2.4" width="0.2032" layer="51"/>
<wire x1="1.9" y1="2.4" x2="1.9" y2="-2.4" width="0.2032" layer="51"/>
<wire x1="-1.4" y1="-2.4" x2="-1.4" y2="2.4" width="0.2032" layer="51"/>
<smd name="2" x="-2.6" y="0.635" dx="0.6" dy="2.2" layer="1" rot="R270"/>
<smd name="7" x="2.6" y="0.635" dx="0.6" dy="2.2" layer="1" rot="R270"/>
<smd name="1" x="-2.6" y="1.905" dx="0.6" dy="2.2" layer="1" rot="R270"/>
<smd name="3" x="-2.6" y="-0.635" dx="0.6" dy="2.2" layer="1" rot="R270"/>
<smd name="4" x="-2.6" y="-1.905" dx="0.6" dy="2.2" layer="1" rot="R270"/>
<smd name="8" x="2.6" y="1.905" dx="0.6" dy="2.2" layer="1" rot="R270"/>
<smd name="6" x="2.6" y="-0.635" dx="0.6" dy="2.2" layer="1" rot="R270"/>
<smd name="5" x="2.6" y="-1.905" dx="0.6" dy="2.2" layer="1" rot="R270"/>
<text x="-1.905" y="2.667" size="0.6096" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.302" size="0.6096" layer="27">&gt;VALUE</text>
<rectangle x1="-2.795" y1="1.355" x2="-2.305" y2="2.455" layer="51" rot="R270"/>
<rectangle x1="-2.795" y1="0.085" x2="-2.305" y2="1.185" layer="51" rot="R270"/>
<rectangle x1="-2.795" y1="-1.185" x2="-2.305" y2="-0.085" layer="51" rot="R270"/>
<rectangle x1="-2.795" y1="-2.455" x2="-2.305" y2="-1.355" layer="51" rot="R270"/>
<rectangle x1="2.305" y1="-2.455" x2="2.795" y2="-1.355" layer="51" rot="R270"/>
<rectangle x1="2.305" y1="-1.185" x2="2.795" y2="-0.085" layer="51" rot="R270"/>
<rectangle x1="2.305" y1="0.085" x2="2.795" y2="1.185" layer="51" rot="R270"/>
<rectangle x1="2.305" y1="1.355" x2="2.795" y2="2.455" layer="51" rot="R270"/>
</package>
</packages>
<symbols>
<symbol name="LM4875">
<wire x1="-10.16" y1="10.16" x2="12.7" y2="10.16" width="0.254" layer="94"/>
<wire x1="12.7" y1="10.16" x2="12.7" y2="-10.16" width="0.254" layer="94"/>
<wire x1="12.7" y1="-10.16" x2="-10.16" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-10.16" x2="-10.16" y2="10.16" width="0.254" layer="94"/>
<text x="-10.16" y="11.43" size="1.778" layer="95">&gt;NAME</text>
<text x="-10.16" y="-12.7" size="1.778" layer="96">&gt;VALUE</text>
<text x="-7.62" y="6.858" size="1.524" layer="95">VDD</text>
<text x="5.842" y="-3.302" size="1.524" layer="95">GND</text>
<pin name="VOL/!SD" x="-12.7" y="-7.62" length="short" direction="in"/>
<pin name="IN-" x="-12.7" y="2.54" length="short" direction="in"/>
<pin name="SENSE" x="-12.7" y="-2.54" length="short" direction="in"/>
<pin name="BYPASS" x="15.24" y="2.54" length="short" direction="pas" rot="R180"/>
<pin name="VDD" x="-12.7" y="7.62" visible="pad" length="short" direction="pwr"/>
<pin name="VO2" x="15.24" y="7.62" length="short" direction="out" rot="R180"/>
<pin name="VO1" x="15.24" y="-7.62" length="short" direction="out" rot="R180"/>
<pin name="GND@" x="15.24" y="-2.54" visible="pad" length="short" direction="pwr" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="LM4875" prefix="U">
<description>&lt;h2&gt;LM4875&lt;/h2&gt;
&lt;p&gt;&lt;b&gt;Boomer Audio Power Amplifier 750mW&lt;/p&gt;- with DC Volume Control and Headphone Switch&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="LM4875" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SO-8">
<connects>
<connect gate="G$1" pin="BYPASS" pad="7"/>
<connect gate="G$1" pin="GND@" pad="6"/>
<connect gate="G$1" pin="IN-" pad="2"/>
<connect gate="G$1" pin="SENSE" pad="3"/>
<connect gate="G$1" pin="VDD" pad="1"/>
<connect gate="G$1" pin="VO1" pad="5"/>
<connect gate="G$1" pin="VO2" pad="8"/>
<connect gate="G$1" pin="VOL/!SD" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="pot">
<description>&lt;b&gt;Potentiometers&lt;/b&gt;&lt;p&gt;
Beckman, Copal, Piher, Spectrol, Schukat&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="PT-10">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;</description>
<wire x1="-3.175" y1="-4.064" x2="3.175" y2="-4.064" width="0.1524" layer="21" curve="-288.924644"/>
<wire x1="3.175" y1="-4.064" x2="3.175" y2="-5.715" width="0.1524" layer="51"/>
<wire x1="-3.175" y1="-5.715" x2="-3.175" y2="-4.064" width="0.1524" layer="51"/>
<wire x1="-2.794" y1="-5.715" x2="-2.794" y2="-3.175" width="0.1524" layer="51"/>
<wire x1="-2.794" y1="-3.175" x2="-1.905" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-2.54" x2="-0.635" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-3.175" x2="-0.635" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-4.445" x2="-1.27" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-4.445" x2="-1.27" y2="-5.715" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-5.715" x2="1.27" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-4.445" x2="0.635" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-4.445" x2="0.635" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-3.175" x2="1.905" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-2.54" x2="2.794" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="2.794" y1="-3.175" x2="2.794" y2="-5.715" width="0.1524" layer="51"/>
<wire x1="-3.175" y1="-5.715" x2="3.175" y2="-5.715" width="0.1524" layer="51"/>
<wire x1="0.889" y1="1.397" x2="-0.127" y2="0.381" width="0.1524" layer="21"/>
<wire x1="-0.127" y1="0.381" x2="-0.508" y2="0.762" width="0.1524" layer="21"/>
<wire x1="-0.508" y1="0.762" x2="-0.508" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.508" y1="0" x2="-1.397" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="1.397" y1="0.889" x2="0.381" y2="-0.127" width="0.1524" layer="21"/>
<wire x1="0.381" y1="-0.127" x2="0.762" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="0.762" y1="-0.508" x2="0" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.508" x2="-0.889" y2="-1.397" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="1.8034" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="2.794" width="0.0508" layer="21"/>
<pad name="A" x="-2.54" y="-5.08" drill="1.016" shape="octagon"/>
<pad name="E" x="2.54" y="-5.08" drill="1.016" shape="octagon"/>
<pad name="S" x="0" y="5.08" drill="1.016" shape="octagon"/>
<text x="-3.175" y="6.35" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.048" y="-7.62" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="PT-10S">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;</description>
<wire x1="-1.905" y1="-1.27" x2="-1.27" y2="-1.905" width="0.1524" layer="51"/>
<wire x1="-1.27" y1="-1.905" x2="1.27" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="1.905" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-4.445" y1="-1.27" x2="4.445" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-0.635" y1="3.175" x2="-0.635" y2="2.54" width="0.1524" layer="21"/>
<wire x1="0.635" y1="2.54" x2="0.635" y2="3.175" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="3.175" x2="4.445" y2="3.175" width="0.1524" layer="21"/>
<wire x1="5.08" y1="2.54" x2="4.445" y2="3.175" width="0.1524" layer="21"/>
<wire x1="5.08" y1="2.54" x2="5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-1.27" x2="-5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="3.175" x2="-5.08" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="2.54" x2="5.08" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-0.635" x2="5.08" y2="-0.635" width="0.1524" layer="51"/>
<wire x1="-5.08" y1="-0.635" x2="-5.08" y2="2.54" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<pad name="A" x="-2.54" y="-1.27" drill="1.016" shape="long"/>
<pad name="E" x="2.54" y="-1.27" drill="1.016" shape="long"/>
<pad name="S" x="0" y="1.27" drill="1.016" shape="long"/>
<text x="-2.54" y="3.7846" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-4.2164" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="PT-SPIN">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;</description>
<wire x1="-8.89" y1="-2.54" x2="8.89" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="8.89" y1="-2.54" x2="8.89" y2="2.54" width="0.1524" layer="21"/>
<wire x1="8.89" y1="2.54" x2="-8.89" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="2.54" x2="-8.89" y2="-2.54" width="0.1524" layer="21"/>
<pad name="S" x="-1.27" y="1.27" drill="0.8128" shape="long"/>
<pad name="E" x="6.35" y="-1.27" drill="0.8128" shape="long"/>
<pad name="A" x="-6.35" y="-1.27" drill="0.8128" shape="long"/>
<text x="-3.175" y="3.175" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-1.778" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-9.525" y1="-1.27" x2="-8.89" y2="1.27" layer="21"/>
<rectangle x1="-10.16" y1="0.381" x2="-9.525" y2="1.27" layer="21"/>
<rectangle x1="-10.16" y1="-1.27" x2="-9.525" y2="-0.381" layer="21"/>
</package>
<package name="B25P">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;&lt;p&gt;
Beckman Helitrim 25</description>
<wire x1="3.175" y1="3.429" x2="-3.175" y2="3.429" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-3.429" x2="-2.54" y2="-3.429" width="0.1524" layer="21"/>
<wire x1="3.175" y1="3.429" x2="3.429" y2="3.175" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-3.429" x2="3.429" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="3.429" y1="-3.175" x2="3.429" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="3.429" y1="-1.524" x2="3.429" y2="-0.254" width="0.1524" layer="51"/>
<wire x1="3.429" y1="-0.254" x2="3.429" y2="3.175" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-3.429" x2="-3.429" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="3.429" x2="-3.429" y2="3.175" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="3.175" x2="-3.429" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="-0.254" x2="-3.429" y2="-1.524" width="0.1524" layer="51"/>
<wire x1="-3.429" y1="-1.524" x2="-3.429" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="0.762" y1="0" x2="1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="1.524" y1="0" x2="1.524" y2="0.762" width="0.1524" layer="21"/>
<wire x1="1.524" y1="0.762" x2="0.762" y2="0.762" width="0.1524" layer="21"/>
<wire x1="0.762" y1="0.762" x2="0.381" y2="1.143" width="0.1524" layer="21"/>
<wire x1="0.381" y1="1.143" x2="0.381" y2="1.524" width="0.1524" layer="21"/>
<wire x1="0.381" y1="2.286" x2="-0.381" y2="2.286" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="2.286" x2="-0.381" y2="1.524" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="1.143" x2="-0.762" y2="0.762" width="0.1524" layer="21"/>
<wire x1="-0.762" y1="0.762" x2="-1.524" y2="0.762" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="0.762" x2="-1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="0" x2="-0.762" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="-0.381" x2="-0.762" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="-0.381" x2="-0.381" y2="-0.762" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="-1.524" x2="0.381" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="0.381" y1="-1.524" x2="0.381" y2="-0.762" width="0.1524" layer="21"/>
<wire x1="0.381" y1="-0.381" x2="0.762" y2="0" width="0.1524" layer="21"/>
<wire x1="-1.778" y1="-1.397" x2="-2.032" y2="-1.651" width="0.3048" layer="51"/>
<wire x1="1.778" y1="-1.397" x2="2.032" y2="-1.651" width="0.3048" layer="51"/>
<wire x1="2.3876" y1="0.381" x2="2.7686" y2="0.381" width="0.3048" layer="21"/>
<wire x1="1.778" y1="2.032" x2="2.032" y2="2.286" width="0.3048" layer="21"/>
<wire x1="0" y1="2.7178" x2="0" y2="3.0988" width="0.3048" layer="21"/>
<wire x1="-1.905" y1="2.032" x2="-2.159" y2="2.286" width="0.3048" layer="21"/>
<wire x1="-2.3876" y1="0.381" x2="-2.7686" y2="0.381" width="0.3048" layer="21"/>
<wire x1="0.381" y1="1.524" x2="-0.381" y2="1.524" width="0.1524" layer="21"/>
<wire x1="0.381" y1="1.524" x2="0.381" y2="2.286" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="1.524" x2="-0.381" y2="1.143" width="0.1524" layer="21"/>
<wire x1="0.381" y1="-0.762" x2="-0.381" y2="-0.762" width="0.1524" layer="21"/>
<wire x1="0.381" y1="-0.762" x2="0.381" y2="-0.381" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="-0.762" x2="-0.381" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-3.048" x2="-2.54" y2="-3.429" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="-3.048" x2="1.016" y2="-3.048" width="0.1524" layer="51"/>
<wire x1="2.54" y1="-3.429" x2="2.54" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-3.429" x2="-0.635" y2="-3.429" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-3.429" x2="0.635" y2="-3.429" width="0.1524" layer="51"/>
<wire x1="0.635" y1="-3.429" x2="2.54" y2="-3.429" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-3.429" x2="3.175" y2="-3.429" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-3.048" x2="-1.016" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="1.016" y1="-3.048" x2="2.54" y2="-3.048" width="0.1524" layer="21"/>
<circle x="0" y="0.381" radius="2.032" width="0.1524" layer="51"/>
<pad name="A" x="-2.54" y="0" drill="0.8128" shape="octagon"/>
<pad name="E" x="2.54" y="0" drill="0.8128" shape="octagon"/>
<pad name="S" x="0" y="2.54" drill="0.8128" shape="octagon"/>
<text x="-3.175" y="3.81" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.1496" y="-5.08" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="2.413" y="-2.794" size="0.9906" layer="21" ratio="12">3</text>
<text x="-2.921" y="-2.794" size="0.9906" layer="21" ratio="12">1</text>
</package>
<package name="B25U">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;&lt;p&gt;
Beckman Helitrim 25</description>
<wire x1="3.175" y1="3.429" x2="-3.175" y2="3.429" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-3.429" x2="-2.54" y2="-3.429" width="0.1524" layer="21"/>
<wire x1="3.175" y1="3.429" x2="3.429" y2="3.175" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-3.429" x2="3.429" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="3.429" y1="-3.175" x2="3.429" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="3.429" y1="-1.524" x2="3.429" y2="-0.254" width="0.1524" layer="51"/>
<wire x1="3.429" y1="-0.254" x2="3.429" y2="3.175" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-3.429" x2="-3.429" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="3.429" x2="-3.429" y2="3.175" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="3.175" x2="-3.429" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="-0.254" x2="-3.429" y2="-1.524" width="0.1524" layer="51"/>
<wire x1="-3.429" y1="-1.524" x2="-3.429" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="0.762" y1="0" x2="1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="1.524" y1="0" x2="1.524" y2="0.762" width="0.1524" layer="21"/>
<wire x1="1.524" y1="0.762" x2="0.762" y2="0.762" width="0.1524" layer="21"/>
<wire x1="0.762" y1="0.762" x2="0.381" y2="1.143" width="0.1524" layer="21"/>
<wire x1="0.381" y1="1.143" x2="0.381" y2="1.524" width="0.1524" layer="21"/>
<wire x1="0.381" y1="2.286" x2="-0.381" y2="2.286" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="2.286" x2="-0.381" y2="1.524" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="1.143" x2="-0.762" y2="0.762" width="0.1524" layer="21"/>
<wire x1="-0.762" y1="0.762" x2="-1.524" y2="0.762" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="0.762" x2="-1.524" y2="0" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="0" x2="-0.762" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="-0.381" x2="-0.762" y2="0" width="0.1524" layer="51"/>
<wire x1="-0.381" y1="-0.381" x2="-0.381" y2="-0.762" width="0.1524" layer="51"/>
<wire x1="-0.381" y1="-1.524" x2="0.381" y2="-1.524" width="0.1524" layer="51"/>
<wire x1="0.381" y1="-1.524" x2="0.381" y2="-0.762" width="0.1524" layer="51"/>
<wire x1="0.381" y1="-0.381" x2="0.762" y2="0" width="0.1524" layer="51"/>
<wire x1="-1.778" y1="-1.397" x2="-2.032" y2="-1.651" width="0.3048" layer="51"/>
<wire x1="1.778" y1="-1.397" x2="2.032" y2="-1.651" width="0.3048" layer="51"/>
<wire x1="2.3876" y1="0.381" x2="2.7686" y2="0.381" width="0.3048" layer="21"/>
<wire x1="1.778" y1="2.032" x2="2.032" y2="2.286" width="0.3048" layer="21"/>
<wire x1="0" y1="2.7178" x2="0" y2="3.0988" width="0.3048" layer="21"/>
<wire x1="-1.905" y1="2.032" x2="-2.159" y2="2.286" width="0.3048" layer="21"/>
<wire x1="-2.3876" y1="0.381" x2="-2.7686" y2="0.381" width="0.3048" layer="21"/>
<wire x1="0.381" y1="1.524" x2="-0.381" y2="1.524" width="0.1524" layer="21"/>
<wire x1="0.381" y1="1.524" x2="0.381" y2="2.286" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="1.524" x2="-0.381" y2="1.143" width="0.1524" layer="21"/>
<wire x1="0.381" y1="-0.762" x2="-0.381" y2="-0.762" width="0.1524" layer="51"/>
<wire x1="0.381" y1="-0.762" x2="0.381" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="-0.381" y1="-0.762" x2="-0.381" y2="-1.524" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="-3.048" x2="-2.54" y2="-3.429" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-3.048" x2="2.54" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-3.429" x2="2.54" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-3.429" x2="3.175" y2="-3.429" width="0.1524" layer="21"/>
<circle x="0" y="0.381" radius="2.032" width="0.1524" layer="51"/>
<pad name="A" x="2.54" y="-0.889" drill="0.8128" shape="long" rot="R90"/>
<pad name="E" x="-2.54" y="-0.889" drill="0.8128" shape="long" rot="R90"/>
<pad name="S" x="0" y="-0.889" drill="0.8128" shape="long" rot="R90"/>
<text x="-3.175" y="3.81" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.1496" y="-5.08" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-3.175" y="-2.794" size="0.9906" layer="21" ratio="12">3</text>
<text x="2.413" y="-2.794" size="0.9906" layer="21" ratio="12">1</text>
</package>
<package name="B25V">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;&lt;p&gt;
Beckman Helitrim 25</description>
<wire x1="3.429" y1="3.556" x2="3.429" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0.508" y1="2.413" x2="0.381" y2="2.286" width="0.1524" layer="21"/>
<wire x1="0.508" y1="2.413" x2="0.381" y2="2.54" width="0.1524" layer="21"/>
<wire x1="0.254" y1="2.159" x2="0.254" y2="2.667" width="0.1524" layer="21"/>
<wire x1="0.254" y1="2.159" x2="0.127" y2="2.032" width="0.1524" layer="21"/>
<wire x1="0.254" y1="2.667" x2="0.127" y2="2.794" width="0.1524" layer="21"/>
<wire x1="0.381" y1="2.286" x2="0.381" y2="2.54" width="0.1524" layer="21"/>
<wire x1="0.381" y1="2.286" x2="0.254" y2="2.159" width="0.1524" layer="21"/>
<wire x1="0.381" y1="2.54" x2="0.254" y2="2.667" width="0.1524" layer="21"/>
<wire x1="0.508" y1="2.413" x2="0.127" y2="2.413" width="0.1524" layer="21"/>
<wire x1="0.127" y1="2.413" x2="-2.032" y2="2.413" width="0.1524" layer="21"/>
<wire x1="0.127" y1="2.413" x2="0.127" y2="2.794" width="0.1524" layer="21"/>
<wire x1="0.127" y1="2.032" x2="0.127" y2="2.413" width="0.1524" layer="21"/>
<wire x1="0" y1="1.905" x2="0.127" y2="2.032" width="0.1524" layer="21"/>
<wire x1="0.127" y1="2.794" x2="0" y2="2.921" width="0.1524" layer="21"/>
<wire x1="0" y1="2.921" x2="0" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="-3.048" x2="3.429" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="2.54" y1="1.778" x2="2.54" y2="1.143" width="0.1524" layer="51"/>
<wire x1="2.54" y1="1.143" x2="3.429" y2="1.143" width="0.1524" layer="51"/>
<wire x1="3.429" y1="1.27" x2="3.429" y2="0" width="0.1524" layer="51"/>
<wire x1="3.429" y1="0" x2="3.429" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="1.778" x2="-2.54" y2="1.143" width="0.1524" layer="51"/>
<wire x1="3.429" y1="3.556" x2="2.54" y2="3.556" width="0.1524" layer="21"/>
<wire x1="2.54" y1="3.556" x2="-2.54" y2="3.556" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="3.556" x2="-3.429" y2="3.556" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="1.143" x2="-2.54" y2="1.143" width="0.1524" layer="51"/>
<wire x1="-3.429" y1="-3.048" x2="-3.429" y2="0" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="0" x2="-3.429" y2="1.27" width="0.1524" layer="51"/>
<wire x1="-3.429" y1="1.27" x2="-3.429" y2="3.556" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="1.778" x2="-2.54" y2="3.556" width="0.1524" layer="21"/>
<wire x1="2.54" y1="1.778" x2="2.54" y2="3.556" width="0.1524" layer="21"/>
<pad name="A" x="2.54" y="0.635" drill="0.8128" shape="long" rot="R90"/>
<pad name="E" x="-2.54" y="0.635" drill="0.8128" shape="long" rot="R90"/>
<pad name="S" x="0" y="0.635" drill="0.8128" shape="long" rot="R90"/>
<text x="-3.302" y="4.445" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.4036" y="-4.826" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-3.048" y="-2.032" size="1.27" layer="21" ratio="10">3</text>
<text x="2.159" y="-1.905" size="1.27" layer="21" ratio="10">1</text>
<text x="-0.381" y="1.778" size="1.27" layer="21" ratio="10"> 3 </text>
<rectangle x1="-1.524" y1="3.556" x2="-0.254" y2="4.191" layer="21"/>
<rectangle x1="0.254" y1="3.556" x2="1.524" y2="4.191" layer="21"/>
<rectangle x1="-0.254" y1="3.556" x2="0.254" y2="3.81" layer="21"/>
</package>
<package name="B25X">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;&lt;p&gt;
Beckman Helitrim 25</description>
<wire x1="-3.429" y1="-3.048" x2="-3.429" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="-2.54" x2="-3.429" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-3.429" y1="-1.27" x2="-3.429" y2="1.143" width="0.1524" layer="21"/>
<wire x1="3.429" y1="3.556" x2="3.429" y2="1.143" width="0.1524" layer="21"/>
<wire x1="0.508" y1="2.413" x2="0.381" y2="2.286" width="0.1524" layer="21"/>
<wire x1="0.508" y1="2.413" x2="0.381" y2="2.54" width="0.1524" layer="21"/>
<wire x1="0.254" y1="2.159" x2="0.254" y2="2.667" width="0.1524" layer="21"/>
<wire x1="0.254" y1="2.159" x2="0.127" y2="2.032" width="0.1524" layer="21"/>
<wire x1="0.254" y1="2.667" x2="0.127" y2="2.794" width="0.1524" layer="21"/>
<wire x1="0.381" y1="2.286" x2="0.381" y2="2.54" width="0.1524" layer="21"/>
<wire x1="0.381" y1="2.286" x2="0.254" y2="2.159" width="0.1524" layer="21"/>
<wire x1="0.381" y1="2.54" x2="0.254" y2="2.667" width="0.1524" layer="21"/>
<wire x1="0.508" y1="2.413" x2="0.127" y2="2.413" width="0.1524" layer="21"/>
<wire x1="0.127" y1="2.413" x2="-2.032" y2="2.413" width="0.1524" layer="21"/>
<wire x1="0.127" y1="2.413" x2="0.127" y2="2.794" width="0.1524" layer="21"/>
<wire x1="0.127" y1="2.032" x2="0.127" y2="2.413" width="0.1524" layer="21"/>
<wire x1="0" y1="1.905" x2="0.127" y2="2.032" width="0.1524" layer="21"/>
<wire x1="0.127" y1="2.794" x2="0" y2="2.921" width="0.1524" layer="21"/>
<wire x1="0" y1="2.921" x2="0" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="-3.048" x2="3.429" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="3.429" y1="3.556" x2="2.54" y2="3.556" width="0.1524" layer="21"/>
<wire x1="2.54" y1="3.556" x2="2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="2.54" y1="3.556" x2="-2.54" y2="3.556" width="0.1524" layer="21"/>
<wire x1="2.54" y1="1.143" x2="3.429" y2="1.143" width="0.1524" layer="21"/>
<wire x1="3.429" y1="1.143" x2="3.429" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.429" y1="-1.27" x2="3.429" y2="-2.54" width="0.1524" layer="51"/>
<wire x1="3.429" y1="-2.54" x2="3.429" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="3.556" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="3.556" x2="-3.429" y2="3.556" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="1.143" x2="-2.54" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="1.143" x2="-3.429" y2="3.556" width="0.1524" layer="21"/>
<pad name="A" x="2.54" y="-1.905" drill="0.8128" shape="long" rot="R90"/>
<pad name="E" x="-2.54" y="-1.905" drill="0.8128" shape="long" rot="R90"/>
<pad name="S" x="0" y="0.635" drill="0.8128" shape="long" rot="R90"/>
<text x="-3.302" y="4.572" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.4036" y="-4.699" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-3.048" y="-0.762" size="1.27" layer="21" ratio="10">3</text>
<text x="2.159" y="-0.635" size="1.27" layer="21" ratio="10">1</text>
<text x="-0.381" y="1.778" size="1.27" layer="21" ratio="10"> 3 </text>
<rectangle x1="-1.524" y1="3.556" x2="-0.254" y2="4.191" layer="21"/>
<rectangle x1="0.254" y1="3.556" x2="1.524" y2="4.191" layer="21"/>
<rectangle x1="-0.254" y1="3.556" x2="0.254" y2="3.81" layer="21"/>
</package>
<package name="B64W">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;&lt;p&gt;
Beckman Helitrim 64</description>
<wire x1="3.175" y1="1.016" x2="-3.175" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.016" x2="-3.175" y2="0.762" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="0.762" x2="-3.175" y2="-0.762" width="0.1524" layer="51"/>
<wire x1="-3.175" y1="-0.762" x2="-3.175" y2="-3.302" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-3.302" x2="-0.762" y2="-3.302" width="0.1524" layer="21"/>
<wire x1="-0.762" y1="-3.302" x2="0.762" y2="-3.302" width="0.1524" layer="51"/>
<wire x1="0.762" y1="-3.302" x2="3.175" y2="-3.302" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-3.302" x2="3.175" y2="-0.762" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-0.762" x2="3.175" y2="0.762" width="0.1524" layer="51"/>
<wire x1="3.175" y1="0.762" x2="3.175" y2="1.016" width="0.1524" layer="21"/>
<wire x1="2.667" y1="-1.143" x2="1.651" y2="-2.159" width="0.3048" layer="21"/>
<wire x1="-0.254" y1="-1.778" x2="-0.635" y2="-1.778" width="0.1524" layer="51"/>
<wire x1="-0.254" y1="-1.778" x2="-0.381" y2="-1.905" width="0.1524" layer="51"/>
<wire x1="-0.254" y1="-1.778" x2="-0.381" y2="-1.651" width="0.1524" layer="51"/>
<wire x1="-0.508" y1="-2.032" x2="-0.508" y2="-1.524" width="0.1524" layer="51"/>
<wire x1="-0.508" y1="-2.032" x2="-0.635" y2="-2.159" width="0.1524" layer="51"/>
<wire x1="-0.508" y1="-1.524" x2="-0.635" y2="-1.397" width="0.1524" layer="51"/>
<wire x1="-0.381" y1="-1.905" x2="-0.381" y2="-1.651" width="0.1524" layer="51"/>
<wire x1="-0.381" y1="-1.905" x2="-0.508" y2="-2.032" width="0.1524" layer="51"/>
<wire x1="-0.381" y1="-1.651" x2="-0.508" y2="-1.524" width="0.1524" layer="51"/>
<wire x1="-0.635" y1="-1.778" x2="-0.635" y2="-1.397" width="0.1524" layer="51"/>
<wire x1="-0.635" y1="-2.159" x2="-0.635" y2="-1.778" width="0.1524" layer="51"/>
<wire x1="-0.762" y1="-2.286" x2="-0.635" y2="-2.159" width="0.1524" layer="51"/>
<wire x1="-0.635" y1="-1.397" x2="-0.762" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-0.762" y1="-1.27" x2="-0.762" y2="-2.286" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="-1.778" x2="-0.635" y2="-1.778" width="0.1524" layer="51"/>
<wire x1="1.524" y1="-1.016" x2="3.048" y2="-1.524" width="0.1524" layer="21" curve="233.130102"/>
<wire x1="1.27" y1="-1.524" x2="3.048" y2="-1.524" width="0.1524" layer="51" curve="-163.739795"/>
<pad name="A" x="2.54" y="0" drill="0.8128" shape="long"/>
<pad name="E" x="-2.54" y="0" drill="0.8128" shape="long"/>
<pad name="S" x="0" y="-2.54" drill="0.8128" shape="long"/>
<text x="-3.175" y="1.4732" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-4.953" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-1.651" y="-0.508" size="1.27" layer="21" ratio="10">3</text>
<text x="0.762" y="-0.508" size="1.27" layer="21" ratio="10">1</text>
<text x="-0.127" y="-2.413" size="1.27" layer="51" ratio="10">3</text>
</package>
<package name="B64Y">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;&lt;p&gt;
Beckman Helitrim 64</description>
<wire x1="3.175" y1="2.032" x2="-3.175" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="2.032" x2="-3.175" y2="1.397" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.397" x2="-3.175" y2="-1.397" width="0.1524" layer="51"/>
<wire x1="-3.175" y1="-1.397" x2="-3.175" y2="-2.2098" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-2.2098" x2="3.175" y2="-2.2098" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-2.2098" x2="3.175" y2="-1.397" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.397" x2="3.175" y2="1.397" width="0.1524" layer="51"/>
<wire x1="3.175" y1="1.397" x2="3.175" y2="2.032" width="0.1524" layer="21"/>
<wire x1="2.667" y1="-0.127" x2="1.651" y2="-1.143" width="0.1524" layer="51"/>
<wire x1="-0.889" y1="-1.397" x2="-1.016" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-0.889" y1="-1.397" x2="-1.016" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.143" y1="-1.651" x2="-1.143" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="-1.143" y1="-1.651" x2="-1.27" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="-1.143" y1="-1.143" x2="-1.27" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="-1.524" x2="-1.016" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="-1.524" x2="-1.143" y2="-1.651" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="-1.27" x2="-1.143" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="-0.889" y1="-1.397" x2="-1.27" y2="-1.397" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.397" x2="-2.794" y2="-1.397" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.397" x2="-1.27" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.778" x2="-1.27" y2="-1.397" width="0.1524" layer="21"/>
<wire x1="-1.397" y1="-1.905" x2="-1.27" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.016" x2="-1.397" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="-1.397" y1="-0.889" x2="-1.397" y2="-1.905" width="0.1524" layer="21"/>
<circle x="2.159" y="-0.635" radius="0.889" width="0.1524" layer="51"/>
<pad name="A" x="2.54" y="0" drill="0.8128" shape="long" rot="R90"/>
<pad name="E" x="-2.54" y="0" drill="0.8128" shape="long" rot="R90"/>
<pad name="S" x="0" y="0" drill="0.8128" shape="long" rot="R90"/>
<text x="-3.175" y="2.413" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-3.81" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="2.032" y="0.508" size="1.27" layer="51" ratio="10">1</text>
<text x="-2.032" y="0.508" size="1.27" layer="51" ratio="10">3</text>
</package>
<package name="SP19L">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;</description>
<wire x1="-10.16" y1="-2.413" x2="9.525" y2="-2.413" width="0.1524" layer="21"/>
<wire x1="9.525" y1="-2.413" x2="9.525" y2="2.667" width="0.1524" layer="21"/>
<wire x1="9.525" y1="2.667" x2="-10.16" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-10.16" y1="2.667" x2="-10.16" y2="-2.413" width="0.1524" layer="21"/>
<wire x1="5.588" y1="1.27" x2="5.207" y2="1.27" width="0.1524" layer="21"/>
<wire x1="5.588" y1="1.27" x2="5.461" y2="1.143" width="0.1524" layer="21"/>
<wire x1="5.588" y1="1.27" x2="5.461" y2="1.397" width="0.1524" layer="21"/>
<wire x1="5.334" y1="1.016" x2="5.334" y2="1.524" width="0.1524" layer="21"/>
<wire x1="5.334" y1="1.016" x2="5.207" y2="0.889" width="0.1524" layer="21"/>
<wire x1="5.334" y1="1.524" x2="5.207" y2="1.651" width="0.1524" layer="21"/>
<wire x1="5.461" y1="1.143" x2="5.461" y2="1.397" width="0.1524" layer="21"/>
<wire x1="5.461" y1="1.143" x2="5.334" y2="1.016" width="0.1524" layer="21"/>
<wire x1="5.461" y1="1.397" x2="5.334" y2="1.524" width="0.1524" layer="21"/>
<wire x1="5.207" y1="1.27" x2="5.207" y2="1.651" width="0.1524" layer="21"/>
<wire x1="5.207" y1="0.889" x2="5.207" y2="1.27" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0.762" x2="5.207" y2="0.889" width="0.1524" layer="21"/>
<wire x1="5.207" y1="1.651" x2="5.08" y2="1.778" width="0.1524" layer="21"/>
<wire x1="5.08" y1="1.778" x2="5.08" y2="0.762" width="0.1524" layer="21"/>
<wire x1="3.175" y1="1.27" x2="5.207" y2="1.27" width="0.1524" layer="21"/>
<pad name="A" x="5.715" y="-1.27" drill="1.016" shape="long"/>
<pad name="E" x="-6.985" y="-1.27" drill="1.016" shape="long"/>
<pad name="S" x="-1.905" y="1.27" drill="1.016" shape="long"/>
<text x="-12.573" y="-2.413" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="-4.445" y="-1.778" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="6.985" y="-1.905" size="1.27" layer="21" ratio="10">1</text>
<text x="-9.525" y="-1.905" size="1.27" layer="21" ratio="10">3</text>
<text x="-4.572" y="0.635" size="1.27" layer="21" ratio="10">2</text>
<text x="4.953" y="0.635" size="1.27" layer="21" ratio="10"> 3 </text>
<text x="0.762" y="0.635" size="1.27" layer="21" ratio="10"> 1 </text>
<rectangle x1="-12.065" y1="-1.27" x2="-10.16" y2="-0.381" layer="21"/>
<rectangle x1="-12.065" y1="0.381" x2="-10.16" y2="1.27" layer="21"/>
<rectangle x1="-11.557" y1="-0.381" x2="-10.16" y2="0.381" layer="21"/>
</package>
<package name="CA6H">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;&lt;p&gt;
distributor Schukat</description>
<wire x1="3.302" y1="1.27" x2="3.302" y2="0.127" width="0.1524" layer="51"/>
<wire x1="1.143" y1="0" x2="-1.143" y2="0" width="0.1524" layer="21"/>
<wire x1="-1.143" y1="0" x2="-3.175" y2="0" width="0.1524" layer="51"/>
<wire x1="-2.032" y1="3.175" x2="-2.032" y2="3.429" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="3.175" x2="-3.175" y2="3.175" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="3.556" x2="-2.032" y2="3.429" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="3.556" x2="1.016" y2="3.556" width="0.1524" layer="51"/>
<wire x1="2.032" y1="3.429" x2="1.905" y2="3.556" width="0.1524" layer="21"/>
<wire x1="2.032" y1="3.429" x2="2.032" y2="3.175" width="0.1524" layer="21"/>
<wire x1="1.397" y1="3.175" x2="-1.397" y2="3.175" width="0.1524" layer="51"/>
<wire x1="1.143" y1="3.429" x2="-1.143" y2="3.429" width="0.1524" layer="51"/>
<wire x1="3.302" y1="0.127" x2="3.175" y2="0" width="0.1524" layer="51"/>
<wire x1="3.302" y1="3.048" x2="3.175" y2="3.175" width="0.1524" layer="21"/>
<wire x1="3.175" y1="3.175" x2="2.032" y2="3.175" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="3.175" x2="-3.302" y2="3.048" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="0" x2="-3.302" y2="0.127" width="0.1524" layer="51"/>
<wire x1="-3.302" y1="0.127" x2="-3.302" y2="1.27" width="0.1524" layer="51"/>
<wire x1="3.175" y1="0" x2="1.143" y2="0" width="0.1524" layer="51"/>
<wire x1="3.302" y1="1.27" x2="3.302" y2="3.048" width="0.1524" layer="21"/>
<wire x1="-3.302" y1="1.27" x2="-3.302" y2="3.048" width="0.1524" layer="21"/>
<wire x1="1.397" y1="3.175" x2="2.032" y2="3.175" width="0.1524" layer="21"/>
<wire x1="1.143" y1="3.429" x2="2.032" y2="3.429" width="0.1524" layer="21"/>
<wire x1="1.016" y1="3.556" x2="1.905" y2="3.556" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="3.556" x2="-1.016" y2="3.556" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="3.429" x2="-1.143" y2="3.429" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="3.175" x2="-1.397" y2="3.175" width="0.1524" layer="21"/>
<pad name="A" x="-2.54" y="0" drill="1.016" shape="long"/>
<pad name="S" x="0" y="2.54" drill="1.016" shape="long"/>
<pad name="E" x="2.54" y="0" drill="1.016" shape="long"/>
<text x="-2.54" y="4.064" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-2.794" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="CA6V">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;&lt;p&gt;
distributor Schukat</description>
<wire x1="-0.254" y1="0.254" x2="-0.254" y2="0.889" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="0.889" x2="0.254" y2="0.889" width="0.1524" layer="21"/>
<wire x1="0.254" y1="0.889" x2="0.254" y2="0.254" width="0.1524" layer="21"/>
<wire x1="0.254" y1="0.254" x2="0.889" y2="0.254" width="0.1524" layer="21"/>
<wire x1="0.889" y1="0.254" x2="0.889" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="0.889" y1="-0.254" x2="0.254" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="0.254" y1="-0.254" x2="0.254" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="0.254" y1="-0.889" x2="-0.254" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="-0.889" x2="-0.254" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="-0.254" x2="-0.889" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="-0.889" y1="-0.254" x2="-0.889" y2="0.254" width="0.1524" layer="21"/>
<wire x1="-0.889" y1="0.254" x2="-0.254" y2="0.254" width="0.1524" layer="21"/>
<wire x1="0.889" y1="3.81" x2="-0.889" y2="3.81" width="0.1524" layer="51"/>
<wire x1="3.429" y1="3.81" x2="0.889" y2="3.81" width="0.1524" layer="21"/>
<wire x1="-0.889" y1="-0.889" x2="-1.397" y2="-1.397" width="0.1524" layer="21"/>
<wire x1="0.889" y1="-0.889" x2="1.397" y2="-1.397" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="0" x2="-1.397" y2="0" width="0.1524" layer="21"/>
<wire x1="1.397" y1="0" x2="1.905" y2="0" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="1.016" x2="-1.27" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.016" y1="1.016" x2="1.27" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0" y1="1.397" x2="0" y2="1.905" width="0.1524" layer="51"/>
<wire x1="3.429" y1="-3.81" x2="1.651" y2="-3.81" width="0.1524" layer="51"/>
<wire x1="1.651" y1="-3.81" x2="-1.651" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="-1.651" y1="-3.81" x2="-3.429" y2="-3.81" width="0.1524" layer="51"/>
<wire x1="3.429" y1="-3.81" x2="3.81" y2="-3.429" width="0.1524" layer="21" curve="90"/>
<wire x1="3.429" y1="3.81" x2="3.81" y2="3.429" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.81" y1="3.429" x2="-3.429" y2="3.81" width="0.1524" layer="21" curve="-90"/>
<wire x1="-3.81" y1="-3.429" x2="-3.429" y2="-3.81" width="0.1524" layer="21" curve="90"/>
<wire x1="3.81" y1="-1.524" x2="3.81" y2="-3.429" width="0.1524" layer="51"/>
<wire x1="-3.429" y1="3.81" x2="-0.889" y2="3.81" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-3.429" x2="-3.81" y2="-1.524" width="0.1524" layer="51"/>
<wire x1="3.81" y1="-1.524" x2="3.81" y2="3.429" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="3.429" x2="-3.81" y2="-1.524" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="2.032" width="0.1524" layer="51"/>
<circle x="0" y="0" radius="1.27" width="0.1524" layer="51"/>
<pad name="S" x="0" y="2.54" drill="1.016" shape="long"/>
<pad name="A" x="-2.54" y="-2.54" drill="1.016" shape="long" rot="R90"/>
<pad name="E" x="2.54" y="-2.54" drill="1.016" shape="long" rot="R90"/>
<text x="-2.54" y="4.191" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.81" y="-5.461" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="0.508" y1="-3.048" x2="3.683" y2="-2.032" layer="51"/>
<rectangle x1="2.159" y1="-2.667" x2="3.683" y2="0" layer="51"/>
<rectangle x1="-3.683" y1="-2.667" x2="-2.159" y2="0" layer="51"/>
<rectangle x1="-3.683" y1="-3.048" x2="-0.508" y2="-2.032" layer="51"/>
<rectangle x1="1.905" y1="-3.81" x2="3.175" y2="-3.048" layer="51"/>
<rectangle x1="-3.175" y1="-3.81" x2="-1.905" y2="-3.048" layer="51"/>
</package>
<package name="CA9H">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;&lt;p&gt;
distributor Schukat</description>
<wire x1="4.953" y1="4.572" x2="4.953" y2="0.127" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-0.381" x2="1.016" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="4.064" y1="0" x2="2.54" y2="0" width="0.1524" layer="51"/>
<wire x1="1.016" y1="0" x2="-1.016" y2="0" width="0.1524" layer="21"/>
<wire x1="-4.064" y1="0" x2="-4.826" y2="0" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="0" x2="-2.54" y2="0" width="0.1524" layer="51"/>
<wire x1="1.016" y1="-0.381" x2="-1.016" y2="-0.381" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="-0.381" x2="-2.413" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="2.413" y1="-0.381" x2="2.54" y2="-0.254" width="0.1524" layer="51"/>
<wire x1="2.54" y1="-0.254" x2="2.54" y2="0" width="0.1524" layer="51"/>
<wire x1="2.54" y1="0" x2="1.016" y2="0" width="0.1524" layer="51"/>
<wire x1="-2.413" y1="-0.381" x2="-2.54" y2="-0.254" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="-0.254" x2="-2.54" y2="0" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="0" x2="-4.064" y2="0" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="-0.254" x2="-1.016" y2="-0.254" width="0.1524" layer="51"/>
<wire x1="-1.016" y1="-0.254" x2="1.016" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="1.016" y1="-0.254" x2="2.54" y2="-0.254" width="0.1524" layer="51"/>
<wire x1="-3.683" y1="4.699" x2="-3.683" y2="4.953" width="0.1524" layer="21"/>
<wire x1="-3.683" y1="4.699" x2="-4.826" y2="4.699" width="0.1524" layer="21"/>
<wire x1="-3.556" y1="5.08" x2="-3.683" y2="4.953" width="0.1524" layer="21"/>
<wire x1="-3.556" y1="5.08" x2="3.556" y2="5.08" width="0.1524" layer="21"/>
<wire x1="3.683" y1="4.953" x2="3.556" y2="5.08" width="0.1524" layer="21"/>
<wire x1="3.683" y1="4.953" x2="3.683" y2="4.699" width="0.1524" layer="21"/>
<wire x1="3.683" y1="4.699" x2="-3.683" y2="4.699" width="0.1524" layer="21"/>
<wire x1="3.683" y1="4.953" x2="-3.683" y2="4.953" width="0.1524" layer="21"/>
<wire x1="4.953" y1="0.127" x2="4.826" y2="0" width="0.1524" layer="21"/>
<wire x1="4.826" y1="0" x2="4.064" y2="0" width="0.1524" layer="21"/>
<wire x1="4.953" y1="4.572" x2="4.826" y2="4.699" width="0.1524" layer="21"/>
<wire x1="4.826" y1="4.699" x2="3.683" y2="4.699" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="4.699" x2="-4.953" y2="4.572" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="0" x2="-4.953" y2="0.127" width="0.1524" layer="21"/>
<wire x1="-4.953" y1="0.127" x2="-4.953" y2="4.572" width="0.1524" layer="21"/>
<pad name="A" x="-2.54" y="0" drill="1.3208" shape="octagon"/>
<pad name="S" x="0" y="2.54" drill="1.3208" shape="octagon"/>
<pad name="E" x="2.54" y="0" drill="1.3208" shape="octagon"/>
<text x="-2.54" y="5.588" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.826" y="-3.175" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="CA9V">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;&lt;p&gt;
distributor Schukat</description>
<wire x1="-0.381" y1="0.381" x2="-0.381" y2="1.651" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="1.651" x2="0.381" y2="1.651" width="0.1524" layer="21"/>
<wire x1="0.381" y1="1.651" x2="0.381" y2="0.381" width="0.1524" layer="21"/>
<wire x1="0.381" y1="0.381" x2="1.016" y2="-0.127" width="0.1524" layer="21"/>
<wire x1="1.016" y1="-0.127" x2="1.016" y2="-0.381" width="0.1524" layer="21"/>
<wire x1="1.016" y1="-0.381" x2="0.381" y2="-0.381" width="0.1524" layer="21"/>
<wire x1="0.381" y1="-0.381" x2="0.381" y2="-1.651" width="0.1524" layer="21"/>
<wire x1="0.381" y1="-1.651" x2="-0.381" y2="-1.651" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="-1.651" x2="-0.381" y2="-0.381" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="-0.381" x2="-1.016" y2="-0.381" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="-0.381" x2="-1.016" y2="-0.127" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="-0.127" x2="-0.381" y2="0.381" width="0.1524" layer="21"/>
<wire x1="1.524" y1="5.08" x2="-1.524" y2="5.08" width="0.1524" layer="51"/>
<wire x1="4.572" y1="5.08" x2="1.524" y2="5.08" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="-1.524" x2="-2.032" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="1.524" y1="-1.524" x2="2.032" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="-2.921" y1="0" x2="-2.413" y2="0" width="0.1524" layer="21"/>
<wire x1="2.413" y1="0" x2="2.921" y2="0" width="0.1524" layer="21"/>
<wire x1="-1.778" y1="1.778" x2="-2.032" y2="2.032" width="0.1524" layer="21"/>
<wire x1="1.778" y1="1.778" x2="2.032" y2="2.032" width="0.1524" layer="21"/>
<wire x1="0" y1="2.413" x2="0" y2="2.921" width="0.1524" layer="21"/>
<wire x1="3.937" y1="-5.08" x2="1.143" y2="-5.08" width="0.1524" layer="51"/>
<wire x1="1.143" y1="-5.08" x2="-1.143" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="-1.143" y1="-5.08" x2="-3.937" y2="-5.08" width="0.1524" layer="51"/>
<wire x1="-3.937" y1="-5.08" x2="-4.572" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="4.572" y1="-5.08" x2="4.953" y2="-4.699" width="0.1524" layer="21" curve="90"/>
<wire x1="4.572" y1="5.08" x2="4.953" y2="4.699" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.953" y1="4.699" x2="-4.572" y2="5.08" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.953" y1="-4.699" x2="-4.572" y2="-5.08" width="0.1524" layer="21" curve="90"/>
<wire x1="4.572" y1="-5.08" x2="3.937" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="4.953" y1="4.699" x2="4.953" y2="-4.699" width="0.1524" layer="21"/>
<wire x1="-4.572" y1="5.08" x2="-1.524" y2="5.08" width="0.1524" layer="21"/>
<wire x1="-4.953" y1="-4.699" x2="-4.953" y2="4.699" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="2.032" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="2.921" width="0.1524" layer="21"/>
<pad name="S" x="0" y="5.08" drill="1.3208" shape="long"/>
<pad name="A" x="-2.54" y="-5.08" drill="1.3208" shape="long" rot="R90"/>
<pad name="E" x="2.54" y="-5.08" drill="1.3208" shape="long" rot="R90"/>
<text x="-5.461" y="-5.08" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="6.731" y="-5.08" size="1.27" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<rectangle x1="-0.508" y1="5.08" x2="0.508" y2="5.461" layer="51"/>
<rectangle x1="2.032" y1="-5.461" x2="3.048" y2="-3.683" layer="51"/>
<rectangle x1="1.397" y1="-3.683" x2="4.572" y2="-2.667" layer="21"/>
<rectangle x1="3.048" y1="-2.667" x2="4.572" y2="0" layer="21"/>
<rectangle x1="-4.572" y1="-2.667" x2="-3.048" y2="0" layer="21"/>
<rectangle x1="-4.572" y1="-3.683" x2="-1.397" y2="-2.667" layer="21"/>
<rectangle x1="-3.048" y1="-5.461" x2="-2.032" y2="-3.683" layer="51"/>
</package>
<package name="CA14V">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;&lt;p&gt;
distributor Schukat</description>
<wire x1="-0.381" y1="1.651" x2="0.381" y2="1.651" width="0.1524" layer="21"/>
<wire x1="0.381" y1="1.651" x2="1.016" y2="1.143" width="0.1524" layer="21"/>
<wire x1="1.016" y1="1.143" x2="1.016" y2="1.016" width="0.1524" layer="21"/>
<wire x1="1.016" y1="1.016" x2="0.381" y2="1.016" width="0.1524" layer="21"/>
<wire x1="0.381" y1="1.016" x2="0.381" y2="-1.651" width="0.1524" layer="21"/>
<wire x1="0.381" y1="-1.651" x2="-0.381" y2="-1.651" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="-1.651" x2="-0.381" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="1.016" x2="-1.016" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="1.016" x2="-1.016" y2="1.143" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="1.143" x2="-0.381" y2="1.651" width="0.1524" layer="21"/>
<wire x1="6.731" y1="7.112" x2="-6.731" y2="7.112" width="0.1524" layer="21"/>
<wire x1="-2.159" y1="-2.159" x2="-2.667" y2="-2.667" width="0.1524" layer="21"/>
<wire x1="2.159" y1="-2.159" x2="2.667" y2="-2.667" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="0" x2="-2.921" y2="0" width="0.1524" layer="21"/>
<wire x1="3.048" y1="0" x2="3.556" y2="0" width="0.1524" layer="21"/>
<wire x1="-2.159" y1="2.159" x2="-2.54" y2="2.54" width="0.1524" layer="21"/>
<wire x1="2.159" y1="2.159" x2="2.54" y2="2.54" width="0.1524" layer="21"/>
<wire x1="0" y1="3.048" x2="0" y2="3.556" width="0.1524" layer="21"/>
<wire x1="6.477" y1="-7.112" x2="5.842" y2="-7.112" width="0.1524" layer="51"/>
<wire x1="3.683" y1="-7.112" x2="3.048" y2="-7.112" width="0.1524" layer="21"/>
<wire x1="-3.683" y1="-7.112" x2="-6.477" y2="-7.112" width="0.1524" layer="51"/>
<wire x1="-6.477" y1="-7.112" x2="-6.731" y2="-7.112" width="0.1524" layer="21"/>
<wire x1="6.731" y1="-7.112" x2="7.112" y2="-6.731" width="0.1524" layer="21" curve="90"/>
<wire x1="6.731" y1="7.112" x2="7.112" y2="6.731" width="0.1524" layer="21" curve="-90"/>
<wire x1="-7.112" y1="6.731" x2="-6.731" y2="7.112" width="0.1524" layer="21" curve="-90"/>
<wire x1="-7.112" y1="-6.731" x2="-6.731" y2="-7.112" width="0.1524" layer="21" curve="90"/>
<wire x1="6.731" y1="-7.112" x2="6.477" y2="-7.112" width="0.1524" layer="21"/>
<wire x1="7.112" y1="6.731" x2="7.112" y2="-4.953" width="0.1524" layer="21"/>
<wire x1="-7.112" y1="-6.731" x2="-7.112" y2="-4.953" width="0.1524" layer="21"/>
<wire x1="7.112" y1="-4.953" x2="5.842" y2="-4.953" width="0.1524" layer="21"/>
<wire x1="7.112" y1="-4.953" x2="7.112" y2="-6.731" width="0.1524" layer="21"/>
<wire x1="5.842" y1="-6.35" x2="5.842" y2="-4.953" width="0.1524" layer="21"/>
<wire x1="5.842" y1="-6.35" x2="5.842" y2="-7.112" width="0.1524" layer="51"/>
<wire x1="5.842" y1="-7.112" x2="4.318" y2="-7.112" width="0.1524" layer="51"/>
<wire x1="4.318" y1="-6.35" x2="4.318" y2="-7.112" width="0.1524" layer="51"/>
<wire x1="4.318" y1="-7.112" x2="3.683" y2="-7.112" width="0.1524" layer="51"/>
<wire x1="4.318" y1="-6.35" x2="4.318" y2="-4.953" width="0.1524" layer="21"/>
<wire x1="4.318" y1="-4.953" x2="3.048" y2="-4.953" width="0.1524" layer="21"/>
<wire x1="3.048" y1="-7.112" x2="3.048" y2="-4.953" width="0.1524" layer="21"/>
<wire x1="3.048" y1="-7.112" x2="-3.048" y2="-7.112" width="0.1524" layer="21"/>
<wire x1="-5.842" y1="-4.953" x2="-7.112" y2="-4.953" width="0.1524" layer="21"/>
<wire x1="-7.112" y1="-4.953" x2="-7.112" y2="6.731" width="0.1524" layer="21"/>
<wire x1="-5.842" y1="-6.223" x2="-5.842" y2="-6.985" width="0.1524" layer="51"/>
<wire x1="-5.842" y1="-6.35" x2="-5.842" y2="-4.953" width="0.1524" layer="21"/>
<wire x1="-4.318" y1="-6.223" x2="-4.318" y2="-6.985" width="0.1524" layer="51"/>
<wire x1="-4.318" y1="-6.223" x2="-4.318" y2="-4.953" width="0.1524" layer="21"/>
<wire x1="-3.048" y1="-4.953" x2="-4.318" y2="-4.953" width="0.1524" layer="21"/>
<wire x1="-3.048" y1="-7.112" x2="-3.048" y2="-4.953" width="0.1524" layer="21"/>
<wire x1="-3.048" y1="-7.112" x2="-3.683" y2="-7.112" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="2.032" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="2.921" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="3.937" width="0.1524" layer="51"/>
<pad name="S" x="0" y="5.08" drill="1.3208" shape="octagon"/>
<pad name="A" x="-5.08" y="-7.62" drill="1.3208" shape="octagon"/>
<pad name="E" x="5.08" y="-7.62" drill="1.3208" shape="octagon"/>
<text x="-6.985" y="7.62" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.143" y="7.62" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="4.318" y1="-7.112" x2="5.842" y2="-6.223" layer="51"/>
<rectangle x1="4.318" y1="-6.223" x2="5.842" y2="-4.953" layer="21"/>
<rectangle x1="1.524" y1="-4.953" x2="6.731" y2="-3.683" layer="21"/>
<rectangle x1="4.064" y1="-3.683" x2="6.731" y2="0" layer="21"/>
<rectangle x1="-5.842" y1="-7.112" x2="-4.318" y2="-6.223" layer="51"/>
<rectangle x1="-5.842" y1="-6.223" x2="-4.318" y2="-4.953" layer="21"/>
<rectangle x1="-6.731" y1="-4.953" x2="-1.524" y2="-3.683" layer="21"/>
<rectangle x1="-6.731" y1="-3.683" x2="-4.064" y2="0" layer="21"/>
<rectangle x1="4.318" y1="-7.874" x2="5.842" y2="-7.112" layer="51"/>
<rectangle x1="-5.842" y1="-7.874" x2="-4.318" y2="-7.112" layer="51"/>
</package>
<package name="CA14H">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;&lt;p&gt;
distributor Schukat</description>
<wire x1="7.112" y1="5.588" x2="7.112" y2="0.127" width="0.1524" layer="21"/>
<wire x1="6.477" y1="0" x2="3.683" y2="0" width="0.1524" layer="51"/>
<wire x1="-6.477" y1="0" x2="-6.985" y2="0" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0" x2="-2.54" y2="0" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-0.381" x2="-2.413" y2="-0.381" width="0.1524" layer="21"/>
<wire x1="2.413" y1="-0.381" x2="2.54" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-0.254" x2="2.54" y2="0" width="0.1524" layer="21"/>
<wire x1="-2.413" y1="-0.381" x2="-2.54" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-0.254" x2="-2.54" y2="0" width="0.1524" layer="21"/>
<wire x1="-3.683" y1="0" x2="-6.477" y2="0" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="-0.254" x2="2.54" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="-3.683" y1="5.715" x2="-3.683" y2="5.969" width="0.1524" layer="21"/>
<wire x1="-3.683" y1="5.715" x2="-6.985" y2="5.715" width="0.1524" layer="21"/>
<wire x1="-3.556" y1="6.096" x2="-3.683" y2="5.969" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="6.096" x2="1.016" y2="6.096" width="0.1524" layer="51"/>
<wire x1="3.683" y1="5.969" x2="3.556" y2="6.096" width="0.1524" layer="21"/>
<wire x1="3.683" y1="5.969" x2="3.683" y2="5.715" width="0.1524" layer="21"/>
<wire x1="1.397" y1="5.715" x2="-1.397" y2="5.715" width="0.1524" layer="51"/>
<wire x1="1.143" y1="5.969" x2="-1.143" y2="5.969" width="0.1524" layer="51"/>
<wire x1="7.112" y1="0.127" x2="6.985" y2="0" width="0.1524" layer="21"/>
<wire x1="6.985" y1="0" x2="6.477" y2="0" width="0.1524" layer="21"/>
<wire x1="7.112" y1="5.588" x2="6.985" y2="5.715" width="0.1524" layer="21"/>
<wire x1="6.985" y1="5.715" x2="3.683" y2="5.715" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="5.715" x2="-7.112" y2="5.588" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="0" x2="-7.112" y2="0.127" width="0.1524" layer="21"/>
<wire x1="-7.112" y1="0.127" x2="-7.112" y2="5.588" width="0.1524" layer="21"/>
<wire x1="2.54" y1="0" x2="3.683" y2="0" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="0" x2="-3.683" y2="0" width="0.1524" layer="21"/>
<wire x1="1.397" y1="5.715" x2="3.683" y2="5.715" width="0.1524" layer="21"/>
<wire x1="3.683" y1="5.969" x2="1.143" y2="5.969" width="0.1524" layer="21"/>
<wire x1="1.016" y1="6.096" x2="3.556" y2="6.096" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="6.096" x2="-3.556" y2="6.096" width="0.1524" layer="21"/>
<wire x1="-3.683" y1="5.969" x2="-1.143" y2="5.969" width="0.1524" layer="21"/>
<wire x1="-1.397" y1="5.715" x2="-3.683" y2="5.715" width="0.1524" layer="21"/>
<pad name="A" x="-5.08" y="0" drill="1.3208" shape="long"/>
<pad name="S" x="0" y="5.08" drill="1.3208" shape="long"/>
<pad name="E" x="5.08" y="0" drill="1.3208" shape="long"/>
<text x="-2.54" y="6.604" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.191" y="1.905" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="CT6">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;&lt;p&gt;
Copal</description>
<wire x1="3.302" y1="3.556" x2="-3.302" y2="3.556" width="0.1524" layer="21"/>
<wire x1="-3.302" y1="-3.556" x2="3.302" y2="-3.556" width="0.1524" layer="21"/>
<wire x1="3.302" y1="3.556" x2="3.556" y2="3.302" width="0.1524" layer="21"/>
<wire x1="3.302" y1="-3.556" x2="3.556" y2="-3.302" width="0.1524" layer="21"/>
<wire x1="3.556" y1="-3.302" x2="3.556" y2="3.302" width="0.1524" layer="21"/>
<wire x1="-3.302" y1="-3.556" x2="-3.556" y2="-3.302" width="0.1524" layer="21"/>
<wire x1="-3.302" y1="3.556" x2="-3.556" y2="3.302" width="0.1524" layer="21"/>
<wire x1="-3.556" y1="3.302" x2="-3.556" y2="-3.302" width="0.1524" layer="21"/>
<wire x1="0.762" y1="-0.381" x2="1.524" y2="-0.381" width="0.1524" layer="21"/>
<wire x1="1.524" y1="-0.381" x2="1.524" y2="0.381" width="0.1524" layer="21"/>
<wire x1="1.524" y1="0.381" x2="0.762" y2="0.381" width="0.1524" layer="21"/>
<wire x1="0.762" y1="0.381" x2="0.381" y2="0.762" width="0.1524" layer="21"/>
<wire x1="0.381" y1="0.762" x2="0.381" y2="1.016" width="0.1524" layer="21"/>
<wire x1="0.381" y1="1.016" x2="0.635" y2="1.016" width="0.1524" layer="21"/>
<wire x1="0.635" y1="1.016" x2="0" y2="1.651" width="0.1524" layer="21"/>
<wire x1="0" y1="1.651" x2="-0.635" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="1.016" x2="-0.381" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="1.016" x2="-0.381" y2="0.762" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="0.762" x2="-0.762" y2="0.381" width="0.1524" layer="21"/>
<wire x1="-0.762" y1="0.381" x2="-1.524" y2="0.381" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="0.381" x2="-1.524" y2="-0.381" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="-0.381" x2="-0.762" y2="-0.381" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="-0.762" x2="-0.762" y2="-0.381" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="-0.762" x2="-0.381" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="-1.524" x2="0.381" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="0.381" y1="-1.524" x2="0.381" y2="-0.762" width="0.1524" layer="21"/>
<wire x1="0.381" y1="-0.762" x2="0.762" y2="-0.381" width="0.1524" layer="21"/>
<wire x1="-1.651" y1="-1.778" x2="1.651" y2="-1.778" width="0.1524" layer="51" curve="-272.584334"/>
<wire x1="-1.778" y1="-1.778" x2="-2.032" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="1.778" y1="-1.778" x2="2.032" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="2.5146" y1="0" x2="2.8956" y2="0" width="0.1524" layer="51"/>
<wire x1="1.778" y1="1.651" x2="2.032" y2="1.905" width="0.1524" layer="21"/>
<wire x1="0" y1="2.4638" x2="0" y2="2.8448" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.651" x2="-2.159" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-2.5146" y1="0" x2="-2.8956" y2="0" width="0.1524" layer="51"/>
<circle x="0" y="0" radius="2.032" width="0.1524" layer="51"/>
<pad name="A" x="2.5146" y="0" drill="0.8128" shape="octagon"/>
<pad name="E" x="-2.5146" y="0" drill="0.8128" shape="octagon"/>
<pad name="S" x="0" y="-2.54" drill="0.8128" shape="octagon"/>
<text x="-3.302" y="3.937" size="0.6096" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.2766" y="-4.572" size="0.6096" layer="27" ratio="10">&gt;VALUE</text>
<text x="-3.048" y="-3.175" size="0.9906" layer="21" ratio="12">3</text>
<text x="2.159" y="-3.175" size="0.9906" layer="21" ratio="12">1</text>
</package>
<package name="ECP10P">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;</description>
<wire x1="-4.953" y1="-2.54" x2="4.953" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="4.191" y1="2.54" x2="4.191" y2="3.302" width="0.1524" layer="21"/>
<wire x1="4.953" y1="3.302" x2="4.191" y2="3.302" width="0.1524" layer="21"/>
<wire x1="-4.191" y1="2.54" x2="-4.191" y2="3.302" width="0.1524" layer="21"/>
<wire x1="-4.953" y1="3.302" x2="-4.191" y2="3.302" width="0.1524" layer="21"/>
<wire x1="-4.953" y1="-2.54" x2="-4.953" y2="3.302" width="0.1524" layer="21"/>
<wire x1="4.953" y1="3.302" x2="4.953" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="4.191" y1="2.54" x2="1.524" y2="2.54" width="0.1524" layer="21"/>
<wire x1="1.524" y1="2.54" x2="-1.524" y2="2.54" width="0.1524" layer="51"/>
<wire x1="-1.524" y1="2.54" x2="-4.191" y2="2.54" width="0.1524" layer="21"/>
<pad name="A" x="-2.54" y="0" drill="1.3208" shape="octagon"/>
<pad name="S" x="0" y="2.54" drill="1.3208" shape="octagon"/>
<pad name="E" x="2.54" y="0" drill="1.3208" shape="octagon"/>
<text x="-4.826" y="-4.191" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="0.762" y="-4.191" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-0.508" y1="2.54" x2="0.508" y2="2.794" layer="51"/>
</package>
<package name="ECP10S">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;</description>
<wire x1="-0.381" y1="0.381" x2="-0.381" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="1.016" x2="0.381" y2="1.016" width="0.1524" layer="21"/>
<wire x1="0.381" y1="1.016" x2="0.381" y2="0.381" width="0.1524" layer="21"/>
<wire x1="0.381" y1="0.381" x2="1.016" y2="0.381" width="0.1524" layer="21"/>
<wire x1="1.016" y1="0.381" x2="1.016" y2="-0.381" width="0.1524" layer="21"/>
<wire x1="1.016" y1="-0.381" x2="0.381" y2="-0.381" width="0.1524" layer="21"/>
<wire x1="0.381" y1="-0.381" x2="0.381" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="0.381" y1="-1.016" x2="-0.381" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="-1.016" x2="-0.381" y2="-0.381" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="-0.381" x2="-1.016" y2="-0.381" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="-0.381" x2="-1.016" y2="0.381" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="0.381" x2="-0.381" y2="0.381" width="0.1524" layer="21"/>
<wire x1="-4.953" y1="5.08" x2="-4.953" y2="4.191" width="0.1524" layer="21"/>
<wire x1="4.953" y1="5.08" x2="4.064" y2="5.08" width="0.1524" layer="21"/>
<wire x1="1.524" y1="5.08" x2="-1.524" y2="5.08" width="0.1524" layer="51"/>
<wire x1="-1.524" y1="5.08" x2="-4.064" y2="5.08" width="0.1524" layer="21"/>
<wire x1="-4.064" y1="5.08" x2="-4.064" y2="4.191" width="0.1524" layer="21"/>
<wire x1="-4.064" y1="5.08" x2="-4.953" y2="5.08" width="0.1524" layer="21"/>
<wire x1="-4.953" y1="4.191" x2="-4.064" y2="4.191" width="0.1524" layer="21"/>
<wire x1="-4.953" y1="4.191" x2="-4.953" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="4.064" y1="4.191" x2="4.953" y2="4.191" width="0.1524" layer="21"/>
<wire x1="4.953" y1="4.191" x2="4.953" y2="5.08" width="0.1524" layer="21"/>
<wire x1="4.064" y1="5.08" x2="4.064" y2="4.191" width="0.1524" layer="21"/>
<wire x1="4.064" y1="5.08" x2="1.524" y2="5.08" width="0.1524" layer="21"/>
<wire x1="4.064" y1="-6.096" x2="4.953" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="4.953" y1="-6.096" x2="4.953" y2="4.191" width="0.1524" layer="21"/>
<wire x1="4.064" y1="-6.096" x2="4.064" y2="-6.985" width="0.1524" layer="21"/>
<wire x1="4.064" y1="-6.985" x2="-4.064" y2="-6.985" width="0.1524" layer="21"/>
<wire x1="-4.064" y1="-6.096" x2="-4.064" y2="-6.985" width="0.1524" layer="21"/>
<wire x1="-4.953" y1="-6.096" x2="-4.064" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="-4.064" y1="-6.985" x2="-4.445" y2="-7.747" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-7.747" x2="-4.953" y2="-7.747" width="0.1524" layer="21"/>
<wire x1="-4.953" y1="-7.747" x2="-4.953" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="4.064" y1="-6.985" x2="4.445" y2="-7.747" width="0.1524" layer="21"/>
<wire x1="4.953" y1="-7.747" x2="4.445" y2="-7.747" width="0.1524" layer="21"/>
<wire x1="4.953" y1="-7.747" x2="4.953" y2="-6.096" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="2.032" width="0.1524" layer="21"/>
<circle x="-2.794" y="-4.826" radius="1.27" width="0.1524" layer="51"/>
<circle x="2.794" y="-4.826" radius="1.27" width="0.1524" layer="51"/>
<circle x="0" y="1.524" radius="0.127" width="0.3048" layer="21"/>
<circle x="0" y="0" radius="2.921" width="0.1524" layer="21"/>
<pad name="S" x="0" y="5.08" drill="1.3208" shape="octagon"/>
<pad name="A" x="-2.54" y="-5.08" drill="1.3208" shape="octagon"/>
<pad name="E" x="2.54" y="-5.08" drill="1.3208" shape="octagon"/>
<text x="-3.302" y="-2.54" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="4.572" y="-3.302" size="1.27" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<rectangle x1="-0.508" y1="5.08" x2="0.508" y2="5.461" layer="51"/>
</package>
<package name="LI10">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;&lt;p&gt;
Piher</description>
<wire x1="3.175" y1="-4.445" x2="3.175" y2="-5.715" width="0.1524" layer="51"/>
<wire x1="-3.175" y1="-5.715" x2="-3.175" y2="-4.445" width="0.1524" layer="51"/>
<wire x1="-2.794" y1="-3.175" x2="-1.905" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="-2.54" x2="-0.635" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-3.175" x2="-0.635" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-4.445" x2="-1.27" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-4.445" x2="-1.27" y2="-5.715" width="0.1524" layer="51"/>
<wire x1="1.27" y1="-5.715" x2="1.27" y2="-4.445" width="0.1524" layer="51"/>
<wire x1="1.27" y1="-4.445" x2="0.635" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-4.445" x2="0.635" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-3.175" x2="1.905" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="1.905" y1="-2.54" x2="2.794" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="0.889" y1="1.397" x2="-0.127" y2="0.381" width="0.1524" layer="21"/>
<wire x1="-0.127" y1="0.381" x2="-0.508" y2="0.762" width="0.1524" layer="21"/>
<wire x1="-0.508" y1="0.762" x2="-0.508" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.508" y1="0" x2="-1.397" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="1.397" y1="0.889" x2="0.381" y2="-0.127" width="0.1524" layer="21"/>
<wire x1="0.381" y1="-0.127" x2="0.762" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="0.762" y1="-0.508" x2="0" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.508" x2="-0.889" y2="-1.397" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-5.715" x2="2.794" y2="-5.715" width="0.1524" layer="51"/>
<wire x1="-3.175" y1="-5.715" x2="-2.794" y2="-5.715" width="0.1524" layer="51"/>
<wire x1="-1.27" y1="-5.715" x2="1.27" y2="-5.715" width="0.1524" layer="21"/>
<wire x1="2.794" y1="-3.175" x2="2.794" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="2.794" y1="-3.683" x2="2.794" y2="-5.715" width="0.1524" layer="51"/>
<wire x1="-2.794" y1="-3.175" x2="-2.794" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="-2.794" y1="-3.683" x2="-2.794" y2="-5.715" width="0.1524" layer="51"/>
<wire x1="2.794" y1="-5.715" x2="1.27" y2="-5.715" width="0.1524" layer="51"/>
<wire x1="-2.794" y1="-5.715" x2="-1.27" y2="-5.715" width="0.1524" layer="51"/>
<wire x1="3.5657" y1="-4.1362" x2="5.461" y2="0" width="0.1524" layer="21" curve="49.236245"/>
<wire x1="-5.461" y1="0" x2="-3.6049" y2="-4.1021" width="0.1524" layer="21" curve="48.691198"/>
<wire x1="3.175" y1="-4.445" x2="3.683" y2="-4.064" width="0.1524" layer="51"/>
<wire x1="-3.175" y1="-4.445" x2="-3.683" y2="-4.064" width="0.1524" layer="51"/>
<wire x1="-5.461" y1="0" x2="-1.448" y2="5.2655" width="0.1524" layer="21" curve="-74.623636"/>
<wire x1="1.4616" y1="5.2618" x2="5.461" y2="0" width="0.1524" layer="21" curve="-74.476215"/>
<wire x1="0" y1="5.461" x2="1.5185" y2="5.2456" width="0.1524" layer="51" curve="-16.144661"/>
<wire x1="-1.4824" y1="5.2559" x2="0" y2="5.461" width="0.1524" layer="51" curve="-15.750767"/>
<circle x="0" y="0" radius="1.8034" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="2.794" width="0.0508" layer="21"/>
<pad name="A" x="-2.54" y="-5.08" drill="1.3208" shape="octagon"/>
<pad name="S" x="0" y="5.08" drill="1.3208" shape="octagon"/>
<pad name="E" x="2.54" y="-5.08" drill="1.3208" shape="octagon"/>
<text x="-1.27" y="-7.62" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.175" y="-2.54" size="1.27" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
</package>
<package name="LI15">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;&lt;p&gt;
Piher</description>
<wire x1="6.35" y1="-6.604" x2="6.35" y2="-7.62" width="0.1524" layer="51"/>
<wire x1="-6.35" y1="-7.62" x2="-6.35" y2="-6.731" width="0.1524" layer="51"/>
<wire x1="-5.969" y1="-4.445" x2="-5.08" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-3.81" x2="-3.175" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-5.08" x2="-3.175" y2="-6.35" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-6.35" x2="-3.556" y2="-6.35" width="0.1524" layer="21"/>
<wire x1="-3.556" y1="-6.35" x2="-3.556" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="3.556" y1="-7.62" x2="3.556" y2="-6.35" width="0.1524" layer="21"/>
<wire x1="3.556" y1="-6.35" x2="3.175" y2="-6.35" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-6.35" x2="3.175" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-5.08" x2="5.08" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-3.81" x2="5.969" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="0.889" y1="1.397" x2="-0.127" y2="0.381" width="0.1524" layer="21"/>
<wire x1="-0.127" y1="0.381" x2="-0.508" y2="0.762" width="0.1524" layer="21"/>
<wire x1="-0.508" y1="0.762" x2="-0.508" y2="0" width="0.1524" layer="21"/>
<wire x1="-0.508" y1="0" x2="-1.397" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="1.397" y1="0.889" x2="0.381" y2="-0.127" width="0.1524" layer="21"/>
<wire x1="0.381" y1="-0.127" x2="0.762" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="0.762" y1="-0.508" x2="0" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.508" x2="-0.889" y2="-1.397" width="0.1524" layer="21"/>
<wire x1="6.35" y1="-7.62" x2="5.969" y2="-7.62" width="0.1524" layer="51"/>
<wire x1="-6.35" y1="-7.62" x2="-5.969" y2="-7.62" width="0.1524" layer="51"/>
<wire x1="-3.556" y1="-7.62" x2="3.556" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="5.969" y1="-4.445" x2="5.969" y2="-6.35" width="0.1524" layer="21"/>
<wire x1="5.969" y1="-6.35" x2="5.969" y2="-7.62" width="0.1524" layer="51"/>
<wire x1="-5.969" y1="-4.445" x2="-5.969" y2="-6.35" width="0.1524" layer="21"/>
<wire x1="-5.969" y1="-6.35" x2="-5.969" y2="-7.62" width="0.1524" layer="51"/>
<wire x1="5.969" y1="-7.62" x2="3.556" y2="-7.62" width="0.1524" layer="51"/>
<wire x1="-5.969" y1="-7.62" x2="-3.556" y2="-7.62" width="0.1524" layer="51"/>
<wire x1="6.35" y1="-6.604" x2="6.35" y2="-4.191" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="-6.731" x2="-6.35" y2="-4.191" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="0" x2="7.62" y2="0" width="0.1524" layer="21" curve="-180"/>
<wire x1="6.3402" y1="-4.2268" x2="7.62" y2="0" width="0.1524" layer="21" curve="33.690004"/>
<wire x1="-7.62" y1="0" x2="-6.3402" y2="-4.2268" width="0.1524" layer="21" curve="33.690004"/>
<circle x="0" y="0" radius="1.8034" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="2.794" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="3.81" width="0.1524" layer="51"/>
<pad name="A" x="-5.08" y="-7.62" drill="1.3208" shape="long"/>
<pad name="S" x="0" y="5.08" drill="1.3208" shape="long"/>
<pad name="E" x="5.08" y="-7.62" drill="1.3208" shape="long"/>
<text x="-2.54" y="-9.398" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.445" y="-3.429" size="1.27" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
</package>
<package name="RJ6">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;&lt;p&gt;
Copal</description>
<wire x1="1.8796" y1="0" x2="2.1336" y2="0" width="0.254" layer="51"/>
<wire x1="0" y1="1.8796" x2="0" y2="2.1336" width="0.254" layer="51"/>
<wire x1="-2.1336" y1="0" x2="-1.8796" y2="0" width="0.254" layer="51"/>
<wire x1="1.3208" y1="1.3208" x2="1.4986" y2="1.4986" width="0.254" layer="21"/>
<wire x1="-1.3208" y1="1.3208" x2="-1.4986" y2="1.4986" width="0.254" layer="21"/>
<wire x1="-1.4986" y1="-1.4986" x2="-1.3208" y2="-1.3208" width="0.254" layer="51"/>
<wire x1="1.4986" y1="-1.4986" x2="1.3208" y2="-1.3208" width="0.254" layer="51"/>
<wire x1="-0.635" y1="-0.635" x2="0.635" y2="0.635" width="0.8128" layer="51"/>
<circle x="0" y="0" radius="1.397" width="0.1524" layer="51"/>
<circle x="0" y="0" radius="3.556" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="1.778" width="0.1524" layer="51"/>
<pad name="A" x="-1.778" y="-0.508" drill="0.8128" shape="octagon"/>
<pad name="S" x="0" y="1.27" drill="0.8128" shape="octagon"/>
<pad name="E" x="1.778" y="-0.508" drill="0.8128" shape="octagon"/>
<text x="0.762" y="-2.921" size="0.9906" layer="21" ratio="12">3</text>
<text x="-1.27" y="-2.921" size="0.9906" layer="21" ratio="12">1</text>
<text x="-2.54" y="3.81" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-5.08" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="RJ6S">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;&lt;p&gt;
Copal</description>
<wire x1="-3.556" y1="-3.683" x2="-3.556" y2="2.921" width="0.1524" layer="21"/>
<wire x1="3.556" y1="2.921" x2="3.556" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="1.524" y1="-2.54" x2="1.397" y2="-2.667" width="0.1524" layer="51"/>
<wire x1="1.524" y1="-2.54" x2="1.397" y2="-2.413" width="0.1524" layer="51"/>
<wire x1="1.27" y1="-2.794" x2="1.27" y2="-2.286" width="0.1524" layer="51"/>
<wire x1="1.27" y1="-2.794" x2="1.143" y2="-2.921" width="0.1524" layer="51"/>
<wire x1="1.27" y1="-2.286" x2="1.143" y2="-2.159" width="0.1524" layer="51"/>
<wire x1="1.397" y1="-2.667" x2="1.397" y2="-2.413" width="0.1524" layer="51"/>
<wire x1="1.397" y1="-2.667" x2="1.27" y2="-2.794" width="0.1524" layer="51"/>
<wire x1="1.397" y1="-2.413" x2="1.27" y2="-2.286" width="0.1524" layer="51"/>
<wire x1="1.524" y1="-2.54" x2="1.143" y2="-2.54" width="0.1524" layer="51"/>
<wire x1="1.143" y1="-2.54" x2="-2.54" y2="-2.54" width="0.1524" layer="51"/>
<wire x1="1.143" y1="-2.54" x2="1.143" y2="-2.159" width="0.1524" layer="51"/>
<wire x1="1.143" y1="-2.921" x2="1.143" y2="-2.54" width="0.1524" layer="51"/>
<wire x1="1.016" y1="-3.048" x2="1.143" y2="-2.921" width="0.1524" layer="51"/>
<wire x1="1.143" y1="-2.159" x2="1.016" y2="-2.032" width="0.1524" layer="51"/>
<wire x1="1.016" y1="-2.032" x2="1.016" y2="-3.048" width="0.1524" layer="51"/>
<wire x1="-3.556" y1="-3.683" x2="3.556" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="3.556" y1="2.921" x2="-3.556" y2="2.921" width="0.1524" layer="21"/>
<pad name="A" x="2.54" y="0" drill="0.8128" shape="long" rot="R90"/>
<pad name="E" x="-2.54" y="0" drill="0.8128" shape="long" rot="R90"/>
<pad name="S" x="0" y="-2.54" drill="0.8128" shape="long" rot="R90"/>
<text x="-2.54" y="3.937" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.4036" y="-5.334" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-3.048" y="1.143" size="1.27" layer="21" ratio="10">3</text>
<text x="2.159" y="1.27" size="1.27" layer="21" ratio="10">1</text>
<text x="1.905" y="-3.175" size="1.27" layer="51" ratio="10">3</text>
<rectangle x1="-1.524" y1="2.921" x2="-0.254" y2="3.556" layer="21"/>
<rectangle x1="0.254" y1="2.921" x2="1.524" y2="3.556" layer="21"/>
<rectangle x1="-0.254" y1="2.921" x2="0.254" y2="3.175" layer="21"/>
</package>
<package name="RJ9W">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;&lt;p&gt;
Copal</description>
<wire x1="-4.572" y1="-2.413" x2="4.572" y2="-2.413" width="0.1524" layer="21"/>
<wire x1="4.572" y1="2.286" x2="4.572" y2="-2.413" width="0.1524" layer="21"/>
<wire x1="4.572" y1="2.286" x2="-4.572" y2="2.286" width="0.1524" layer="21"/>
<wire x1="-4.572" y1="-2.413" x2="-4.572" y2="2.286" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-0.635" x2="2.794" y2="-1.651" width="0.3048" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-1.016" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-0.762" y2="-1.397" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="-0.762" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="-0.889" y1="-1.524" x2="-0.889" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-0.889" y1="-1.524" x2="-1.016" y2="-1.651" width="0.1524" layer="21"/>
<wire x1="-0.889" y1="-1.016" x2="-1.016" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="-0.762" y1="-1.397" x2="-0.762" y2="-1.143" width="0.1524" layer="21"/>
<wire x1="-0.762" y1="-1.397" x2="-0.889" y2="-1.524" width="0.1524" layer="21"/>
<wire x1="-0.762" y1="-1.143" x2="-0.889" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="-1.27" x2="-1.016" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="-1.651" x2="-1.016" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.143" y1="-1.778" x2="-1.016" y2="-1.651" width="0.1524" layer="21"/>
<wire x1="-1.016" y1="-0.889" x2="-1.143" y2="-0.762" width="0.1524" layer="21"/>
<wire x1="-1.143" y1="-0.762" x2="-1.143" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="-3.048" y1="-1.27" x2="-1.016" y2="-1.27" width="0.1524" layer="21"/>
<circle x="3.302" y="-1.143" radius="0.889" width="0.1524" layer="51"/>
<circle x="3.302" y="-1.143" radius="0.635" width="0.0508" layer="21"/>
<pad name="E" x="-2.54" y="0.635" drill="0.8128" shape="long" rot="R90"/>
<pad name="A" x="2.54" y="0.635" drill="0.8128" shape="long" rot="R90"/>
<pad name="S" x="0" y="0.635" drill="0.8128" shape="long" rot="R90"/>
<text x="-4.572" y="2.667" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.572" y="-4.064" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="3.429" y="0.127" size="1.27" layer="51" ratio="10">1</text>
<text x="-4.318" y="0" size="1.27" layer="51" ratio="10">3</text>
<text x="0" y="-1.905" size="1.27" layer="21" ratio="10">3</text>
</package>
<package name="RS3">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;&lt;p&gt;
Copal</description>
<wire x1="4.826" y1="-4.826" x2="4.826" y2="4.8006" width="0.1524" layer="21"/>
<wire x1="4.826" y1="4.8006" x2="-4.826" y2="4.8006" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="4.8006" x2="-4.826" y2="-4.826" width="0.1524" layer="21"/>
<wire x1="-0.3302" y1="-1.5748" x2="0.3048" y2="-1.5748" width="0.254" layer="21"/>
<wire x1="0.3048" y1="-1.5748" x2="0.3048" y2="0.635" width="0.254" layer="21"/>
<wire x1="0.3048" y1="0.635" x2="0.381" y2="0.635" width="0.254" layer="21"/>
<wire x1="0.635" y1="0.635" x2="0" y2="1.905" width="0.254" layer="21"/>
<wire x1="0" y1="1.905" x2="-0.635" y2="0.635" width="0.254" layer="21"/>
<wire x1="-0.3302" y1="0.635" x2="-0.3302" y2="-1.5748" width="0.254" layer="21"/>
<wire x1="0" y1="-1.524" x2="-0.127" y2="-1.524" width="0.254" layer="21"/>
<wire x1="-0.127" y1="1.524" x2="-0.127" y2="-1.524" width="0.254" layer="21"/>
<wire x1="-0.127" y1="1.524" x2="0.127" y2="1.524" width="0.254" layer="21"/>
<wire x1="0.127" y1="1.524" x2="0.127" y2="-1.524" width="0.254" layer="21"/>
<wire x1="0.254" y1="0.635" x2="0.3048" y2="0.635" width="0.254" layer="21"/>
<wire x1="0.381" y1="1.016" x2="0.381" y2="0.635" width="0.254" layer="21"/>
<wire x1="0.381" y1="0.635" x2="0.635" y2="0.635" width="0.254" layer="21"/>
<wire x1="-0.635" y1="0.635" x2="-0.381" y2="0.635" width="0.254" layer="21"/>
<wire x1="-0.3302" y1="0.635" x2="-0.254" y2="0.635" width="0.254" layer="21"/>
<wire x1="-0.381" y1="1.016" x2="-0.381" y2="0.635" width="0.254" layer="21"/>
<wire x1="-0.381" y1="0.635" x2="-0.3302" y2="0.635" width="0.254" layer="21"/>
<wire x1="-4.826" y1="-4.826" x2="-3.81" y2="-4.826" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-3.937" x2="-3.81" y2="-4.826" width="0.1524" layer="21"/>
<wire x1="4.826" y1="-4.826" x2="3.81" y2="-4.826" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-3.937" x2="3.81" y2="-4.826" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-3.937" x2="-3.81" y2="-3.937" width="0.1524" layer="21"/>
<wire x1="-0.7581" y1="-2.0215" x2="0" y2="2.159" width="0.254" layer="21" curve="-159.443138"/>
<wire x1="0" y1="2.159" x2="0.7581" y2="-2.0215" width="0.254" layer="21" curve="-159.443138"/>
<wire x1="0" y1="3.556" x2="1.8543" y2="3.0343" width="0.1524" layer="21" curve="-31.429813"/>
<wire x1="-1.8295" y1="3.0492" x2="0" y2="3.556" width="0.1524" layer="21" curve="-30.963201"/>
<wire x1="0" y1="-3.556" x2="3.0493" y2="1.8295" width="0.1524" layer="21" curve="120.96244"/>
<wire x1="-3.0875" y1="1.7643" x2="0" y2="-3.5559" width="0.1524" layer="21" curve="119.743785"/>
<wire x1="-0.9047" y1="-1.9603" x2="0" y2="-2.159" width="0.254" layer="51" curve="24.773812"/>
<wire x1="0" y1="-2.159" x2="0.9655" y2="-1.9311" width="0.254" layer="51" curve="26.563946"/>
<wire x1="-3.556" y1="0" x2="-1.6937" y2="3.1268" width="0.1524" layer="51" curve="-61.557324"/>
<wire x1="1.5903" y1="3.1806" x2="3.556" y2="0" width="0.1524" layer="51" curve="-63.435137"/>
<pad name="A" x="-2.54" y="2.54" drill="0.8128" shape="long" rot="R90"/>
<pad name="S" x="0" y="-2.54" drill="0.8128" shape="long" rot="R90"/>
<pad name="E" x="2.54" y="2.54" drill="0.8128" shape="long" rot="R90"/>
<text x="-4.826" y="5.207" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.2766" y="-5.6642" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-4.191" y="-3.556" size="1.27" layer="21" ratio="10">1</text>
<text x="3.302" y="-3.556" size="1.27" layer="21" ratio="10">3</text>
</package>
<package name="S63P">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;&lt;p&gt;
Spectrol</description>
<wire x1="4.699" y1="-4.6482" x2="4.699" y2="4.7498" width="0.1524" layer="21"/>
<wire x1="4.699" y1="4.7498" x2="-4.699" y2="4.7498" width="0.1524" layer="21"/>
<wire x1="-4.699" y1="4.7498" x2="-4.699" y2="-4.6482" width="0.1524" layer="21"/>
<wire x1="0.635" y1="-0.635" x2="-0.635" y2="0.635" width="0.6096" layer="21"/>
<wire x1="-4.699" y1="-4.6482" x2="-3.937" y2="-4.6482" width="0.1524" layer="21"/>
<wire x1="-3.937" y1="-4.064" x2="-3.937" y2="-4.6482" width="0.1524" layer="21"/>
<wire x1="4.699" y1="-4.6482" x2="3.937" y2="-4.6482" width="0.1524" layer="21"/>
<wire x1="3.937" y1="-4.064" x2="3.937" y2="-4.6482" width="0.1524" layer="21"/>
<wire x1="3.937" y1="-4.064" x2="-3.937" y2="-4.064" width="0.1524" layer="21"/>
<wire x1="2.54" y1="3.81" x2="2.413" y2="3.683" width="0.1524" layer="21"/>
<wire x1="2.54" y1="3.81" x2="2.413" y2="3.937" width="0.1524" layer="21"/>
<wire x1="2.286" y1="3.556" x2="2.286" y2="4.064" width="0.1524" layer="21"/>
<wire x1="2.286" y1="3.556" x2="2.159" y2="3.429" width="0.1524" layer="21"/>
<wire x1="2.286" y1="4.064" x2="2.159" y2="4.191" width="0.1524" layer="21"/>
<wire x1="2.413" y1="3.683" x2="2.413" y2="3.937" width="0.1524" layer="21"/>
<wire x1="2.413" y1="3.683" x2="2.286" y2="3.556" width="0.1524" layer="21"/>
<wire x1="2.413" y1="3.937" x2="2.286" y2="4.064" width="0.1524" layer="21"/>
<wire x1="2.54" y1="3.81" x2="2.159" y2="3.81" width="0.1524" layer="21"/>
<wire x1="2.159" y1="3.81" x2="-2.54" y2="3.81" width="0.1524" layer="21"/>
<wire x1="2.159" y1="3.81" x2="2.159" y2="4.191" width="0.1524" layer="21"/>
<wire x1="2.159" y1="3.429" x2="2.159" y2="3.81" width="0.1524" layer="21"/>
<wire x1="2.032" y1="3.302" x2="2.159" y2="3.429" width="0.1524" layer="21"/>
<wire x1="2.159" y1="4.191" x2="2.032" y2="4.318" width="0.1524" layer="21"/>
<wire x1="2.032" y1="4.318" x2="2.032" y2="3.302" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="1.27" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="1.905" width="0.1524" layer="51"/>
<pad name="E" x="-2.54" y="0" drill="0.8128" shape="long" rot="R90"/>
<pad name="A" x="2.54" y="0" drill="0.8128" shape="long" rot="R90"/>
<pad name="S" x="0" y="2.54" drill="0.8128" shape="long" rot="R90"/>
<text x="-4.572" y="5.207" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.556" y="-5.715" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-1.905" y="-3.81" size="1.27" layer="21" ratio="10">63P</text>
<text x="3.175" y="-2.54" size="1.27" layer="21" ratio="10">1</text>
<text x="-3.81" y="-2.54" size="1.27" layer="21" ratio="10">3</text>
<text x="1.651" y="3.175" size="1.27" layer="21" ratio="10"> 3 </text>
</package>
<package name="S63S">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;&lt;p&gt;
Spectrol</description>
<wire x1="-4.826" y1="-2.54" x2="-4.826" y2="2.286" width="0.1524" layer="21"/>
<wire x1="4.826" y1="2.286" x2="4.826" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="-2.54" x2="-2.032" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="4.826" y1="2.286" x2="-4.826" y2="2.286" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="-2.54" x2="-0.254" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="2.032" y1="-2.54" x2="4.826" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="-2.54" x2="-2.032" y2="-2.667" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="-2.667" x2="-2.032" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="2.032" y1="-2.794" x2="2.032" y2="-2.667" width="0.1524" layer="21"/>
<wire x1="2.032" y1="-2.667" x2="2.032" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="2.159" y1="-1.27" x2="2.032" y2="-1.397" width="0.1524" layer="51"/>
<wire x1="2.159" y1="-1.27" x2="2.032" y2="-1.143" width="0.1524" layer="51"/>
<wire x1="1.905" y1="-1.524" x2="1.905" y2="-1.016" width="0.1524" layer="51"/>
<wire x1="1.905" y1="-1.524" x2="1.778" y2="-1.651" width="0.1524" layer="51"/>
<wire x1="1.905" y1="-1.016" x2="1.778" y2="-0.889" width="0.1524" layer="51"/>
<wire x1="2.032" y1="-1.397" x2="2.032" y2="-1.143" width="0.1524" layer="51"/>
<wire x1="2.032" y1="-1.397" x2="1.905" y2="-1.524" width="0.1524" layer="51"/>
<wire x1="2.032" y1="-1.143" x2="1.905" y2="-1.016" width="0.1524" layer="51"/>
<wire x1="2.159" y1="-1.27" x2="1.778" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="1.778" y1="-1.27" x2="-2.54" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="1.778" y1="-1.27" x2="1.778" y2="-0.889" width="0.1524" layer="51"/>
<wire x1="1.778" y1="-1.651" x2="1.778" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="1.651" y1="-1.778" x2="1.778" y2="-1.651" width="0.1524" layer="51"/>
<wire x1="1.778" y1="-0.889" x2="1.651" y2="-0.762" width="0.1524" layer="51"/>
<wire x1="1.651" y1="-0.762" x2="1.651" y2="-1.778" width="0.1524" layer="51"/>
<wire x1="2.032" y1="-2.794" x2="0.254" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="-2.794" x2="-2.032" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="2.032" y1="-2.667" x2="0.254" y2="-2.667" width="0.1524" layer="21"/>
<wire x1="0.254" y1="-2.794" x2="0.254" y2="-2.667" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="-2.667" x2="-0.254" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="-2.667" x2="-2.032" y2="-2.667" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="-2.667" x2="-0.254" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="-2.54" x2="0.254" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="0.254" y1="-2.667" x2="0.254" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="0.254" y1="-2.54" x2="2.032" y2="-2.54" width="0.1524" layer="21"/>
<pad name="A" x="2.54" y="1.27" drill="0.8128" shape="long" rot="R90"/>
<pad name="E" x="-2.54" y="1.27" drill="0.8128" shape="long" rot="R90"/>
<pad name="S" x="0" y="1.27" drill="0.8128" shape="long" rot="R90"/>
<text x="-4.826" y="2.667" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.8006" y="-4.445" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-4.572" y="0.635" size="1.27" layer="21" ratio="10">3</text>
<text x="3.556" y="0.635" size="1.27" layer="21" ratio="10">1</text>
<text x="2.54" y="-1.905" size="1.27" layer="51" ratio="10">3</text>
</package>
<package name="S63X">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;&lt;p&gt;
Spectrol</description>
<wire x1="-4.826" y1="-3.81" x2="-4.826" y2="1.016" width="0.1524" layer="21"/>
<wire x1="4.826" y1="1.016" x2="4.826" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="-3.81" x2="-2.032" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="4.826" y1="1.016" x2="-4.826" y2="1.016" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="-3.81" x2="-2.032" y2="-3.937" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="-3.81" x2="-0.254" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="2.032" y1="-3.81" x2="4.826" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="-3.937" x2="-0.254" y2="-3.937" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="-3.937" x2="-2.032" y2="-4.064" width="0.1524" layer="21"/>
<wire x1="2.032" y1="-4.064" x2="2.032" y2="-3.937" width="0.1524" layer="21"/>
<wire x1="2.032" y1="-3.937" x2="2.032" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="2.159" y1="-2.54" x2="2.032" y2="-2.667" width="0.1524" layer="51"/>
<wire x1="2.159" y1="-2.54" x2="2.032" y2="-2.413" width="0.1524" layer="51"/>
<wire x1="1.905" y1="-2.794" x2="1.905" y2="-2.286" width="0.1524" layer="51"/>
<wire x1="1.905" y1="-2.794" x2="1.778" y2="-2.921" width="0.1524" layer="51"/>
<wire x1="1.905" y1="-2.286" x2="1.778" y2="-2.159" width="0.1524" layer="51"/>
<wire x1="2.032" y1="-2.667" x2="2.032" y2="-2.413" width="0.1524" layer="51"/>
<wire x1="2.032" y1="-2.667" x2="1.905" y2="-2.794" width="0.1524" layer="51"/>
<wire x1="2.032" y1="-2.413" x2="1.905" y2="-2.286" width="0.1524" layer="51"/>
<wire x1="2.159" y1="-2.54" x2="1.778" y2="-2.54" width="0.1524" layer="51"/>
<wire x1="1.778" y1="-2.54" x2="-2.54" y2="-2.54" width="0.1524" layer="51"/>
<wire x1="1.778" y1="-2.54" x2="1.778" y2="-2.159" width="0.1524" layer="51"/>
<wire x1="1.778" y1="-2.921" x2="1.778" y2="-2.54" width="0.1524" layer="51"/>
<wire x1="1.651" y1="-3.048" x2="1.778" y2="-2.921" width="0.1524" layer="51"/>
<wire x1="1.778" y1="-2.159" x2="1.651" y2="-2.032" width="0.1524" layer="51"/>
<wire x1="1.651" y1="-2.032" x2="1.651" y2="-3.048" width="0.1524" layer="51"/>
<wire x1="2.032" y1="-4.064" x2="0.254" y2="-4.064" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="-4.064" x2="-0.254" y2="-3.937" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="-4.064" x2="-2.032" y2="-4.064" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="-3.937" x2="-0.254" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="-0.254" y1="-3.81" x2="0.254" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="0.254" y1="-3.81" x2="2.032" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="0.254" y1="-4.064" x2="0.254" y2="-3.937" width="0.1524" layer="21"/>
<wire x1="0.254" y1="-3.937" x2="0.254" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="0.254" y1="-3.937" x2="2.032" y2="-3.937" width="0.1524" layer="21"/>
<pad name="A" x="2.54" y="0" drill="0.8128" shape="long"/>
<pad name="E" x="-2.54" y="0" drill="0.8128" shape="long"/>
<pad name="S" x="0" y="-2.54" drill="0.8128" shape="long"/>
<text x="-4.826" y="1.397" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.8006" y="-5.715" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-4.572" y="-0.635" size="1.27" layer="21" ratio="10">3</text>
<text x="3.556" y="-0.635" size="1.27" layer="21" ratio="10">1</text>
<text x="2.54" y="-3.175" size="1.27" layer="51" ratio="10">3</text>
</package>
<package name="S64W">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;&lt;p&gt;
Spectrol</description>
<wire x1="-4.826" y1="-1.27" x2="4.826" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="4.064" y1="0.508" x2="3.048" y2="-0.508" width="0.3048" layer="21"/>
<wire x1="-4.826" y1="3.81" x2="4.826" y2="3.81" width="0.1524" layer="21"/>
<wire x1="4.826" y1="3.81" x2="4.826" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="-1.27" x2="-4.826" y2="3.81" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="0" x2="-2.413" y2="0" width="0.1524" layer="51"/>
<wire x1="-2.032" y1="0" x2="-2.159" y2="-0.127" width="0.1524" layer="51"/>
<wire x1="-2.032" y1="0" x2="-2.159" y2="0.127" width="0.1524" layer="51"/>
<wire x1="-2.286" y1="-0.254" x2="-2.286" y2="0.254" width="0.1524" layer="51"/>
<wire x1="-2.286" y1="-0.254" x2="-2.413" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="-2.286" y1="0.254" x2="-2.413" y2="0.381" width="0.1524" layer="51"/>
<wire x1="-2.159" y1="-0.127" x2="-2.159" y2="0.127" width="0.1524" layer="51"/>
<wire x1="-2.159" y1="-0.127" x2="-2.286" y2="-0.254" width="0.1524" layer="51"/>
<wire x1="-2.159" y1="0.127" x2="-2.286" y2="0.254" width="0.1524" layer="51"/>
<wire x1="-2.413" y1="0" x2="-2.413" y2="0.381" width="0.1524" layer="51"/>
<wire x1="-2.413" y1="-0.381" x2="-2.413" y2="0" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="-0.508" x2="-2.413" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="-2.413" y1="0.381" x2="-2.54" y2="0.508" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="0.508" x2="-2.54" y2="-0.508" width="0.1524" layer="51"/>
<wire x1="-4.318" y1="0" x2="-2.413" y2="0" width="0.1524" layer="51"/>
<circle x="3.556" y="0" radius="0.889" width="0.1524" layer="51"/>
<circle x="3.556" y="0" radius="0.635" width="0.0508" layer="21"/>
<pad name="A" x="2.54" y="1.27" drill="0.8128" shape="long" rot="R90"/>
<pad name="E" x="-2.54" y="1.27" drill="0.8128" shape="long" rot="R90"/>
<pad name="S" x="0" y="1.27" drill="0.8128" shape="long" rot="R90"/>
<text x="-4.826" y="4.1402" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.8006" y="-2.921" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-4.445" y="1.905" size="1.27" layer="21" ratio="10">3</text>
<text x="3.556" y="1.905" size="1.27" layer="21" ratio="10">1</text>
<text x="-1.905" y="-0.635" size="1.27" layer="51" ratio="10">3</text>
</package>
<package name="S64Y">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;&lt;p&gt;
Spectrol</description>
<wire x1="-4.826" y1="-2.54" x2="4.826" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="4.826" y1="2.54" x2="4.826" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="4.826" y1="2.54" x2="-4.826" y2="2.54" width="0.1524" layer="21"/>
<wire x1="4.064" y1="-0.762" x2="3.048" y2="-1.778" width="0.3048" layer="21"/>
<wire x1="-4.826" y1="-2.54" x2="-4.826" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-2.159" y1="-0.381" x2="-2.54" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="-2.159" y1="-0.381" x2="-2.286" y2="-0.508" width="0.1524" layer="51"/>
<wire x1="-2.159" y1="-0.381" x2="-2.286" y2="-0.254" width="0.1524" layer="51"/>
<wire x1="-2.413" y1="-0.635" x2="-2.413" y2="-0.127" width="0.1524" layer="51"/>
<wire x1="-2.413" y1="-0.635" x2="-2.54" y2="-0.762" width="0.1524" layer="51"/>
<wire x1="-2.413" y1="-0.127" x2="-2.54" y2="0" width="0.1524" layer="51"/>
<wire x1="-2.286" y1="-0.508" x2="-2.286" y2="-0.254" width="0.1524" layer="51"/>
<wire x1="-2.286" y1="-0.508" x2="-2.413" y2="-0.635" width="0.1524" layer="51"/>
<wire x1="-2.286" y1="-0.254" x2="-2.413" y2="-0.127" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="-0.381" x2="-2.54" y2="0" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="-0.762" x2="-2.54" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="-2.667" y1="-0.889" x2="-2.54" y2="-0.762" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="0" x2="-2.667" y2="0.127" width="0.1524" layer="51"/>
<wire x1="-2.667" y1="0.127" x2="-2.667" y2="-0.889" width="0.1524" layer="51"/>
<wire x1="-4.445" y1="-0.381" x2="-2.54" y2="-0.381" width="0.1524" layer="51"/>
<circle x="3.556" y="-1.27" radius="0.889" width="0.1524" layer="21"/>
<circle x="3.556" y="-1.27" radius="0.635" width="0.0508" layer="21"/>
<pad name="A" x="2.54" y="1.27" drill="0.8128" shape="long"/>
<pad name="E" x="-2.54" y="1.27" drill="0.8128" shape="long"/>
<pad name="S" x="0" y="-1.27" drill="0.8128" shape="long"/>
<text x="-4.826" y="2.8702" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.8006" y="-4.191" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-4.445" y="0.635" size="1.27" layer="21" ratio="10">3</text>
<text x="3.556" y="0.635" size="1.27" layer="21" ratio="10">1</text>
<text x="-2.032" y="-1.016" size="1.27" layer="51" ratio="10">3</text>
</package>
<package name="S75H">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;</description>
<wire x1="-0.635" y1="-0.635" x2="0.635" y2="0.635" width="0.8128" layer="51"/>
<wire x1="1.778" y1="0" x2="1.905" y2="0" width="0.254" layer="21"/>
<wire x1="-1.905" y1="0" x2="-1.778" y2="0" width="0.254" layer="21"/>
<wire x1="0" y1="1.778" x2="0" y2="1.905" width="0.254" layer="21"/>
<wire x1="1.27" y1="1.27" x2="1.397" y2="1.397" width="0.254" layer="21"/>
<wire x1="-1.27" y1="1.27" x2="-1.397" y2="1.397" width="0.254" layer="21"/>
<wire x1="-1.27" y1="-1.27" x2="-1.397" y2="-1.397" width="0.254" layer="51"/>
<wire x1="1.27" y1="-1.27" x2="1.397" y2="-1.397" width="0.254" layer="51"/>
<circle x="0" y="0" radius="3.302" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="1.397" width="0.1524" layer="51"/>
<pad name="A" x="-1.778" y="-1.397" drill="0.8128" shape="octagon"/>
<pad name="S" x="0" y="0.381" drill="0.8128" shape="octagon"/>
<pad name="E" x="1.778" y="-1.397" drill="0.8128" shape="octagon"/>
<text x="0.762" y="-2.667" size="0.9906" layer="51" ratio="12">3</text>
<text x="-1.524" y="-2.667" size="0.9906" layer="51" ratio="12">1</text>
<text x="-2.54" y="3.81" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.302" y="-5.08" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="S75P">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;</description>
<wire x1="-0.635" y1="-0.635" x2="0.635" y2="0.635" width="0.6096" layer="21"/>
<wire x1="1.778" y1="0" x2="1.905" y2="0" width="0.1524" layer="51"/>
<wire x1="-1.905" y1="0" x2="-1.778" y2="0" width="0.1524" layer="51"/>
<wire x1="0" y1="1.778" x2="0" y2="1.905" width="0.1524" layer="51"/>
<wire x1="1.27" y1="1.27" x2="1.397" y2="1.397" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="1.27" x2="-1.397" y2="1.397" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.27" x2="-1.397" y2="-1.397" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-1.27" x2="1.397" y2="-1.397" width="0.1524" layer="21"/>
<wire x1="-3.2379" y1="-0.6476" x2="0" y2="-3.302" width="0.1524" layer="21" curve="78.690111"/>
<wire x1="0" y1="-3.302" x2="3.2426" y2="-0.6236" width="0.1524" layer="21" curve="79.114357"/>
<wire x1="-3.2278" y1="0.6725" x2="-0.889" y2="3.175" width="0.1524" layer="21" curve="-62.588748"/>
<wire x1="0.889" y1="3.175" x2="3.2278" y2="0.6725" width="0.1524" layer="21" curve="-62.588748"/>
<circle x="0" y="0" radius="3.302" width="0.1524" layer="51"/>
<circle x="0" y="0" radius="1.397" width="0.1524" layer="21"/>
<pad name="A" x="-2.54" y="0" drill="0.8128" shape="octagon"/>
<pad name="S" x="0" y="2.54" drill="0.8128" shape="octagon"/>
<pad name="E" x="2.54" y="0" drill="0.8128" shape="octagon"/>
<text x="-2.54" y="3.81" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.302" y="-5.08" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="0.762" y="-2.667" size="0.9906" layer="21" ratio="12">3</text>
<text x="-1.524" y="-2.667" size="0.9906" layer="21" ratio="12">1</text>
</package>
<package name="ST10">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;&lt;p&gt;
Piher</description>
<wire x1="-1.905" y1="-1.27" x2="-1.27" y2="-1.905" width="0.1524" layer="51"/>
<wire x1="-1.27" y1="-1.905" x2="-1.143" y2="-1.905" width="0.1524" layer="51"/>
<wire x1="1.143" y1="-1.905" x2="1.27" y2="-1.905" width="0.1524" layer="51"/>
<wire x1="1.27" y1="-1.905" x2="1.905" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-0.762" y1="3.175" x2="-0.762" y2="2.54" width="0.1524" layer="21"/>
<wire x1="0.762" y1="2.54" x2="0.762" y2="3.175" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="3.175" x2="-0.762" y2="3.175" width="0.1524" layer="21"/>
<wire x1="-0.762" y1="3.175" x2="0.762" y2="3.175" width="0.1524" layer="21"/>
<wire x1="0.762" y1="3.175" x2="4.445" y2="3.175" width="0.1524" layer="21"/>
<wire x1="5.08" y1="2.54" x2="4.445" y2="3.175" width="0.1524" layer="21"/>
<wire x1="5.08" y1="2.54" x2="5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="-1.27" x2="-5.08" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="3.175" x2="-5.08" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-0.635" x2="-5.08" y2="2.54" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="4.445" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-0.635" x2="3.937" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="3.937" y1="-0.635" x2="1.143" y2="-0.635" width="0.1524" layer="51"/>
<wire x1="1.143" y1="-0.635" x2="-1.143" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-0.635" x2="-3.937" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-3.937" y1="-0.635" x2="-1.143" y2="-0.635" width="0.1524" layer="51"/>
<wire x1="-4.445" y1="-1.27" x2="-3.937" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-3.937" y1="-1.27" x2="-1.905" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-1.143" y1="-1.27" x2="-1.905" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="4.445" y1="-1.27" x2="3.937" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="3.937" y1="-1.27" x2="1.905" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="1.143" y1="-1.27" x2="1.905" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="1.143" y1="-1.27" x2="-1.143" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.143" y1="-1.905" x2="-1.143" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="5.08" y1="2.54" x2="0.762" y2="2.54" width="0.1524" layer="21"/>
<wire x1="0.762" y1="2.54" x2="-0.762" y2="2.54" width="0.1524" layer="51"/>
<wire x1="-0.762" y1="2.54" x2="-5.08" y2="2.54" width="0.1524" layer="21"/>
<pad name="A" x="-2.54" y="-1.27" drill="1.3208" shape="octagon"/>
<pad name="E" x="2.54" y="-1.27" drill="1.3208" shape="octagon"/>
<pad name="S" x="0" y="1.27" drill="1.3208" shape="octagon"/>
<text x="-4.445" y="3.5306" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.445" y="-4.0894" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="ST15">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;&lt;p&gt;
Piher</description>
<wire x1="-3.683" y1="-2.54" x2="-3.048" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="3.048" y1="-3.175" x2="3.683" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="2.54" x2="-1.905" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="2.54" x2="-1.397" y2="2.54" width="0.1524" layer="21"/>
<wire x1="7.62" y1="1.905" x2="6.985" y2="2.54" width="0.1524" layer="21"/>
<wire x1="7.62" y1="1.905" x2="7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="-2.54" x2="-7.62" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-6.985" y1="2.54" x2="-7.62" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-1.905" x2="-7.62" y2="1.905" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-1.905" x2="6.985" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-1.905" x2="6.477" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="6.477" y1="-1.905" x2="3.683" y2="-1.905" width="0.1524" layer="51"/>
<wire x1="3.683" y1="-1.905" x2="-3.683" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="-1.905" x2="-6.477" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-6.477" y1="-1.905" x2="-3.683" y2="-1.905" width="0.1524" layer="51"/>
<wire x1="-6.985" y1="-2.54" x2="-6.477" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-6.477" y1="-2.54" x2="-3.683" y2="-2.54" width="0.1524" layer="51"/>
<wire x1="6.985" y1="-2.54" x2="6.477" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="6.477" y1="-2.54" x2="3.683" y2="-2.54" width="0.1524" layer="51"/>
<wire x1="3.683" y1="-2.54" x2="-3.683" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="3.048" y1="-3.175" x2="-3.048" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="1.397" y1="2.54" x2="1.905" y2="2.54" width="0.1524" layer="21"/>
<wire x1="1.905" y1="2.54" x2="6.985" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="2.54" x2="1.905" y2="2.54" width="0.1524" layer="51"/>
<wire x1="7.62" y1="1.905" x2="1.905" y2="1.905" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.905" x2="1.397" y2="1.905" width="0.1524" layer="21"/>
<wire x1="1.905" y1="1.905" x2="-1.905" y2="1.905" width="0.1524" layer="51"/>
<wire x1="-1.397" y1="1.905" x2="-1.905" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="1.905" x2="-7.62" y2="1.905" width="0.1524" layer="21"/>
<wire x1="1.905" y1="2.54" x2="1.905" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="2.54" x2="-1.905" y2="1.905" width="0.1524" layer="21"/>
<pad name="A" x="-5.08" y="-2.54" drill="1.3208" shape="long"/>
<pad name="E" x="5.08" y="-2.54" drill="1.3208" shape="long"/>
<pad name="S" x="0" y="2.54" drill="1.3208" shape="long"/>
<text x="1.905" y="3.0226" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-0.6604" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="SP19LKN">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;</description>
<wire x1="-9.525" y1="-2.413" x2="10.16" y2="-2.413" width="0.1524" layer="21"/>
<wire x1="10.16" y1="-2.413" x2="10.16" y2="2.667" width="0.1524" layer="21"/>
<wire x1="10.16" y1="2.667" x2="-9.525" y2="2.667" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="2.667" x2="-9.525" y2="-2.413" width="0.1524" layer="21"/>
<wire x1="6.223" y1="1.27" x2="5.842" y2="1.27" width="0.1524" layer="21"/>
<wire x1="6.223" y1="1.27" x2="6.096" y2="1.143" width="0.1524" layer="21"/>
<wire x1="6.223" y1="1.27" x2="6.096" y2="1.397" width="0.1524" layer="21"/>
<wire x1="5.969" y1="1.016" x2="5.969" y2="1.524" width="0.1524" layer="21"/>
<wire x1="5.969" y1="1.016" x2="5.842" y2="0.889" width="0.1524" layer="21"/>
<wire x1="5.969" y1="1.524" x2="5.842" y2="1.651" width="0.1524" layer="21"/>
<wire x1="6.096" y1="1.143" x2="6.096" y2="1.397" width="0.1524" layer="21"/>
<wire x1="6.096" y1="1.143" x2="5.969" y2="1.016" width="0.1524" layer="21"/>
<wire x1="6.096" y1="1.397" x2="5.969" y2="1.524" width="0.1524" layer="21"/>
<wire x1="5.842" y1="1.27" x2="5.842" y2="1.651" width="0.1524" layer="21"/>
<wire x1="5.842" y1="0.889" x2="5.842" y2="1.27" width="0.1524" layer="21"/>
<wire x1="5.715" y1="0.762" x2="5.842" y2="0.889" width="0.1524" layer="21"/>
<wire x1="5.842" y1="1.651" x2="5.715" y2="1.778" width="0.1524" layer="21"/>
<wire x1="5.715" y1="1.778" x2="5.715" y2="0.762" width="0.1524" layer="21"/>
<wire x1="3.81" y1="1.27" x2="5.842" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="2.667" x2="-9.525" y2="3.683" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="3.683" x2="-14.605" y2="3.683" width="0.1524" layer="21"/>
<wire x1="-14.605" y1="3.683" x2="-14.605" y2="3.302" width="0.1524" layer="21"/>
<wire x1="-14.605" y1="3.302" x2="-14.605" y2="0.762" width="0.1524" layer="21"/>
<wire x1="-14.605" y1="0.762" x2="-14.605" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="-14.605" y1="-0.508" x2="-14.605" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-14.605" y1="-3.048" x2="-14.605" y2="-3.429" width="0.1524" layer="21"/>
<wire x1="-14.605" y1="-3.429" x2="-9.525" y2="-3.429" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="-3.429" x2="-9.525" y2="-2.413" width="0.1524" layer="21"/>
<wire x1="-14.605" y1="3.302" x2="-14.732" y2="3.302" width="0.1524" layer="21"/>
<wire x1="-14.732" y1="3.302" x2="-14.732" y2="0.762" width="0.1524" layer="21"/>
<wire x1="-14.732" y1="0.762" x2="-14.605" y2="0.762" width="0.1524" layer="21"/>
<wire x1="-14.605" y1="-0.508" x2="-14.732" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="-14.732" y1="-0.508" x2="-14.732" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-14.732" y1="-3.048" x2="-14.605" y2="-3.048" width="0.1524" layer="21"/>
<pad name="A" x="6.35" y="-1.27" drill="1.016" shape="long"/>
<pad name="E" x="-6.35" y="-1.27" drill="1.016" shape="long"/>
<pad name="S" x="-1.27" y="1.27" drill="1.016" shape="long"/>
<text x="-15.113" y="-3.429" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="-3.81" y="-1.778" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="7.62" y="-1.905" size="1.27" layer="21" ratio="10">1</text>
<text x="-8.89" y="-1.905" size="1.27" layer="21" ratio="10">3</text>
<text x="-3.937" y="0.635" size="1.27" layer="21" ratio="10">2</text>
<text x="1.397" y="0.635" size="1.27" layer="21" ratio="10"> 1 </text>
<text x="5.588" y="0.635" size="1.27" layer="21" ratio="10"> 3 </text>
</package>
<package name="CIP20C-4MM">
<description>&lt;b&gt;Carbon Rotary Potentiometers - 20 mm size&lt;/b&gt;&lt;p&gt;
Source: Radiohm .. RAD.pdf</description>
<wire x1="-10.1" y1="-1.125" x2="-10.1" y2="6.675" width="0.2032" layer="21"/>
<wire x1="-10.1" y1="6.675" x2="10.1" y2="6.675" width="0.2032" layer="21"/>
<wire x1="10.1" y1="6.675" x2="10.1" y2="-1.125" width="0.2032" layer="21"/>
<wire x1="10.1" y1="-1.125" x2="10.1" y2="-3.8" width="0.2032" layer="21"/>
<wire x1="10.1" y1="-3.8" x2="-10.1" y2="-3.8" width="0.2032" layer="21"/>
<wire x1="-10.1" y1="-3.8" x2="-10.1" y2="-1.125" width="0.2032" layer="21"/>
<wire x1="2.9" y1="-3.9" x2="2.9" y2="-11.8" width="0.2032" layer="21"/>
<wire x1="2.9" y1="-11.8" x2="-2.9" y2="-11.8" width="0.2032" layer="21"/>
<wire x1="-2.9" y1="-11.8" x2="-2.9" y2="-3.875" width="0.2032" layer="21"/>
<wire x1="1.9" y1="-11.9" x2="1.9" y2="-52.8" width="0.2032" layer="21"/>
<wire x1="1.9" y1="-52.8" x2="0.9" y2="-53.8" width="0.2032" layer="21"/>
<wire x1="0.9" y1="-53.8" x2="-0.9" y2="-53.8" width="0.2032" layer="21"/>
<wire x1="-0.9" y1="-53.8" x2="-1.9" y2="-52.8" width="0.2032" layer="21"/>
<wire x1="-1.9" y1="-52.8" x2="-1.9" y2="-11.875" width="0.2032" layer="21"/>
<wire x1="10.1" y1="-1.125" x2="-10.1" y2="-1.125" width="0.2032" layer="21"/>
<pad name="A" x="-5" y="0" drill="1.3" diameter="1.9304"/>
<pad name="S" x="0" y="0" drill="1.3" diameter="1.9304"/>
<pad name="E" x="5" y="0" drill="1.3" diameter="1.9304"/>
<text x="-10.16" y="6.985" size="1.27" layer="25">&gt;NAME</text>
<text x="-8.255" y="3.175" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="CIP20C-6MM">
<description>&lt;b&gt;Carbon Rotary Potentiometers - 20 mm size&lt;/b&gt;&lt;p&gt;
Source: Radiohm .. RAD.pdf</description>
<wire x1="-10.1" y1="-1.125" x2="-10.1" y2="6.675" width="0.2032" layer="21"/>
<wire x1="-10.1" y1="6.675" x2="10.1" y2="6.675" width="0.2032" layer="21"/>
<wire x1="10.1" y1="6.675" x2="10.1" y2="-1.125" width="0.2032" layer="21"/>
<wire x1="10.1" y1="-1.125" x2="10.1" y2="-3.8" width="0.2032" layer="21"/>
<wire x1="10.1" y1="-3.8" x2="-10.1" y2="-3.8" width="0.2032" layer="21"/>
<wire x1="-10.1" y1="-3.8" x2="-10.1" y2="-1.125" width="0.2032" layer="21"/>
<wire x1="3.9" y1="-3.9" x2="3.9" y2="-11.8" width="0.2032" layer="21"/>
<wire x1="3.9" y1="-11.8" x2="-3.9" y2="-11.8" width="0.2032" layer="21"/>
<wire x1="-3.9" y1="-11.8" x2="-3.9" y2="-3.875" width="0.2032" layer="21"/>
<wire x1="2.9" y1="-11.85" x2="2.9" y2="-52.8" width="0.2032" layer="21"/>
<wire x1="2.9" y1="-52.8" x2="1.9" y2="-53.8" width="0.2032" layer="21"/>
<wire x1="1.9" y1="-53.8" x2="-1.9" y2="-53.8" width="0.2032" layer="21"/>
<wire x1="-1.9" y1="-53.8" x2="-2.9" y2="-52.8" width="0.2032" layer="21"/>
<wire x1="-2.9" y1="-52.8" x2="-2.9" y2="-11.875" width="0.2032" layer="21"/>
<wire x1="10.1" y1="-1.125" x2="-10.1" y2="-1.125" width="0.2032" layer="21"/>
<pad name="A" x="-5" y="0" drill="1.3" diameter="1.9304"/>
<pad name="S" x="0" y="0" drill="1.3" diameter="1.9304"/>
<pad name="E" x="5" y="0" drill="1.3" diameter="1.9304"/>
<text x="-10.16" y="6.985" size="1.27" layer="25">&gt;NAME</text>
<text x="-8.255" y="3.175" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="SM-42/43A">
<description>&lt;b&gt;COPAL ELECTRONICS SM-42/43 SURFACE MOUNT TRIMMERS&lt;/b&gt; Side adjustmet&lt;p&gt;
Source: smt-pots.pdf</description>
<wire x1="2.175" y1="-2.3" x2="2.175" y2="2.3" width="0.2032" layer="51"/>
<wire x1="2.175" y1="2.3" x2="-2.2" y2="2.3" width="0.2032" layer="21"/>
<wire x1="-2.2" y1="2.3" x2="-2.2" y2="-2.3" width="0.2032" layer="51"/>
<wire x1="-2.2" y1="-2.3" x2="2.175" y2="-2.3" width="0.2032" layer="21"/>
<wire x1="-2.2" y1="2.3" x2="-2.2" y2="1.2" width="0.2032" layer="21"/>
<wire x1="-2.2" y1="-1.2" x2="-2.2" y2="-2.3" width="0.2032" layer="21"/>
<smd name="3" x="2" y="-1.15" dx="1.3" dy="2" layer="1" rot="R90"/>
<smd name="2" x="-2" y="0" dx="2" dy="2" layer="1" rot="R90"/>
<smd name="1" x="2" y="1.15" dx="1.3" dy="2" layer="1" rot="R90"/>
<text x="-2.65" y="-3.975" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.75" y="2.7" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="1.95" y1="-1.425" x2="2.75" y2="-1.125" layer="51" rot="R90"/>
<rectangle x1="1.95" y1="1.125" x2="2.75" y2="1.425" layer="51" rot="R90"/>
<rectangle x1="-3" y1="-0.15" x2="-1.7" y2="0.15" layer="51" rot="R90"/>
<rectangle x1="-2.5875" y1="-1.6375" x2="-1.6875" y2="-1.3125" layer="21" rot="R90"/>
</package>
<package name="SM-42/43X">
<description>&lt;b&gt;COPAL ELECTRONICS SM-42/43 SURFACE MOUNT TRIMMERS&lt;/b&gt; Top adjustmet&lt;p&gt;
Source: smt-pots.pdf</description>
<wire x1="-2.3" y1="-1.625" x2="2.3" y2="-1.625" width="0.2032" layer="51"/>
<wire x1="2.3" y1="-1.625" x2="2.3" y2="1.65" width="0.2032" layer="21"/>
<wire x1="2.3" y1="1.65" x2="-2.3" y2="1.65" width="0.2032" layer="51"/>
<wire x1="-2.3" y1="1.65" x2="-2.3" y2="-1.625" width="0.2032" layer="21"/>
<wire x1="2.3" y1="1.65" x2="1.2" y2="1.65" width="0.2032" layer="21"/>
<wire x1="-1.2" y1="1.65" x2="-2.3" y2="1.65" width="0.2032" layer="21"/>
<wire x1="1.525" y1="1.175" x2="0.875" y2="0.525" width="0.2032" layer="21"/>
<circle x="1.2" y="0.85" radius="0.5505" width="0.2032" layer="21"/>
<smd name="1" x="-1.27" y="-2.55" dx="1.3" dy="1.9" layer="1"/>
<smd name="2" x="0" y="2.55" dx="2" dy="1.9" layer="1"/>
<smd name="3" x="1.27" y="-2.55" dx="1.3" dy="1.9" layer="1"/>
<text x="-2.4" y="-5" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.4" y="3.675" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.675" y1="-2.85" x2="-0.875" y2="-1.65" layer="51"/>
<rectangle x1="0.875" y1="-2.85" x2="1.675" y2="-1.65" layer="51"/>
<rectangle x1="-0.65" y1="1.65" x2="0.65" y2="2.85" layer="51"/>
</package>
<package name="SM-42/43W">
<description>&lt;b&gt;COPAL ELECTRONICS SM-42/43 SURFACE MOUNT TRIMMERS&lt;/b&gt; Top adjustmet&lt;p&gt;
Source: smt-pots.pdf</description>
<wire x1="-2.3" y1="-1.625" x2="2.3" y2="-1.625" width="0.2032" layer="51"/>
<wire x1="2.3" y1="-1.625" x2="2.3" y2="1.65" width="0.2032" layer="21"/>
<wire x1="2.3" y1="1.65" x2="-2.3" y2="1.65" width="0.2032" layer="51"/>
<wire x1="-2.3" y1="1.65" x2="-2.3" y2="-1.625" width="0.2032" layer="21"/>
<wire x1="2.3" y1="1.65" x2="1.2" y2="1.65" width="0.2032" layer="21"/>
<wire x1="-1.2" y1="1.65" x2="-2.3" y2="1.65" width="0.2032" layer="21"/>
<wire x1="1.525" y1="1.175" x2="0.875" y2="0.525" width="0.2032" layer="51"/>
<circle x="1.2" y="0.85" radius="0.5505" width="0.2032" layer="51"/>
<smd name="1" x="-1.27" y="-1.45" dx="1.3" dy="1.6" layer="1"/>
<smd name="2" x="0" y="1.45" dx="2" dy="1.6" layer="1"/>
<smd name="3" x="1.27" y="-1.45" dx="1.3" dy="1.6" layer="1"/>
<text x="-2.4" y="-3.625" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.4" y="2.475" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.675" y1="-1.95" x2="-0.875" y2="-1.65" layer="51"/>
<rectangle x1="0.875" y1="-1.95" x2="1.675" y2="-1.65" layer="51"/>
<rectangle x1="-0.65" y1="1.65" x2="0.65" y2="1.95" layer="51"/>
</package>
<package name="SM-42/43B">
<description>&lt;b&gt;COPAL ELECTRONICS SM-42/43 SURFACE MOUNT TRIMMERS&lt;/b&gt; Side adjustmet&lt;p&gt;
Source: smt-pots.pdf</description>
<wire x1="2.175" y1="-2.3" x2="2.175" y2="2.3" width="0.2032" layer="51"/>
<wire x1="2.175" y1="2.3" x2="-2.2" y2="2.3" width="0.2032" layer="21"/>
<wire x1="-2.2" y1="2.3" x2="-2.2" y2="-2.3" width="0.2032" layer="51"/>
<wire x1="-2.2" y1="-2.3" x2="2.175" y2="-2.3" width="0.2032" layer="21"/>
<wire x1="-2.2" y1="2.3" x2="-2.2" y2="1.2" width="0.2032" layer="21"/>
<wire x1="-2.2" y1="-1.2" x2="-2.2" y2="-2.3" width="0.2032" layer="21"/>
<smd name="3" x="2.6" y="-1.15" dx="1.3" dy="1.3" layer="1" rot="R90"/>
<smd name="2" x="-2.6" y="0" dx="2" dy="1.3" layer="1" rot="R90"/>
<smd name="1" x="2.6" y="1.15" dx="1.3" dy="1.3" layer="1" rot="R90"/>
<text x="-2.575" y="-3.85" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.575" y="2.65" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="2.2" y1="-1.675" x2="3" y2="-0.875" layer="51" rot="R90"/>
<rectangle x1="2.2" y1="0.875" x2="3" y2="1.675" layer="51" rot="R90"/>
<rectangle x1="-3.2375" y1="-0.3875" x2="-1.9375" y2="0.3875" layer="51" rot="R90"/>
<rectangle x1="-2.5875" y1="-1.6375" x2="-1.6875" y2="-1.3125" layer="21" rot="R90"/>
</package>
<package name="3223G">
<description>&lt;b&gt;3 mm SMD Trimming Potentiometer&lt;/b&gt; Side Adjust&lt;p&gt;
Source: http://www.bourns.com/data/global/PDFs/3223.PDF</description>
<wire x1="-1.85" y1="1.85" x2="1.85" y2="1.85" width="0.2032" layer="51"/>
<wire x1="1.85" y1="1.85" x2="1.85" y2="-1.85" width="0.2032" layer="51"/>
<wire x1="1.85" y1="-1.85" x2="-1.85" y2="-1.85" width="0.2032" layer="51"/>
<wire x1="-1.85" y1="-1.85" x2="-1.85" y2="1.85" width="0.2032" layer="51"/>
<wire x1="-0.8975" y1="1.85" x2="1.85" y2="1.85" width="0.2032" layer="21"/>
<wire x1="1.85" y1="1.85" x2="1.85" y2="1.0075" width="0.2032" layer="21"/>
<wire x1="1.85" y1="-1.85" x2="-0.8975" y2="-1.85" width="0.2032" layer="21"/>
<wire x1="1.85" y1="-1.0075" x2="1.85" y2="-1.85" width="0.2032" layer="21"/>
<wire x1="-1.85" y1="-0.58" x2="-1.85" y2="0.58" width="0.2032" layer="21"/>
<smd name="1" x="-2.2" y="1.4" dx="2" dy="0.9" layer="1"/>
<smd name="2" x="2.2" y="0" dx="2" dy="1.3" layer="1"/>
<smd name="3" x="-2.2" y="-1.4" dx="2" dy="0.9" layer="1"/>
<text x="-1.5875" y="2.2225" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.4925" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-2.65" y1="1.075" x2="-1.925" y2="1.625" layer="51"/>
<rectangle x1="-2.65" y1="-1.625" x2="-1.925" y2="-1.075" layer="51"/>
<rectangle x1="1.925" y1="-0.5" x2="2.625" y2="0.5" layer="51"/>
</package>
<package name="3223J">
<description>&lt;b&gt;3 mm SMD Trimming Potentiometer&lt;/b&gt; Side Adjust&lt;p&gt;
Source: http://www.bourns.com/data/global/PDFs/3223.PDF</description>
<wire x1="-1.85" y1="1.85" x2="1.85" y2="1.85" width="0.2032" layer="51"/>
<wire x1="1.85" y1="1.85" x2="1.85" y2="-1.85" width="0.2032" layer="51"/>
<wire x1="1.85" y1="-1.85" x2="-1.85" y2="-1.85" width="0.2032" layer="51"/>
<wire x1="-1.85" y1="-1.85" x2="-1.85" y2="1.85" width="0.2032" layer="51"/>
<wire x1="-0.8975" y1="1.85" x2="1.85" y2="1.85" width="0.2032" layer="21"/>
<wire x1="1.85" y1="1.85" x2="1.85" y2="1.0075" width="0.2032" layer="21"/>
<wire x1="1.85" y1="-1.85" x2="-0.8975" y2="-1.85" width="0.2032" layer="21"/>
<wire x1="1.85" y1="-1.0075" x2="1.85" y2="-1.85" width="0.2032" layer="21"/>
<wire x1="-1.85" y1="-0.58" x2="-1.85" y2="0.58" width="0.2032" layer="21"/>
<smd name="1" x="-2" y="1.4" dx="1.6" dy="0.9" layer="1"/>
<smd name="2" x="2" y="0" dx="1.6" dy="1.3" layer="1"/>
<smd name="3" x="-2" y="-1.4" dx="1.6" dy="0.9" layer="1"/>
<text x="-1.5875" y="2.2225" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.4925" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="3223W">
<description>&lt;b&gt;3 mm SMD Trimming Potentiometer&lt;/b&gt; Top Adjust&lt;p&gt;
Source: http://www.bourns.com/data/global/PDFs/3223.PDF</description>
<wire x1="-1.85" y1="1.5" x2="1.85" y2="1.5" width="0.2032" layer="51"/>
<wire x1="1.85" y1="1.5" x2="1.85" y2="-1.5" width="0.2032" layer="51"/>
<wire x1="1.85" y1="-1.5" x2="-1.85" y2="-1.5" width="0.2032" layer="51"/>
<wire x1="-1.85" y1="-1.5" x2="-1.85" y2="1.5" width="0.2032" layer="51"/>
<wire x1="-1.85" y1="0.0875" x2="-1.85" y2="1.5" width="0.2032" layer="21"/>
<wire x1="-1.85" y1="1.5" x2="-1.0075" y2="1.5" width="0.2032" layer="21"/>
<wire x1="1.0075" y1="1.5" x2="1.85" y2="1.5" width="0.2032" layer="21"/>
<wire x1="1.85" y1="1.5" x2="1.85" y2="0.0875" width="0.2032" layer="21"/>
<wire x1="0.58" y1="-1.5" x2="-0.58" y2="-1.5" width="0.2032" layer="21"/>
<circle x="1.05" y="0.725" radius="0.5255" width="0.1016" layer="21"/>
<smd name="1" x="-1.4" y="-1.215" dx="0.9" dy="1.6" layer="1"/>
<smd name="3" x="1.4" y="-1.215" dx="0.9" dy="1.6" layer="1"/>
<smd name="2" x="0" y="1.215" dx="1.3" dy="1.3" layer="1"/>
<text x="-1.5875" y="2.2225" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.4925" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="0.55" y1="0.6" x2="1.55" y2="0.85" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="TPOT">
<wire x1="-0.762" y1="2.54" x2="-0.762" y2="-2.54" width="0.254" layer="94"/>
<wire x1="0.762" y1="-2.54" x2="0.762" y2="2.54" width="0.254" layer="94"/>
<wire x1="2.54" y1="0" x2="1.651" y2="0" width="0.1524" layer="94"/>
<wire x1="1.651" y1="0" x2="-1.8796" y2="1.7526" width="0.1524" layer="94"/>
<wire x1="0.762" y1="2.54" x2="-0.762" y2="2.54" width="0.254" layer="94"/>
<wire x1="-0.762" y1="-2.54" x2="0.762" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-2.54" x2="-2.54" y2="-0.508" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="-0.508" x2="-3.048" y2="-1.524" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="-0.508" x2="-2.032" y2="-1.524" width="0.1524" layer="94"/>
<wire x1="-2.1597" y1="1.2939" x2="-1.7018" y2="2.2352" width="0.1524" layer="94"/>
<text x="-5.969" y="-3.81" size="1.778" layer="95" rot="R90">&gt;NAME</text>
<text x="-3.81" y="-3.81" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="A" x="0" y="-5.08" visible="pad" length="short" direction="pas" rot="R90"/>
<pin name="E" x="0" y="5.08" visible="pad" length="short" direction="pas" rot="R270"/>
<pin name="S" x="5.08" y="0" visible="pad" length="short" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="TRIM_EU-" prefix="R" uservalue="yes">
<description>&lt;b&gt;POTENTIOMETER&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="TPOT" x="0" y="0"/>
</gates>
<devices>
<device name="B25P" package="B25P">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="B25U" package="B25U">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="B25V" package="B25V">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="B25X" package="B25X">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="B64W" package="B64W">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="B64Y" package="B64Y">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="B90P" package="SP19L">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CA6H" package="CA6H">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CA6V" package="CA6V">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CA9H" package="CA9H">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CA9V" package="CA9V">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CA14V" package="CA14V">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CA14H" package="CA14H">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CT6" package="CT6">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="ECP10P" package="ECP10P">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="ECP10S" package="ECP10S">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="LI10" package="LI10">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="LI15" package="LI15">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="RJ6" package="RJ6">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="RJ6S" package="RJ6S">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="RJ9W" package="RJ9W">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="RS3" package="RS3">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="S43P" package="SP19L">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="S63P" package="S63P">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="S63S" package="S63S">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="S63X" package="S63X">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="S64W" package="S64W">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="S64Y" package="S64Y">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="S75H" package="S75H">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="S75P" package="S75P">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SP19L" package="SP19L">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="ST10" package="ST10">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="ST15" package="ST15">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="T189" package="SP19LKN">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PT10" package="PT-10">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PT10S" package="PT-10S">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="PTSPIN" package="PT-SPIN">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CIP20C-4MM" package="CIP20C-4MM">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CIP20C-6MM" package="CIP20C-6MM">
<connects>
<connect gate="1" pin="A" pad="A"/>
<connect gate="1" pin="E" pad="E"/>
<connect gate="1" pin="S" pad="S"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SM-42/43A" package="SM-42/43A">
<connects>
<connect gate="1" pin="A" pad="1"/>
<connect gate="1" pin="E" pad="3"/>
<connect gate="1" pin="S" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SM-42/43B" package="SM-42/43B">
<connects>
<connect gate="1" pin="A" pad="1"/>
<connect gate="1" pin="E" pad="3"/>
<connect gate="1" pin="S" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SM-42/43W" package="SM-42/43W">
<connects>
<connect gate="1" pin="A" pad="1"/>
<connect gate="1" pin="E" pad="3"/>
<connect gate="1" pin="S" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SM-42/43X" package="SM-42/43X">
<connects>
<connect gate="1" pin="A" pad="1"/>
<connect gate="1" pin="E" pad="3"/>
<connect gate="1" pin="S" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3223G" package="3223G">
<connects>
<connect gate="1" pin="A" pad="1"/>
<connect gate="1" pin="E" pad="3"/>
<connect gate="1" pin="S" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3223J" package="3223J">
<connects>
<connect gate="1" pin="A" pad="1"/>
<connect gate="1" pin="E" pad="3"/>
<connect gate="1" pin="S" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3223W" package="3223W">
<connects>
<connect gate="1" pin="A" pad="1"/>
<connect gate="1" pin="E" pad="3"/>
<connect gate="1" pin="S" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="U$1" library="AS7C34096A" deviceset="AS7C34096A" device=""/>
<part name="U$2" library="Teensy-3.6" deviceset="TEENSY-3.6_FULL" device=""/>
<part name="GND1" library="supply1" deviceset="GND" device=""/>
<part name="GND2" library="supply1" deviceset="GND" device=""/>
<part name="GND3" library="supply1" deviceset="GND" device=""/>
<part name="GND4" library="supply1" deviceset="GND" device=""/>
<part name="GND5" library="supply1" deviceset="GND" device=""/>
<part name="GND6" library="supply1" deviceset="GND" device=""/>
<part name="JP1" library="pinhead" deviceset="PINHD-1X10" device=""/>
<part name="GND7" library="supply1" deviceset="GND" device=""/>
<part name="Q1" library="transistor-npn" deviceset="2N2222*" device="" technology="A"/>
<part name="R1" library="rcl" deviceset="R-EU_" device="R0603" value="1K"/>
<part name="R2" library="rcl" deviceset="R-EU_" device="R0603" value="4K7"/>
<part name="GND8" library="supply1" deviceset="GND" device=""/>
<part name="UP" library="DTS-3" deviceset="DTS-3" device=""/>
<part name="DOWN" library="DTS-3" deviceset="DTS-3" device=""/>
<part name="LEFT" library="DTS-3" deviceset="DTS-3" device=""/>
<part name="RIGHT" library="DTS-3" deviceset="DTS-3" device=""/>
<part name="A" library="DTS-3" deviceset="DTS-3" device=""/>
<part name="B" library="DTS-3" deviceset="DTS-3" device=""/>
<part name="START" library="DTS-3" deviceset="DTS-3" device=""/>
<part name="SELECT" library="DTS-3" deviceset="DTS-3" device=""/>
<part name="GND9" library="supply1" deviceset="GND" device=""/>
<part name="R3" library="rcl" deviceset="R-EU_" device="R0603" value="10K"/>
<part name="R4" library="rcl" deviceset="R-EU_" device="R0603" value="10K"/>
<part name="R5" library="rcl" deviceset="R-EU_" device="R0603" value="10K"/>
<part name="R6" library="rcl" deviceset="R-EU_" device="R0603" value="10K"/>
<part name="R7" library="rcl" deviceset="R-EU_" device="R0603" value="10K"/>
<part name="R8" library="rcl" deviceset="R-EU_" device="R0603" value="10K"/>
<part name="R9" library="rcl" deviceset="R-EU_" device="R0603" value="10K"/>
<part name="R10" library="rcl" deviceset="R-EU_" device="R0603" value="10K"/>
<part name="U1" library="lm4875" deviceset="LM4875" device=""/>
<part name="C1" library="rcl" deviceset="C-EU" device="C0603K" value="100nf"/>
<part name="C2" library="rcl" deviceset="C-EU" device="C0603K" value="10uf"/>
<part name="GND10" library="supply1" deviceset="GND" device=""/>
<part name="GND11" library="supply1" deviceset="GND" device=""/>
<part name="C3" library="rcl" deviceset="C-EU" device="C0603K" value="10uf"/>
<part name="GND12" library="supply1" deviceset="GND" device=""/>
<part name="C4" library="rcl" deviceset="C-EU" device="C0603K" value="220nf"/>
<part name="C5" library="rcl" deviceset="C-EU" device="C0603K" value="330nf"/>
<part name="GND13" library="supply1" deviceset="GND" device=""/>
<part name="R11" library="rcl" deviceset="R-EU_" device="R0603" value="100K"/>
<part name="GND14" library="supply1" deviceset="GND" device=""/>
<part name="SPK" library="pinhead" deviceset="PINHD-1X2" device=""/>
<part name="R13" library="pot" deviceset="TRIM_EU-" device="CT6" value="27K"/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="U$1" gate="G$1" x="17.78" y="203.2"/>
<instance part="U$2" gate="G$1" x="-7.62" y="157.48"/>
<instance part="GND1" gate="1" x="40.64" y="177.8"/>
<instance part="GND2" gate="1" x="-27.94" y="149.86"/>
<instance part="GND3" gate="1" x="63.5" y="106.68"/>
<instance part="GND4" gate="1" x="-27.94" y="45.72"/>
<instance part="GND5" gate="1" x="-27.94" y="0"/>
<instance part="GND6" gate="1" x="71.12" y="147.32"/>
<instance part="JP1" gate="A" x="-35.56" y="203.2"/>
<instance part="GND7" gate="1" x="-43.18" y="180.34"/>
<instance part="Q1" gate="G$1" x="-73.66" y="205.74"/>
<instance part="R1" gate="G$1" x="-88.9" y="205.74"/>
<instance part="R2" gate="G$1" x="-81.28" y="198.12" rot="R90"/>
<instance part="GND8" gate="1" x="-76.2" y="187.96"/>
<instance part="UP" gate="G$1" x="134.62" y="180.34"/>
<instance part="DOWN" gate="G$1" x="134.62" y="167.64"/>
<instance part="LEFT" gate="G$1" x="134.62" y="154.94"/>
<instance part="RIGHT" gate="G$1" x="134.62" y="142.24"/>
<instance part="A" gate="G$1" x="134.62" y="116.84"/>
<instance part="B" gate="G$1" x="134.62" y="104.14"/>
<instance part="START" gate="G$1" x="134.62" y="83.82"/>
<instance part="SELECT" gate="G$1" x="134.62" y="71.12"/>
<instance part="GND9" gate="1" x="144.78" y="60.96"/>
<instance part="R3" gate="G$1" x="124.46" y="182.88" rot="R90"/>
<instance part="R4" gate="G$1" x="124.46" y="170.18" rot="R90"/>
<instance part="R5" gate="G$1" x="124.46" y="157.48" rot="R90"/>
<instance part="R6" gate="G$1" x="124.46" y="144.78" rot="R90"/>
<instance part="R7" gate="G$1" x="124.46" y="119.38" rot="R90"/>
<instance part="R8" gate="G$1" x="124.46" y="106.68" rot="R90"/>
<instance part="R9" gate="G$1" x="124.46" y="86.36" rot="R90"/>
<instance part="R10" gate="G$1" x="124.46" y="73.66" rot="R90"/>
<instance part="U1" gate="G$1" x="127" y="241.3"/>
<instance part="C1" gate="G$1" x="96.52" y="269.24"/>
<instance part="C2" gate="G$1" x="106.68" y="269.24"/>
<instance part="GND10" gate="1" x="101.6" y="256.54"/>
<instance part="GND11" gate="1" x="132.08" y="223.52"/>
<instance part="C3" gate="G$1" x="129.54" y="259.08"/>
<instance part="GND12" gate="1" x="124.46" y="269.24"/>
<instance part="C4" gate="G$1" x="96.52" y="243.84" rot="R90"/>
<instance part="C5" gate="G$1" x="88.9" y="236.22" rot="R180"/>
<instance part="GND13" gate="1" x="88.9" y="228.6"/>
<instance part="R11" gate="G$1" x="106.68" y="238.76" rot="R180"/>
<instance part="GND14" gate="1" x="101.6" y="208.28"/>
<instance part="SPK" gate="G$1" x="162.56" y="238.76"/>
<instance part="R13" gate="1" x="101.6" y="220.98"/>
</instances>
<busses>
</busses>
<nets>
<net name="DIO0" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D2/PWM"/>
<wire x1="-15.24" y1="139.7" x2="-30.48" y2="139.7" width="0.1524" layer="91"/>
<junction x="-15.24" y="139.7"/>
<label x="-30.48" y="139.7" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="I/O1"/>
<wire x1="38.1" y1="223.52" x2="48.26" y2="223.52" width="0.1524" layer="91"/>
<junction x="38.1" y="223.52"/>
<label x="48.26" y="223.52" size="1.778" layer="95"/>
</segment>
</net>
<net name="DIO1" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D3/SCL2/CAN0TX/PWM"/>
<wire x1="-15.24" y1="137.16" x2="-30.48" y2="137.16" width="0.1524" layer="91"/>
<junction x="-15.24" y="137.16"/>
<label x="-30.48" y="137.16" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="I/O2"/>
<wire x1="38.1" y1="220.98" x2="48.26" y2="220.98" width="0.1524" layer="91"/>
<junction x="38.1" y="220.98"/>
<label x="48.26" y="220.98" size="1.778" layer="95"/>
</segment>
</net>
<net name="DIO2" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D4/SDA2/CAN0RX/PWM"/>
<wire x1="-15.24" y1="134.62" x2="-30.48" y2="134.62" width="0.1524" layer="91"/>
<junction x="-15.24" y="134.62"/>
<label x="-30.48" y="134.62" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="I/O3"/>
<wire x1="38.1" y1="218.44" x2="48.26" y2="218.44" width="0.1524" layer="91"/>
<junction x="38.1" y="218.44"/>
<label x="48.26" y="218.44" size="1.778" layer="95"/>
</segment>
</net>
<net name="DIO3" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D5/(MISO)/(TX1)/PWM"/>
<wire x1="-15.24" y1="132.08" x2="-30.48" y2="132.08" width="0.1524" layer="91"/>
<junction x="-15.24" y="132.08"/>
<label x="-30.48" y="132.08" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="I/O4"/>
<wire x1="38.1" y1="215.9" x2="48.26" y2="215.9" width="0.1524" layer="91"/>
<junction x="38.1" y="215.9"/>
<label x="48.26" y="215.9" size="1.778" layer="95"/>
</segment>
</net>
<net name="DIO4" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D6/PWM"/>
<wire x1="-15.24" y1="129.54" x2="-30.48" y2="129.54" width="0.1524" layer="91"/>
<junction x="-15.24" y="129.54"/>
<label x="-30.48" y="129.54" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="I/O5"/>
<wire x1="38.1" y1="213.36" x2="48.26" y2="213.36" width="0.1524" layer="91"/>
<junction x="38.1" y="213.36"/>
<label x="48.26" y="213.36" size="1.778" layer="95"/>
</segment>
</net>
<net name="DIO5" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D7/(SCL0)/(MOSI0)/RX3/PWM"/>
<wire x1="-15.24" y1="127" x2="-30.48" y2="127" width="0.1524" layer="91"/>
<junction x="-15.24" y="127"/>
<label x="-30.48" y="127" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="I/O6"/>
<wire x1="38.1" y1="210.82" x2="48.26" y2="210.82" width="0.1524" layer="91"/>
<junction x="38.1" y="210.82"/>
<label x="48.26" y="210.82" size="1.778" layer="95"/>
</segment>
</net>
<net name="DIO6" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D8/(SDA0)/(MISO0)/TX3/PWM"/>
<wire x1="-15.24" y1="124.46" x2="-30.48" y2="124.46" width="0.1524" layer="91"/>
<junction x="-15.24" y="124.46"/>
<label x="-30.48" y="124.46" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="I/O7"/>
<wire x1="38.1" y1="208.28" x2="48.26" y2="208.28" width="0.1524" layer="91"/>
<junction x="38.1" y="208.28"/>
<label x="48.26" y="208.28" size="1.778" layer="95"/>
</segment>
</net>
<net name="DIO7" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D9/CS0/RX2/PWM"/>
<wire x1="-15.24" y1="121.92" x2="-30.48" y2="121.92" width="0.1524" layer="91"/>
<junction x="-15.24" y="121.92"/>
<label x="-30.48" y="121.92" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="I/O8"/>
<wire x1="38.1" y1="205.74" x2="48.26" y2="205.74" width="0.1524" layer="91"/>
<junction x="38.1" y="205.74"/>
<label x="48.26" y="205.74" size="1.778" layer="95"/>
</segment>
</net>
<net name="ADD1" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D1/TOUCH/MISO1/TX1"/>
<wire x1="-15.24" y1="142.24" x2="-30.48" y2="142.24" width="0.1524" layer="91"/>
<junction x="-15.24" y="142.24"/>
<label x="-30.48" y="142.24" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="A1"/>
<wire x1="2.54" y1="220.98" x2="-7.62" y2="220.98" width="0.1524" layer="91"/>
<junction x="2.54" y="220.98"/>
<label x="-7.62" y="220.98" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="ADD0" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D0/TOUCH/MOSI1/RX1"/>
<wire x1="-15.24" y1="144.78" x2="-30.48" y2="144.78" width="0.1524" layer="91"/>
<junction x="-15.24" y="144.78"/>
<label x="-30.48" y="144.78" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="A0"/>
<wire x1="2.54" y1="223.52" x2="-7.62" y2="223.52" width="0.1524" layer="91"/>
<junction x="2.54" y="223.52"/>
<label x="-7.62" y="223.52" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="ADD2" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D24"/>
<wire x1="-15.24" y1="104.14" x2="-30.48" y2="104.14" width="0.1524" layer="91"/>
<junction x="-15.24" y="104.14"/>
<label x="-30.48" y="104.14" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="A2"/>
<wire x1="2.54" y1="218.44" x2="-7.62" y2="218.44" width="0.1524" layer="91"/>
<junction x="2.54" y="218.44"/>
<label x="-7.62" y="218.44" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="ADD3" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D25"/>
<wire x1="-15.24" y1="101.6" x2="-30.48" y2="101.6" width="0.1524" layer="91"/>
<junction x="-15.24" y="101.6"/>
<label x="-30.48" y="101.6" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="A3"/>
<wire x1="2.54" y1="215.9" x2="-7.62" y2="215.9" width="0.1524" layer="91"/>
<junction x="2.54" y="215.9"/>
<label x="-7.62" y="215.9" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="ADD4" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D31/A12/CS1/RX4"/>
<wire x1="-15.24" y1="86.36" x2="-30.48" y2="86.36" width="0.1524" layer="91"/>
<junction x="-15.24" y="86.36"/>
<label x="-30.48" y="86.36" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="A4"/>
<wire x1="2.54" y1="213.36" x2="-7.62" y2="213.36" width="0.1524" layer="91"/>
<junction x="2.54" y="213.36"/>
<label x="-7.62" y="213.36" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="ADD5" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D32/A13/SCK1/TX4"/>
<wire x1="-15.24" y1="83.82" x2="-30.48" y2="83.82" width="0.1524" layer="91"/>
<junction x="-15.24" y="83.82"/>
<label x="-30.48" y="83.82" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="A5"/>
<wire x1="2.54" y1="210.82" x2="-7.62" y2="210.82" width="0.1524" layer="91"/>
<junction x="2.54" y="210.82"/>
<label x="-7.62" y="210.82" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="ADD6" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D40"/>
<wire x1="-15.24" y1="27.94" x2="-30.48" y2="27.94" width="0.1524" layer="91"/>
<junction x="-15.24" y="27.94"/>
<label x="-30.48" y="27.94" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="A6"/>
<wire x1="2.54" y1="208.28" x2="-7.62" y2="208.28" width="0.1524" layer="91"/>
<junction x="2.54" y="208.28"/>
<label x="-7.62" y="208.28" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="ADD7" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D41"/>
<wire x1="-15.24" y1="25.4" x2="-30.48" y2="25.4" width="0.1524" layer="91"/>
<junction x="-15.24" y="25.4"/>
<label x="-30.48" y="25.4" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="A7"/>
<wire x1="2.54" y1="205.74" x2="-7.62" y2="205.74" width="0.1524" layer="91"/>
<junction x="2.54" y="205.74"/>
<label x="-7.62" y="205.74" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="ADD8" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D42"/>
<wire x1="-15.24" y1="22.86" x2="-30.48" y2="22.86" width="0.1524" layer="91"/>
<junction x="-15.24" y="22.86"/>
<label x="-30.48" y="22.86" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="A8"/>
<wire x1="2.54" y1="203.2" x2="-7.62" y2="203.2" width="0.1524" layer="91"/>
<junction x="2.54" y="203.2"/>
<label x="-7.62" y="203.2" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="ADD9" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D43/CS2"/>
<wire x1="-15.24" y1="17.78" x2="-30.48" y2="17.78" width="0.1524" layer="91"/>
<junction x="-15.24" y="17.78"/>
<label x="-30.48" y="17.78" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="A9"/>
<wire x1="2.54" y1="200.66" x2="-7.62" y2="200.66" width="0.1524" layer="91"/>
<junction x="2.54" y="200.66"/>
<label x="-7.62" y="200.66" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="ADD10" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D44/MOSI2"/>
<wire x1="-15.24" y1="15.24" x2="-30.48" y2="15.24" width="0.1524" layer="91"/>
<junction x="-15.24" y="15.24"/>
<label x="-30.48" y="15.24" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="A10"/>
<wire x1="2.54" y1="198.12" x2="-7.62" y2="198.12" width="0.1524" layer="91"/>
<junction x="2.54" y="198.12"/>
<label x="-7.62" y="198.12" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="ADD11" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D45/MISO2"/>
<wire x1="-15.24" y1="12.7" x2="-30.48" y2="12.7" width="0.1524" layer="91"/>
<junction x="-15.24" y="12.7"/>
<label x="-30.48" y="12.7" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="A11"/>
<wire x1="2.54" y1="195.58" x2="-7.62" y2="195.58" width="0.1524" layer="91"/>
<junction x="2.54" y="195.58"/>
<label x="-7.62" y="195.58" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="ADD12" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D46/SCK2"/>
<wire x1="-15.24" y1="10.16" x2="-30.48" y2="10.16" width="0.1524" layer="91"/>
<junction x="-15.24" y="10.16"/>
<label x="-30.48" y="10.16" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="A12"/>
<wire x1="2.54" y1="193.04" x2="-7.62" y2="193.04" width="0.1524" layer="91"/>
<junction x="2.54" y="193.04"/>
<label x="-7.62" y="193.04" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="ADD13" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D47/RX6/(SCL0)"/>
<wire x1="55.88" y1="10.16" x2="71.12" y2="10.16" width="0.1524" layer="91"/>
<junction x="55.88" y="10.16"/>
<label x="71.12" y="10.16" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="A13"/>
<wire x1="2.54" y1="190.5" x2="-7.62" y2="190.5" width="0.1524" layer="91"/>
<junction x="2.54" y="190.5"/>
<label x="-7.62" y="190.5" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="ADD14" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D48/TX6/(SDA0)"/>
<wire x1="55.88" y1="12.7" x2="71.12" y2="12.7" width="0.1524" layer="91"/>
<junction x="55.88" y="12.7"/>
<label x="71.12" y="12.7" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="A14"/>
<wire x1="2.54" y1="187.96" x2="-7.62" y2="187.96" width="0.1524" layer="91"/>
<junction x="2.54" y="187.96"/>
<label x="-7.62" y="187.96" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="ADD15" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D49/A23"/>
<wire x1="55.88" y1="15.24" x2="71.12" y2="15.24" width="0.1524" layer="91"/>
<junction x="55.88" y="15.24"/>
<label x="71.12" y="15.24" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="A15"/>
<wire x1="2.54" y1="185.42" x2="-7.62" y2="185.42" width="0.1524" layer="91"/>
<junction x="2.54" y="185.42"/>
<label x="-7.62" y="185.42" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="ADD16" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D50/A24"/>
<wire x1="55.88" y1="17.78" x2="71.12" y2="17.78" width="0.1524" layer="91"/>
<junction x="55.88" y="17.78"/>
<label x="71.12" y="17.78" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="A16"/>
<wire x1="2.54" y1="182.88" x2="-7.62" y2="182.88" width="0.1524" layer="91"/>
<junction x="2.54" y="182.88"/>
<label x="-7.62" y="182.88" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="ADD17" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D51/(MISO2)"/>
<wire x1="55.88" y1="22.86" x2="71.12" y2="22.86" width="0.1524" layer="91"/>
<junction x="55.88" y="22.86"/>
<label x="71.12" y="22.86" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="A17"/>
<wire x1="2.54" y1="180.34" x2="-7.62" y2="180.34" width="0.1524" layer="91"/>
<junction x="2.54" y="180.34"/>
<label x="-7.62" y="180.34" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="ADD18" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D52/(MOSI2)"/>
<wire x1="55.88" y1="25.4" x2="71.12" y2="25.4" width="0.1524" layer="91"/>
<junction x="55.88" y="25.4"/>
<label x="71.12" y="25.4" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="A18"/>
<wire x1="2.54" y1="177.8" x2="-7.62" y2="177.8" width="0.1524" layer="91"/>
<junction x="2.54" y="177.8"/>
<label x="-7.62" y="177.8" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="CE" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D28"/>
<wire x1="-15.24" y1="93.98" x2="-30.48" y2="93.98" width="0.1524" layer="91"/>
<junction x="-15.24" y="93.98"/>
<label x="-30.48" y="93.98" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="CE"/>
<wire x1="38.1" y1="200.66" x2="48.26" y2="200.66" width="0.1524" layer="91"/>
<junction x="38.1" y="200.66"/>
<label x="48.26" y="200.66" size="1.778" layer="95"/>
</segment>
</net>
<net name="WE" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D29/TOUCH/(CAN0TX)/PWM"/>
<wire x1="-15.24" y1="91.44" x2="-30.48" y2="91.44" width="0.1524" layer="91"/>
<junction x="-15.24" y="91.44"/>
<label x="-30.48" y="91.44" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="WE"/>
<wire x1="38.1" y1="198.12" x2="48.26" y2="198.12" width="0.1524" layer="91"/>
<junction x="38.1" y="198.12"/>
<label x="48.26" y="198.12" size="1.778" layer="95"/>
</segment>
</net>
<net name="OE" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D30/TOUCH/(CAN0RX)/PWM"/>
<wire x1="-15.24" y1="88.9" x2="-30.48" y2="88.9" width="0.1524" layer="91"/>
<junction x="-15.24" y="88.9"/>
<label x="-30.48" y="88.9" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="OE"/>
<wire x1="38.1" y1="195.58" x2="48.26" y2="195.58" width="0.1524" layer="91"/>
<junction x="38.1" y="195.58"/>
<label x="48.26" y="195.58" size="1.778" layer="95"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="GND@7"/>
<pinref part="GND5" gate="1" pin="GND"/>
<wire x1="-15.24" y1="7.62" x2="-27.94" y2="7.62" width="0.1524" layer="91"/>
<wire x1="-27.94" y1="7.62" x2="-27.94" y2="2.54" width="0.1524" layer="91"/>
<junction x="-15.24" y="7.62"/>
<junction x="-27.94" y="2.54"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="GND@6"/>
<wire x1="-15.24" y1="40.64" x2="-22.86" y2="40.64" width="0.1524" layer="91"/>
<wire x1="-22.86" y1="40.64" x2="-22.86" y2="50.8" width="0.1524" layer="91"/>
<pinref part="GND4" gate="1" pin="GND"/>
<wire x1="-22.86" y1="50.8" x2="-27.94" y2="50.8" width="0.1524" layer="91"/>
<wire x1="-27.94" y1="50.8" x2="-27.94" y2="48.26" width="0.1524" layer="91"/>
<junction x="-27.94" y="48.26"/>
<junction x="-15.24" y="40.64"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="GND@2"/>
<wire x1="55.88" y1="109.22" x2="60.96" y2="109.22" width="0.1524" layer="91"/>
<wire x1="60.96" y1="109.22" x2="60.96" y2="111.76" width="0.1524" layer="91"/>
<pinref part="GND3" gate="1" pin="GND"/>
<wire x1="60.96" y1="111.76" x2="63.5" y2="111.76" width="0.1524" layer="91"/>
<wire x1="63.5" y1="111.76" x2="63.5" y2="109.22" width="0.1524" layer="91"/>
<junction x="55.88" y="109.22"/>
<junction x="63.5" y="109.22"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="GND@1"/>
<wire x1="-15.24" y1="147.32" x2="-22.86" y2="147.32" width="0.1524" layer="91"/>
<wire x1="-22.86" y1="147.32" x2="-22.86" y2="154.94" width="0.1524" layer="91"/>
<pinref part="GND2" gate="1" pin="GND"/>
<wire x1="-22.86" y1="154.94" x2="-27.94" y2="154.94" width="0.1524" layer="91"/>
<wire x1="-27.94" y1="154.94" x2="-27.94" y2="152.4" width="0.1524" layer="91"/>
<junction x="-27.94" y="152.4"/>
<junction x="-15.24" y="147.32"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="GND"/>
<pinref part="GND1" gate="1" pin="GND"/>
<wire x1="38.1" y1="182.88" x2="40.64" y2="182.88" width="0.1524" layer="91"/>
<wire x1="40.64" y1="182.88" x2="40.64" y2="180.34" width="0.1524" layer="91"/>
<junction x="38.1" y="182.88"/>
<junction x="40.64" y="180.34"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="AGND"/>
<wire x1="55.88" y1="144.78" x2="66.04" y2="144.78" width="0.1524" layer="91"/>
<wire x1="66.04" y1="144.78" x2="66.04" y2="152.4" width="0.1524" layer="91"/>
<pinref part="GND6" gate="1" pin="GND"/>
<wire x1="66.04" y1="152.4" x2="71.12" y2="152.4" width="0.1524" layer="91"/>
<wire x1="71.12" y1="152.4" x2="71.12" y2="149.86" width="0.1524" layer="91"/>
<junction x="55.88" y="144.78"/>
<junction x="71.12" y="149.86"/>
</segment>
<segment>
<pinref part="JP1" gate="A" pin="10"/>
<pinref part="GND7" gate="1" pin="GND"/>
<wire x1="-38.1" y1="190.5" x2="-43.18" y2="190.5" width="0.1524" layer="91"/>
<wire x1="-43.18" y1="190.5" x2="-43.18" y2="182.88" width="0.1524" layer="91"/>
<junction x="-38.1" y="190.5"/>
<junction x="-43.18" y="182.88"/>
</segment>
<segment>
<pinref part="R2" gate="G$1" pin="1"/>
<wire x1="-81.28" y1="193.04" x2="-81.28" y2="190.5" width="0.1524" layer="91"/>
<pinref part="GND8" gate="1" pin="GND"/>
<wire x1="-81.28" y1="190.5" x2="-76.2" y2="190.5" width="0.1524" layer="91"/>
<pinref part="Q1" gate="G$1" pin="E"/>
<wire x1="-76.2" y1="190.5" x2="-71.12" y2="190.5" width="0.1524" layer="91"/>
<wire x1="-71.12" y1="190.5" x2="-71.12" y2="200.66" width="0.1524" layer="91"/>
<junction x="-81.28" y="193.04"/>
<junction x="-76.2" y="190.5"/>
<junction x="-71.12" y="200.66"/>
</segment>
<segment>
<pinref part="UP" gate="G$1" pin="P$2"/>
<pinref part="GND9" gate="1" pin="GND"/>
<wire x1="139.7" y1="177.8" x2="144.78" y2="177.8" width="0.1524" layer="91"/>
<wire x1="144.78" y1="177.8" x2="144.78" y2="165.1" width="0.1524" layer="91"/>
<pinref part="DOWN" gate="G$1" pin="P$2"/>
<wire x1="144.78" y1="165.1" x2="144.78" y2="152.4" width="0.1524" layer="91"/>
<wire x1="144.78" y1="152.4" x2="144.78" y2="139.7" width="0.1524" layer="91"/>
<wire x1="144.78" y1="139.7" x2="144.78" y2="114.3" width="0.1524" layer="91"/>
<wire x1="144.78" y1="114.3" x2="144.78" y2="101.6" width="0.1524" layer="91"/>
<wire x1="144.78" y1="101.6" x2="144.78" y2="81.28" width="0.1524" layer="91"/>
<wire x1="144.78" y1="81.28" x2="144.78" y2="68.58" width="0.1524" layer="91"/>
<wire x1="144.78" y1="68.58" x2="144.78" y2="63.5" width="0.1524" layer="91"/>
<wire x1="139.7" y1="165.1" x2="144.78" y2="165.1" width="0.1524" layer="91"/>
<pinref part="LEFT" gate="G$1" pin="P$2"/>
<wire x1="139.7" y1="152.4" x2="144.78" y2="152.4" width="0.1524" layer="91"/>
<pinref part="RIGHT" gate="G$1" pin="P$2"/>
<wire x1="139.7" y1="139.7" x2="144.78" y2="139.7" width="0.1524" layer="91"/>
<pinref part="A" gate="G$1" pin="P$2"/>
<wire x1="139.7" y1="114.3" x2="144.78" y2="114.3" width="0.1524" layer="91"/>
<pinref part="B" gate="G$1" pin="P$2"/>
<wire x1="139.7" y1="101.6" x2="144.78" y2="101.6" width="0.1524" layer="91"/>
<pinref part="START" gate="G$1" pin="P$2"/>
<wire x1="139.7" y1="81.28" x2="144.78" y2="81.28" width="0.1524" layer="91"/>
<pinref part="SELECT" gate="G$1" pin="P$2"/>
<wire x1="139.7" y1="68.58" x2="144.78" y2="68.58" width="0.1524" layer="91"/>
<junction x="144.78" y="63.5"/>
<junction x="144.78" y="68.58"/>
<junction x="139.7" y="68.58"/>
<junction x="139.7" y="81.28"/>
<junction x="144.78" y="81.28"/>
<junction x="139.7" y="101.6"/>
<junction x="144.78" y="101.6"/>
<junction x="144.78" y="114.3"/>
<junction x="139.7" y="114.3"/>
<junction x="144.78" y="139.7"/>
<junction x="139.7" y="139.7"/>
<junction x="144.78" y="152.4"/>
<junction x="139.7" y="152.4"/>
<junction x="144.78" y="165.1"/>
<junction x="139.7" y="165.1"/>
<junction x="139.7" y="177.8"/>
</segment>
<segment>
<pinref part="C1" gate="G$1" pin="2"/>
<wire x1="96.52" y1="264.16" x2="96.52" y2="261.62" width="0.1524" layer="91"/>
<pinref part="GND10" gate="1" pin="GND"/>
<wire x1="96.52" y1="261.62" x2="101.6" y2="261.62" width="0.1524" layer="91"/>
<wire x1="101.6" y1="259.08" x2="101.6" y2="261.62" width="0.1524" layer="91"/>
<pinref part="C2" gate="G$1" pin="2"/>
<wire x1="101.6" y1="261.62" x2="106.68" y2="261.62" width="0.1524" layer="91"/>
<wire x1="106.68" y1="261.62" x2="106.68" y2="264.16" width="0.1524" layer="91"/>
<junction x="101.6" y="259.08"/>
<junction x="101.6" y="261.62"/>
<junction x="96.52" y="264.16"/>
<junction x="106.68" y="264.16"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="GND@"/>
<pinref part="GND11" gate="1" pin="GND"/>
<wire x1="142.24" y1="238.76" x2="132.08" y2="238.76" width="0.1524" layer="91"/>
<wire x1="132.08" y1="238.76" x2="132.08" y2="226.06" width="0.1524" layer="91"/>
<junction x="132.08" y="226.06"/>
<junction x="142.24" y="238.76"/>
</segment>
<segment>
<pinref part="GND12" gate="1" pin="GND"/>
<wire x1="124.46" y1="271.78" x2="124.46" y2="274.32" width="0.1524" layer="91"/>
<pinref part="C3" gate="G$1" pin="1"/>
<wire x1="124.46" y1="274.32" x2="129.54" y2="274.32" width="0.1524" layer="91"/>
<wire x1="129.54" y1="274.32" x2="129.54" y2="261.62" width="0.1524" layer="91"/>
<junction x="124.46" y="271.78"/>
<junction x="129.54" y="261.62"/>
</segment>
<segment>
<pinref part="GND13" gate="1" pin="GND"/>
<pinref part="C5" gate="G$1" pin="1"/>
<wire x1="88.9" y1="231.14" x2="88.9" y2="233.68" width="0.1524" layer="91"/>
<junction x="88.9" y="233.68"/>
<junction x="88.9" y="231.14"/>
</segment>
<segment>
<pinref part="GND14" gate="1" pin="GND"/>
<junction x="101.6" y="210.82"/>
<pinref part="R13" gate="1" pin="A"/>
<wire x1="101.6" y1="210.82" x2="101.6" y2="215.9" width="0.1524" layer="91"/>
<junction x="101.6" y="215.9"/>
</segment>
</net>
<net name="3V3" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="3V3(MAX_250MILLIA.)"/>
<wire x1="55.88" y1="142.24" x2="71.12" y2="142.24" width="0.1524" layer="91"/>
<junction x="55.88" y="142.24"/>
<label x="71.12" y="142.24" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="VCC"/>
<wire x1="38.1" y1="187.96" x2="48.26" y2="187.96" width="0.1524" layer="91"/>
<junction x="38.1" y="187.96"/>
<label x="48.26" y="187.96" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="3V3@1"/>
<wire x1="-15.24" y1="109.22" x2="-30.48" y2="109.22" width="0.1524" layer="91"/>
<junction x="-15.24" y="109.22"/>
<label x="-30.48" y="109.22" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="3V3@3"/>
<wire x1="55.88" y1="7.62" x2="71.12" y2="7.62" width="0.1524" layer="91"/>
<junction x="55.88" y="7.62"/>
<label x="71.12" y="7.62" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="R10" gate="G$1" pin="2"/>
<wire x1="124.46" y1="78.74" x2="134.62" y2="78.74" width="0.1524" layer="91"/>
<wire x1="134.62" y1="78.74" x2="134.62" y2="91.44" width="0.1524" layer="91"/>
<pinref part="R3" gate="G$1" pin="2"/>
<wire x1="134.62" y1="91.44" x2="134.62" y2="111.76" width="0.1524" layer="91"/>
<wire x1="134.62" y1="111.76" x2="134.62" y2="124.46" width="0.1524" layer="91"/>
<wire x1="134.62" y1="124.46" x2="134.62" y2="149.86" width="0.1524" layer="91"/>
<wire x1="134.62" y1="149.86" x2="134.62" y2="162.56" width="0.1524" layer="91"/>
<wire x1="134.62" y1="162.56" x2="134.62" y2="175.26" width="0.1524" layer="91"/>
<wire x1="134.62" y1="175.26" x2="134.62" y2="187.96" width="0.1524" layer="91"/>
<wire x1="124.46" y1="187.96" x2="134.62" y2="187.96" width="0.1524" layer="91"/>
<pinref part="R4" gate="G$1" pin="2"/>
<wire x1="124.46" y1="175.26" x2="134.62" y2="175.26" width="0.1524" layer="91"/>
<pinref part="R5" gate="G$1" pin="2"/>
<wire x1="124.46" y1="162.56" x2="134.62" y2="162.56" width="0.1524" layer="91"/>
<pinref part="R6" gate="G$1" pin="2"/>
<wire x1="124.46" y1="149.86" x2="134.62" y2="149.86" width="0.1524" layer="91"/>
<pinref part="R7" gate="G$1" pin="2"/>
<wire x1="124.46" y1="124.46" x2="134.62" y2="124.46" width="0.1524" layer="91"/>
<pinref part="R8" gate="G$1" pin="2"/>
<wire x1="124.46" y1="111.76" x2="134.62" y2="111.76" width="0.1524" layer="91"/>
<pinref part="R9" gate="G$1" pin="2"/>
<wire x1="124.46" y1="91.44" x2="134.62" y2="91.44" width="0.1524" layer="91"/>
<junction x="124.46" y="78.74"/>
<junction x="124.46" y="91.44"/>
<junction x="134.62" y="91.44"/>
<junction x="134.62" y="111.76"/>
<junction x="124.46" y="111.76"/>
<junction x="124.46" y="124.46"/>
<junction x="134.62" y="124.46"/>
<junction x="124.46" y="149.86"/>
<junction x="134.62" y="149.86"/>
<junction x="134.62" y="162.56"/>
<junction x="124.46" y="162.56"/>
<junction x="134.62" y="175.26"/>
<junction x="124.46" y="175.26"/>
<junction x="134.62" y="187.96"/>
<junction x="124.46" y="187.96"/>
<wire x1="134.62" y1="187.96" x2="134.62" y2="193.04" width="0.1524" layer="91"/>
<label x="134.62" y="193.04" size="1.778" layer="95"/>
</segment>
</net>
<net name="5V" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="VIN(3.6-6V)"/>
<wire x1="55.88" y1="147.32" x2="60.96" y2="147.32" width="0.1524" layer="91"/>
<wire x1="60.96" y1="147.32" x2="60.96" y2="157.48" width="0.1524" layer="91"/>
<wire x1="60.96" y1="157.48" x2="71.12" y2="157.48" width="0.1524" layer="91"/>
<junction x="55.88" y="147.32"/>
<label x="71.12" y="157.48" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="JP1" gate="A" pin="9"/>
<wire x1="-38.1" y1="193.04" x2="-50.8" y2="193.04" width="0.1524" layer="91"/>
<label x="-50.8" y="193.04" size="1.778" layer="95" rot="R180"/>
<junction x="-38.1" y="193.04"/>
</segment>
<segment>
<pinref part="C1" gate="G$1" pin="1"/>
<wire x1="96.52" y1="271.78" x2="96.52" y2="274.32" width="0.1524" layer="91"/>
<pinref part="C2" gate="G$1" pin="1"/>
<wire x1="96.52" y1="274.32" x2="101.6" y2="274.32" width="0.1524" layer="91"/>
<wire x1="106.68" y1="271.78" x2="106.68" y2="274.32" width="0.1524" layer="91"/>
<wire x1="106.68" y1="274.32" x2="101.6" y2="274.32" width="0.1524" layer="91"/>
<wire x1="101.6" y1="274.32" x2="101.6" y2="279.4" width="0.1524" layer="91"/>
<junction x="106.68" y="271.78"/>
<junction x="101.6" y="274.32"/>
<junction x="96.52" y="271.78"/>
<label x="101.6" y="279.4" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="VDD"/>
<wire x1="114.3" y1="248.92" x2="111.76" y2="248.92" width="0.1524" layer="91"/>
<wire x1="111.76" y1="248.92" x2="111.76" y2="259.08" width="0.1524" layer="91"/>
<junction x="114.3" y="248.92"/>
<label x="111.76" y="259.08" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="R11" gate="G$1" pin="2"/>
<wire x1="101.6" y1="238.76" x2="96.52" y2="238.76" width="0.1524" layer="91"/>
<junction x="101.6" y="238.76"/>
<label x="96.52" y="238.76" size="1.778" layer="95" rot="R180"/>
<wire x1="101.6" y1="226.06" x2="101.6" y2="238.76" width="0.1524" layer="91"/>
<pinref part="R13" gate="1" pin="E"/>
<junction x="101.6" y="226.06"/>
</segment>
</net>
<net name="DC" class="0">
<segment>
<pinref part="JP1" gate="A" pin="8"/>
<wire x1="-38.1" y1="195.58" x2="-50.8" y2="195.58" width="0.1524" layer="91"/>
<junction x="-38.1" y="195.58"/>
<label x="-50.8" y="195.58" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="D15/A1/TOUCH/CS0"/>
<wire x1="55.88" y1="119.38" x2="71.12" y2="119.38" width="0.1524" layer="91"/>
<junction x="55.88" y="119.38"/>
<label x="71.12" y="119.38" size="1.778" layer="95"/>
</segment>
</net>
<net name="RST" class="0">
<segment>
<pinref part="JP1" gate="A" pin="7"/>
<wire x1="-38.1" y1="198.12" x2="-50.8" y2="198.12" width="0.1524" layer="91"/>
<junction x="-38.1" y="198.12"/>
<label x="-50.8" y="198.12" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="D27/(RX1)"/>
<wire x1="-15.24" y1="96.52" x2="-30.48" y2="96.52" width="0.1524" layer="91"/>
<junction x="-15.24" y="96.52"/>
<label x="-30.48" y="96.52" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="CS" class="0">
<segment>
<pinref part="JP1" gate="A" pin="5"/>
<wire x1="-38.1" y1="203.2" x2="-50.8" y2="203.2" width="0.1524" layer="91"/>
<junction x="-38.1" y="203.2"/>
<label x="-50.8" y="203.2" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="D10/CS0/TX2/PWM"/>
<wire x1="-15.24" y1="119.38" x2="-30.48" y2="119.38" width="0.1524" layer="91"/>
<junction x="-15.24" y="119.38"/>
<label x="-30.48" y="119.38" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="MOSI" class="0">
<segment>
<pinref part="JP1" gate="A" pin="4"/>
<wire x1="-38.1" y1="205.74" x2="-50.8" y2="205.74" width="0.1524" layer="91"/>
<junction x="-38.1" y="205.74"/>
<label x="-50.8" y="205.74" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="D11/MOSI0"/>
<wire x1="-15.24" y1="116.84" x2="-30.48" y2="116.84" width="0.1524" layer="91"/>
<junction x="-15.24" y="116.84"/>
<label x="-30.48" y="116.84" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="MISO" class="0">
<segment>
<pinref part="JP1" gate="A" pin="3"/>
<wire x1="-38.1" y1="208.28" x2="-50.8" y2="208.28" width="0.1524" layer="91"/>
<junction x="-38.1" y="208.28"/>
<label x="-50.8" y="208.28" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="D12/MISO0"/>
<wire x1="-15.24" y1="114.3" x2="-30.48" y2="114.3" width="0.1524" layer="91"/>
<junction x="-15.24" y="114.3"/>
<label x="-30.48" y="114.3" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="SCK" class="0">
<segment>
<pinref part="JP1" gate="A" pin="2"/>
<wire x1="-38.1" y1="210.82" x2="-50.8" y2="210.82" width="0.1524" layer="91"/>
<junction x="-38.1" y="210.82"/>
<label x="-50.8" y="210.82" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="D13/LED/SCK0"/>
<wire x1="55.88" y1="114.3" x2="71.12" y2="114.3" width="0.1524" layer="91"/>
<junction x="55.88" y="114.3"/>
<label x="71.12" y="114.3" size="1.778" layer="95"/>
</segment>
</net>
<net name="BACKLIGHT" class="0">
<segment>
<pinref part="R1" gate="G$1" pin="1"/>
<wire x1="-93.98" y1="205.74" x2="-99.06" y2="205.74" width="0.1524" layer="91"/>
<junction x="-93.98" y="205.74"/>
<label x="-99.06" y="205.74" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="D35/A16/PWM"/>
<wire x1="55.88" y1="88.9" x2="71.12" y2="88.9" width="0.1524" layer="91"/>
<junction x="55.88" y="88.9"/>
<label x="71.12" y="88.9" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="R1" gate="G$1" pin="2"/>
<pinref part="R2" gate="G$1" pin="2"/>
<wire x1="-83.82" y1="205.74" x2="-81.28" y2="205.74" width="0.1524" layer="91"/>
<wire x1="-81.28" y1="203.2" x2="-81.28" y2="205.74" width="0.1524" layer="91"/>
<pinref part="Q1" gate="G$1" pin="B"/>
<wire x1="-81.28" y1="205.74" x2="-76.2" y2="205.74" width="0.1524" layer="91"/>
<junction x="-83.82" y="205.74"/>
<junction x="-81.28" y="205.74"/>
<junction x="-81.28" y="203.2"/>
<junction x="-76.2" y="205.74"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="Q1" gate="G$1" pin="C"/>
<wire x1="-71.12" y1="210.82" x2="-71.12" y2="213.36" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="1"/>
<wire x1="-71.12" y1="213.36" x2="-38.1" y2="213.36" width="0.1524" layer="91"/>
<junction x="-71.12" y="210.82"/>
<junction x="-38.1" y="213.36"/>
</segment>
</net>
<net name="SOUNDOUT" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="A21/DAC0"/>
<wire x1="55.88" y1="101.6" x2="71.12" y2="101.6" width="0.1524" layer="91"/>
<junction x="55.88" y="101.6"/>
<label x="71.12" y="101.6" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="C5" gate="G$1" pin="2"/>
<wire x1="88.9" y1="241.3" x2="88.9" y2="243.84" width="0.1524" layer="91"/>
<pinref part="C4" gate="G$1" pin="1"/>
<wire x1="93.98" y1="243.84" x2="88.9" y2="243.84" width="0.1524" layer="91"/>
<junction x="88.9" y="241.3"/>
<junction x="88.9" y="243.84"/>
<junction x="93.98" y="243.84"/>
<wire x1="88.9" y1="243.84" x2="78.74" y2="243.84" width="0.1524" layer="91"/>
<label x="78.74" y="243.84" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="BATTERYVOLTAGE" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D23/A9/TOUCH/PWM"/>
<wire x1="55.88" y1="139.7" x2="71.12" y2="139.7" width="0.1524" layer="91"/>
<junction x="55.88" y="139.7"/>
<label x="71.12" y="139.7" size="1.778" layer="95"/>
</segment>
</net>
<net name="UP" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D22/A8/TOUCH/PWM"/>
<wire x1="55.88" y1="137.16" x2="71.12" y2="137.16" width="0.1524" layer="91"/>
<junction x="55.88" y="137.16"/>
<label x="71.12" y="137.16" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="UP" gate="G$1" pin="P$1"/>
<pinref part="R3" gate="G$1" pin="1"/>
<wire x1="129.54" y1="177.8" x2="124.46" y2="177.8" width="0.1524" layer="91"/>
<junction x="129.54" y="177.8"/>
<junction x="124.46" y="177.8"/>
<wire x1="124.46" y1="177.8" x2="114.3" y2="177.8" width="0.1524" layer="91"/>
<label x="114.3" y="177.8" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="DOWN" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D21/A7/CS0/(MOSI1)/PWM"/>
<wire x1="55.88" y1="134.62" x2="71.12" y2="134.62" width="0.1524" layer="91"/>
<junction x="55.88" y="134.62"/>
<label x="71.12" y="134.62" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="DOWN" gate="G$1" pin="P$1"/>
<pinref part="R4" gate="G$1" pin="1"/>
<wire x1="129.54" y1="165.1" x2="124.46" y2="165.1" width="0.1524" layer="91"/>
<junction x="124.46" y="165.1"/>
<junction x="129.54" y="165.1"/>
<wire x1="124.46" y1="165.1" x2="114.3" y2="165.1" width="0.1524" layer="91"/>
<label x="114.3" y="165.1" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="LEFT" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D20/A6/CS0/(SCK1)/PWM"/>
<wire x1="55.88" y1="132.08" x2="71.12" y2="132.08" width="0.1524" layer="91"/>
<junction x="55.88" y="132.08"/>
<label x="71.12" y="132.08" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="LEFT" gate="G$1" pin="P$1"/>
<pinref part="R5" gate="G$1" pin="1"/>
<wire x1="129.54" y1="152.4" x2="124.46" y2="152.4" width="0.1524" layer="91"/>
<junction x="124.46" y="152.4"/>
<junction x="129.54" y="152.4"/>
<wire x1="124.46" y1="152.4" x2="114.3" y2="152.4" width="0.1524" layer="91"/>
<label x="114.3" y="152.4" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="RIGHT" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D19/A5/TOUCH/SCL0"/>
<wire x1="55.88" y1="129.54" x2="71.12" y2="129.54" width="0.1524" layer="91"/>
<junction x="55.88" y="129.54"/>
<label x="71.12" y="129.54" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="RIGHT" gate="G$1" pin="P$1"/>
<pinref part="R6" gate="G$1" pin="1"/>
<wire x1="129.54" y1="139.7" x2="124.46" y2="139.7" width="0.1524" layer="91"/>
<junction x="129.54" y="139.7"/>
<junction x="124.46" y="139.7"/>
<wire x1="124.46" y1="139.7" x2="114.3" y2="139.7" width="0.1524" layer="91"/>
<label x="114.3" y="139.7" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="A" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D18/A4/TOUCH/SDA0"/>
<wire x1="55.88" y1="127" x2="71.12" y2="127" width="0.1524" layer="91"/>
<junction x="55.88" y="127"/>
<label x="71.12" y="127" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="A" gate="G$1" pin="P$1"/>
<pinref part="R7" gate="G$1" pin="1"/>
<wire x1="129.54" y1="114.3" x2="124.46" y2="114.3" width="0.1524" layer="91"/>
<wire x1="124.46" y1="114.3" x2="114.3" y2="114.3" width="0.1524" layer="91"/>
<junction x="129.54" y="114.3"/>
<junction x="124.46" y="114.3"/>
<label x="114.3" y="114.3" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="B" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D17/A3/TOUCH/(SDA0)"/>
<wire x1="55.88" y1="124.46" x2="71.12" y2="124.46" width="0.1524" layer="91"/>
<junction x="55.88" y="124.46"/>
<label x="71.12" y="124.46" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="B" gate="G$1" pin="P$1"/>
<pinref part="R8" gate="G$1" pin="1"/>
<wire x1="129.54" y1="101.6" x2="124.46" y2="101.6" width="0.1524" layer="91"/>
<wire x1="124.46" y1="101.6" x2="114.3" y2="101.6" width="0.1524" layer="91"/>
<junction x="124.46" y="101.6"/>
<junction x="129.54" y="101.6"/>
<label x="114.3" y="101.6" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="START" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D16/A2/TOUCH/(SCL0)"/>
<wire x1="55.88" y1="121.92" x2="71.12" y2="121.92" width="0.1524" layer="91"/>
<junction x="55.88" y="121.92"/>
<label x="71.12" y="121.92" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="START" gate="G$1" pin="P$1"/>
<pinref part="R9" gate="G$1" pin="1"/>
<wire x1="129.54" y1="81.28" x2="124.46" y2="81.28" width="0.1524" layer="91"/>
<wire x1="124.46" y1="81.28" x2="114.3" y2="81.28" width="0.1524" layer="91"/>
<junction x="124.46" y="81.28"/>
<junction x="129.54" y="81.28"/>
<label x="114.3" y="81.28" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="OSD" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D14/A0/(SCK0)/PWM"/>
<wire x1="55.88" y1="116.84" x2="71.12" y2="116.84" width="0.1524" layer="91"/>
<junction x="55.88" y="116.84"/>
<label x="71.12" y="116.84" size="1.778" layer="95"/>
</segment>
</net>
<net name="SELECT" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D26/(TX1)"/>
<wire x1="-15.24" y1="99.06" x2="-30.48" y2="99.06" width="0.1524" layer="91"/>
<junction x="-15.24" y="99.06"/>
<label x="-30.48" y="99.06" size="1.778" layer="95" rot="R180"/>
</segment>
<segment>
<pinref part="SELECT" gate="G$1" pin="P$1"/>
<pinref part="R10" gate="G$1" pin="1"/>
<wire x1="129.54" y1="68.58" x2="124.46" y2="68.58" width="0.1524" layer="91"/>
<wire x1="124.46" y1="68.58" x2="114.3" y2="68.58" width="0.1524" layer="91"/>
<junction x="124.46" y="68.58"/>
<junction x="129.54" y="68.58"/>
<label x="114.3" y="68.58" size="1.778" layer="95" rot="R180"/>
</segment>
</net>
<net name="LSHOLDER" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D39/A20"/>
<wire x1="55.88" y1="99.06" x2="71.12" y2="99.06" width="0.1524" layer="91"/>
<junction x="55.88" y="99.06"/>
<label x="71.12" y="99.06" size="1.778" layer="95"/>
</segment>
</net>
<net name="RSHOLDER" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D38/A19/SDA1/PWM"/>
<wire x1="55.88" y1="96.52" x2="71.12" y2="96.52" width="0.1524" layer="91"/>
<junction x="55.88" y="96.52"/>
<label x="71.12" y="96.52" size="1.778" layer="95"/>
</segment>
</net>
<net name="LCD+" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D37/A18/SCL1/PWM"/>
<wire x1="55.88" y1="93.98" x2="71.12" y2="93.98" width="0.1524" layer="91"/>
<junction x="55.88" y="93.98"/>
<label x="71.12" y="93.98" size="1.778" layer="95"/>
</segment>
</net>
<net name="LCD-" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="D36/A17/PWM"/>
<wire x1="55.88" y1="91.44" x2="71.12" y2="91.44" width="0.1524" layer="91"/>
<junction x="55.88" y="91.44"/>
<label x="71.12" y="91.44" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="BYPASS"/>
<pinref part="C3" gate="G$1" pin="2"/>
<wire x1="142.24" y1="243.84" x2="129.54" y2="243.84" width="0.1524" layer="91"/>
<wire x1="129.54" y1="243.84" x2="129.54" y2="254" width="0.1524" layer="91"/>
<junction x="129.54" y="254"/>
<junction x="142.24" y="243.84"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="IN-"/>
<wire x1="114.3" y1="243.84" x2="101.6" y2="243.84" width="0.1524" layer="91"/>
<pinref part="C4" gate="G$1" pin="2"/>
<junction x="101.6" y="243.84"/>
<junction x="114.3" y="243.84"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="SENSE"/>
<pinref part="R11" gate="G$1" pin="1"/>
<wire x1="114.3" y1="238.76" x2="111.76" y2="238.76" width="0.1524" layer="91"/>
<junction x="111.76" y="238.76"/>
<junction x="114.3" y="238.76"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="VO2"/>
<wire x1="142.24" y1="248.92" x2="152.4" y2="248.92" width="0.1524" layer="91"/>
<junction x="142.24" y="248.92"/>
<pinref part="SPK" gate="G$1" pin="1"/>
<wire x1="160.02" y1="241.3" x2="152.4" y2="241.3" width="0.1524" layer="91"/>
<wire x1="152.4" y1="241.3" x2="152.4" y2="248.92" width="0.1524" layer="91"/>
<junction x="160.02" y="241.3"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="VO1"/>
<wire x1="142.24" y1="233.68" x2="152.4" y2="233.68" width="0.1524" layer="91"/>
<junction x="142.24" y="233.68"/>
<pinref part="SPK" gate="G$1" pin="2"/>
<wire x1="160.02" y1="238.76" x2="152.4" y2="238.76" width="0.1524" layer="91"/>
<wire x1="152.4" y1="238.76" x2="152.4" y2="233.68" width="0.1524" layer="91"/>
<junction x="160.02" y="238.76"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="VOL/!SD"/>
<wire x1="114.3" y1="233.68" x2="111.76" y2="233.68" width="0.1524" layer="91"/>
<wire x1="111.76" y1="233.68" x2="111.76" y2="220.98" width="0.1524" layer="91"/>
<wire x1="111.76" y1="220.98" x2="106.68" y2="220.98" width="0.1524" layer="91"/>
<junction x="114.3" y="233.68"/>
<pinref part="R13" gate="1" pin="S"/>
<junction x="106.68" y="220.98"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
