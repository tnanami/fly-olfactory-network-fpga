
U
Command: %s
53*	vivadotcl2$
power_opt_design2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-349h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
E
0Begin power optimizations | Checksum: 1c82b867e
*commonh px� 
]
#Optimizing power for module %s ...
50*pwropt2
main2default:defaultZ34-50h px� 
�
+Design is in %s state. Running in %s mode.
161*pwropt2$
partially-placed2default:default2$
partially-placed2default:defaultZ34-207h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2$
PSMgr Creation: 2default:default2
00:00:012default:default2 
00:00:00.4362default:default2
1580.7232default:default2
0.0002default:defaultZ17-268h px� 
k
2Found %s new always-off flops by back propagation
95*pwropt2
1302default:defaultZ34-95h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2$
Pre-processing: 2default:default2
00:00:042default:default2
00:00:012default:default2
1580.7232default:default2
0.0002default:defaultZ17-268h px� 
=
Applying IDT optimizations ...
9*pwroptZ34-9h px� 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
IDT: 2default:default2
00:00:082default:default2
00:00:032default:default2
1580.7232default:default2
0.0002default:defaultZ17-268h px� 
?
Applying ODC optimizations ...
10*pwroptZ34-10h px� 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px� 

DSkipped ODC enables for %s nets in BRAM flops in bus-based analysis.163*pwropt2
8962default:defaultZ34-215h px� 
�
LSkipped ODC enables for %s nets in BRAM address flops in bus-based analysis.162*pwropt2
02default:defaultZ34-214h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
ODC: 2default:default2
00:00:072default:default2
00:00:052default:default2
1580.7232default:default2
0.0002default:defaultZ17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2/
Power optimization passes: 2default:default2
00:00:192default:default2
00:00:092default:default2
1580.7232default:default2
0.0002default:defaultZ17-268h px� 


*pwropth px� 
@
 Creating clock enable groups ...77*pwroptZ34-77h px� 
d
DIncluding small groups for filtering based on enable probabilities.
96*pwroptZ34-96h px� 
&
 Done
76*pwroptZ34-76h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2&
Grouping enables: 2default:default2
00:00:012default:default2
00:00:022default:default2
1580.7232default:default2
0.0002default:defaultZ17-268h px� 


*pwropth px� 
e

Starting %s Task
103*constraints2*
PowerOpt Patch Enables2default:defaultZ18-103h px� 
q
7Patching clock gating enable signals for design %s ...
26*pwropt2
main2default:defaultZ34-26h px� 
�
�WRITE_MODE attribute of %s BRAM(s) out of a total of %s has been updated to save power.
    Run report_power_opt to get a complete listing of the BRAMs updated.
129*pwropt2
02default:default2
602default:defaultZ34-162h px� 
d
+Structural ODC has moved %s WE to EN ports
155*pwropt2
02default:defaultZ34-201h px� 
�
KPatcher adaptive clustering : original %s clusters %s accepted clusters %s
100*pwropt2
ram2default:default2
82default:default2
82default:defaultZ34-100h px� 
�
KPatcher adaptive clustering : original %s clusters %s accepted clusters %s
100*pwropt2
flop2default:default2
1122default:default2
1122default:defaultZ34-100h px� 
�
C
Number of Slice Registers augmented: %s newly gated: %s Total: %s
64*pwropt2
442default:default2
9282default:default2
76122default:defaultZ34-64h px� 
�
8Number of SRLs augmented: %s  newly gated: %s Total: %s
66*pwropt2
02default:default2
02default:default2
32default:defaultZ34-66h px� 
�
CNumber of BRAM Ports augmented: %s newly gated: %s Total Ports: %s
65*pwropt2
82default:default2
02default:default2
1202default:defaultZ34-65h px� 
h
1Number of Flops added for Enable Generation: %s

23*pwropt2
82default:defaultZ34-23h px� 
�
UFlops dropped: %s/%s RAMS dropped: %s/%s Clusters dropped: %s/%s Enables dropped: %s
57*pwropt2
5122default:default2
15602default:default2
02default:default2
82default:default2
222default:default2
1202default:default2
52default:defaultZ34-57h px� 
m
+Patching clock gating enables finished %s.
27*pwropt2 
successfully2default:defaultZ34-27h px� 
N
9Ending PowerOpt Patch Enables Task | Checksum: 1cc9b5e7d
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:08 ; elapsed = 00:00:04 . Memory (MB): peak = 1580.723 ; gain = 0.0002default:defaulth px� 
J
*Power optimization finished successfully.
30*pwroptZ34-30h px� 
C
.End power optimizations | Checksum: 1cc9b5e7d
*commonh px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2(
Power optimization: 2default:default2
00:00:302default:default2
00:00:172default:default2
1580.7232default:default2
0.0002default:defaultZ17-268h px� 
u
<Malloced memory gain at end of power optimization: %s bytes
152*pwropt2
02default:defaultZ34-198h px� 
a

Starting %s Task
103*constraints2&
Logic Optimization2default:defaultZ18-103h px� 
A
,Implement Debug Cores | Checksum: 1bbebb2d2
*commonh px� 
i

Phase %s%s
101*constraints2
1 2default:default2
Retarget2default:defaultZ18-101h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
K
Retargeted %s cell(s).
49*opt2
02default:defaultZ31-49h px� 
<
'Phase 1 Retarget | Checksum: 23a71f0f1
*commonh px� 
�

%s
*constraints2s
_Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.998 . Memory (MB): peak = 1580.723 ; gain = 0.0002default:defaulth px� 
r

Phase %s%s
101*constraints2
2 2default:default2%
BUFG optimization2default:defaultZ18-101h px� 
[
 Eliminated %s unconnected nets.
12*opt2
002default:default8Z31-12h px� 
\
!Eliminated %s unconnected cells.
11*opt2
0	02default:default8Z31-11h px� 
E
0Phase 2 BUFG optimization | Checksum: 23a71f0f1
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:03 ; elapsed = 00:00:03 . Memory (MB): peak = 1580.723 ; gain = 0.0002default:defaulth px� 
f

Phase %s%s
101*constraints2
3 2default:default2
Remap2default:defaultZ18-101h px� 
p
&Eliminated %s cells and %s terminals.
9*opt2
62default:default2
132default:defaultZ31-9h px� 
9
$Phase 3 Remap | Checksum: 1629394d4
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:07 ; elapsed = 00:00:07 . Memory (MB): peak = 1580.723 ; gain = 0.0002default:defaulth px� 
J
5Ending Logic Optimization Task | Checksum: 1629394d4
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:07 ; elapsed = 00:00:07 . Memory (MB): peak = 1580.723 ; gain = 0.0002default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1122default:default2
12default:default2
02default:default2
02default:defaultZ4-41h px� 
b
%s completed successfully
29*	vivadotcl2$
power_opt_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2&
power_opt_design: 2default:default2
00:00:392default:default2
00:00:262default:default2
1580.7232default:default2
0.0002default:defaultZ17-268h px� 
D
Writing placer database...
1603*designutilsZ20-1893h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:012default:default2 
00:00:00.0722default:default2
1580.7232default:default2
0.0002default:defaultZ17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2�
�D:/research/Jupyter/release/fly-olfactory-network-fpga/NeuralNetworks/code_and_data/vivado_projects/noAPL/noAPL.runs/impl_2/main_pwropt.dcp2default:defaultZ17-1381h px� 


End Record