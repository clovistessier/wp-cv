EESchema Schematic File Version 4
LIBS:Wave_Pool CV Input Rev C-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Amplifier_Operational:MCP6004 U?
U 1 1 5FDDAC2D
P 2550 2000
AR Path="/5FDDAC2D" Ref="U?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAC2D" Ref="U?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAC2D" Ref="U?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAC2D" Ref="U13"  Part="1" 
F 0 "U13" H 2550 1633 50  0000 C CNN
F 1 "MCP6004" H 2550 1724 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 2500 2100 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21733j.pdf" H 2600 2200 50  0001 C CNN
	1    2550 2000
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FDDAC34
P 2150 2300
AR Path="/5FDDAC34" Ref="#PWR?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAC34" Ref="#PWR?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAC34" Ref="#PWR?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAC34" Ref="#PWR0100"  Part="1" 
F 0 "#PWR0100" H 2150 2050 50  0001 C CNN
F 1 "GND" H 2155 2127 50  0000 C CNN
F 2 "" H 2150 2300 50  0001 C CNN
F 3 "" H 2150 2300 50  0001 C CNN
	1    2150 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 5FDDAC3A
P 1850 1900
AR Path="/5FDDAC3A" Ref="R?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAC3A" Ref="R?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAC3A" Ref="R?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAC3A" Ref="R61"  Part="1" 
F 0 "R61" V 1645 1900 50  0000 C CNN
F 1 "100k" V 1736 1900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 1890 1890 50  0001 C CNN
F 3 "~" H 1850 1900 50  0001 C CNN
	1    1850 1900
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 5FDDAC41
P 1850 1350
AR Path="/5FDDAC41" Ref="R?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAC41" Ref="R?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAC41" Ref="R?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAC41" Ref="R60"  Part="1" 
F 0 "R60" V 1645 1350 50  0000 C CNN
F 1 "200k" V 1736 1350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 1890 1340 50  0001 C CNN
F 3 "~" H 1850 1350 50  0001 C CNN
	1    1850 1350
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 5FDDAC48
P 2500 1450
AR Path="/5FDDAC48" Ref="R?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAC48" Ref="R?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAC48" Ref="R?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAC48" Ref="R68"  Part="1" 
F 0 "R68" V 2295 1450 50  0000 C CNN
F 1 "33k" V 2386 1450 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 2540 1440 50  0001 C CNN
F 3 "~" H 2500 1450 50  0001 C CNN
	1    2500 1450
	0    1    1    0   
$EndComp
Wire Wire Line
	2250 1900 2000 1900
Wire Wire Line
	2250 1900 2250 1450
Wire Wire Line
	2250 1450 2350 1450
Connection ~ 2250 1900
Wire Wire Line
	2250 1450 2250 1350
Wire Wire Line
	2250 1050 2350 1050
Connection ~ 2250 1450
Wire Wire Line
	2850 2000 2850 1450
Wire Wire Line
	2850 1450 2650 1450
Wire Wire Line
	2650 1050 2850 1050
Wire Wire Line
	2850 1050 2850 1450
Connection ~ 2850 1450
Wire Wire Line
	2000 1350 2250 1350
Connection ~ 2250 1350
Wire Wire Line
	2250 1350 2250 1050
Wire Wire Line
	2250 2100 2150 2100
Wire Wire Line
	2150 2100 2150 2300
Wire Wire Line
	2850 2000 3250 2000
Connection ~ 2850 2000
$Comp
L Eurorack_Symbols:Thonkiconn_Mono J?
U 1 1 5FDDAC6A
P 1150 1950
AR Path="/5FDDAC6A" Ref="J?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAC6A" Ref="J?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAC6A" Ref="J?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAC6A" Ref="J15"  Part="1" 
F 0 "J15" H 967 1970 50  0000 R CNN
F 1 "Thonkiconn_Mono" H 1300 1800 50  0000 R CNN
F 2 "PROJECT_FOOTPRINTS:Jack_3.5mm_Thonkiconn_Mono" H 1450 1900 50  0001 C CNN
F 3 "" H 1450 1900 50  0001 C CNN
	1    1150 1950
	1    0    0    1   
$EndComp
Wire Wire Line
	1400 1900 1600 1900
Wire Wire Line
	1400 2100 1400 2150
$Comp
L power:GND #PWR?
U 1 1 5FDDAC73
P 1400 2300
AR Path="/5FDDAC73" Ref="#PWR?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAC73" Ref="#PWR?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAC73" Ref="#PWR?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAC73" Ref="#PWR096"  Part="1" 
F 0 "#PWR096" H 1400 2050 50  0001 C CNN
F 1 "GND" H 1405 2127 50  0000 C CNN
F 2 "" H 1400 2300 50  0001 C CNN
F 3 "" H 1400 2300 50  0001 C CNN
	1    1400 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 2000 1450 2000
Wire Wire Line
	1450 2000 1450 2150
Wire Wire Line
	1450 2150 1400 2150
Connection ~ 1400 2150
Wire Wire Line
	1400 2150 1400 2300
Text GLabel 1550 1350 0    50   Input ~ 0
AREF_-10
Wire Wire Line
	1550 1350 1700 1350
Text Notes 600  2250 0    50   ~ 0
-5.0 to +5.0 V
Text Notes 3000 2200 0    50   ~ 0
+3.3 to 0.0 V
$Comp
L power:GND #PWR?
U 1 1 5FDDAC82
P 5450 2300
AR Path="/5FDDAC82" Ref="#PWR?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAC82" Ref="#PWR?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAC82" Ref="#PWR?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAC82" Ref="#PWR0108"  Part="1" 
F 0 "#PWR0108" H 5450 2050 50  0001 C CNN
F 1 "GND" H 5455 2127 50  0000 C CNN
F 2 "" H 5450 2300 50  0001 C CNN
F 3 "" H 5450 2300 50  0001 C CNN
	1    5450 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 5FDDAC88
P 5150 1900
AR Path="/5FDDAC88" Ref="R?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAC88" Ref="R?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAC88" Ref="R?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAC88" Ref="R73"  Part="1" 
F 0 "R73" V 4945 1900 50  0000 C CNN
F 1 "100k" V 5036 1900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5190 1890 50  0001 C CNN
F 3 "~" H 5150 1900 50  0001 C CNN
	1    5150 1900
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 5FDDAC8F
P 5150 1350
AR Path="/5FDDAC8F" Ref="R?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAC8F" Ref="R?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAC8F" Ref="R?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAC8F" Ref="R72"  Part="1" 
F 0 "R72" V 4945 1350 50  0000 C CNN
F 1 "200k" V 5036 1350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5190 1340 50  0001 C CNN
F 3 "~" H 5150 1350 50  0001 C CNN
	1    5150 1350
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 5FDDAC96
P 5800 1450
AR Path="/5FDDAC96" Ref="R?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAC96" Ref="R?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAC96" Ref="R?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAC96" Ref="R80"  Part="1" 
F 0 "R80" V 5595 1450 50  0000 C CNN
F 1 "33k" V 5686 1450 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5840 1440 50  0001 C CNN
F 3 "~" H 5800 1450 50  0001 C CNN
	1    5800 1450
	0    1    1    0   
$EndComp
Wire Wire Line
	5550 1900 5300 1900
Wire Wire Line
	5550 1900 5550 1450
Wire Wire Line
	5550 1450 5650 1450
Wire Wire Line
	5550 1450 5550 1350
Wire Wire Line
	5550 1050 5650 1050
Connection ~ 5550 1450
Wire Wire Line
	6150 2000 6150 1450
Wire Wire Line
	6150 1450 5950 1450
Wire Wire Line
	5950 1050 6150 1050
Wire Wire Line
	6150 1050 6150 1450
Connection ~ 6150 1450
Wire Wire Line
	5300 1350 5550 1350
Connection ~ 5550 1350
Wire Wire Line
	5550 1350 5550 1050
Wire Wire Line
	5550 2100 5450 2100
Wire Wire Line
	5450 2100 5450 2300
Wire Wire Line
	6150 2000 6550 2000
$Comp
L Eurorack_Symbols:Thonkiconn_Mono J?
U 1 1 5FDDACB6
P 4450 1950
AR Path="/5FDDACB6" Ref="J?"  Part="1" 
AR Path="/5FDCE2F2/5FDDACB6" Ref="J?"  Part="1" 
AR Path="/5FDD8FDE/5FDDACB6" Ref="J?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDACB6" Ref="J19"  Part="1" 
F 0 "J19" H 4267 1970 50  0000 R CNN
F 1 "Thonkiconn_Mono" H 4600 1800 50  0000 R CNN
F 2 "PROJECT_FOOTPRINTS:Jack_3.5mm_Thonkiconn_Mono" H 4750 1900 50  0001 C CNN
F 3 "" H 4750 1900 50  0001 C CNN
	1    4450 1950
	1    0    0    1   
$EndComp
Wire Wire Line
	4700 1900 4900 1900
Wire Wire Line
	4700 2100 4700 2150
$Comp
L power:GND #PWR?
U 1 1 5FDDACBF
P 4700 2300
AR Path="/5FDDACBF" Ref="#PWR?"  Part="1" 
AR Path="/5FDCE2F2/5FDDACBF" Ref="#PWR?"  Part="1" 
AR Path="/5FDD8FDE/5FDDACBF" Ref="#PWR?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDACBF" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0104" H 4700 2050 50  0001 C CNN
F 1 "GND" H 4705 2127 50  0000 C CNN
F 2 "" H 4700 2300 50  0001 C CNN
F 3 "" H 4700 2300 50  0001 C CNN
	1    4700 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 2000 4750 2000
Wire Wire Line
	4750 2000 4750 2150
Wire Wire Line
	4750 2150 4700 2150
Connection ~ 4700 2150
Wire Wire Line
	4700 2150 4700 2300
Text GLabel 4850 1350 0    50   Input ~ 0
AREF_-10
Wire Wire Line
	4850 1350 5000 1350
Text Notes 3900 2250 0    50   ~ 0
-5.0 to +5.0 V
Text Notes 6300 2200 0    50   ~ 0
+3.3 to 0.0 V
$Comp
L power:GND #PWR?
U 1 1 5FDDACCE
P 2200 3900
AR Path="/5FDDACCE" Ref="#PWR?"  Part="1" 
AR Path="/5FDCE2F2/5FDDACCE" Ref="#PWR?"  Part="1" 
AR Path="/5FDD8FDE/5FDDACCE" Ref="#PWR?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDACCE" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0101" H 2200 3650 50  0001 C CNN
F 1 "GND" H 2205 3727 50  0000 C CNN
F 2 "" H 2200 3900 50  0001 C CNN
F 3 "" H 2200 3900 50  0001 C CNN
	1    2200 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 5FDDACD4
P 1900 3500
AR Path="/5FDDACD4" Ref="R?"  Part="1" 
AR Path="/5FDCE2F2/5FDDACD4" Ref="R?"  Part="1" 
AR Path="/5FDD8FDE/5FDDACD4" Ref="R?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDACD4" Ref="R63"  Part="1" 
F 0 "R63" V 1695 3500 50  0000 C CNN
F 1 "100k" V 1786 3500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 1940 3490 50  0001 C CNN
F 3 "~" H 1900 3500 50  0001 C CNN
	1    1900 3500
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 5FDDACDB
P 1900 2950
AR Path="/5FDDACDB" Ref="R?"  Part="1" 
AR Path="/5FDCE2F2/5FDDACDB" Ref="R?"  Part="1" 
AR Path="/5FDD8FDE/5FDDACDB" Ref="R?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDACDB" Ref="R62"  Part="1" 
F 0 "R62" V 1695 2950 50  0000 C CNN
F 1 "200k" V 1786 2950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 1940 2940 50  0001 C CNN
F 3 "~" H 1900 2950 50  0001 C CNN
	1    1900 2950
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 5FDDACE2
P 2550 3050
AR Path="/5FDDACE2" Ref="R?"  Part="1" 
AR Path="/5FDCE2F2/5FDDACE2" Ref="R?"  Part="1" 
AR Path="/5FDD8FDE/5FDDACE2" Ref="R?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDACE2" Ref="R69"  Part="1" 
F 0 "R69" V 2345 3050 50  0000 C CNN
F 1 "33k" V 2436 3050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 2590 3040 50  0001 C CNN
F 3 "~" H 2550 3050 50  0001 C CNN
	1    2550 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	2300 3500 2050 3500
Wire Wire Line
	2300 3500 2300 3050
Wire Wire Line
	2300 3050 2400 3050
Wire Wire Line
	2300 3050 2300 2950
Wire Wire Line
	2300 2650 2400 2650
Connection ~ 2300 3050
Wire Wire Line
	2900 3600 2900 3050
Wire Wire Line
	2900 3050 2700 3050
Wire Wire Line
	2700 2650 2900 2650
Wire Wire Line
	2900 2650 2900 3050
Connection ~ 2900 3050
Wire Wire Line
	2050 2950 2300 2950
Connection ~ 2300 2950
Wire Wire Line
	2300 2950 2300 2650
Wire Wire Line
	2300 3700 2200 3700
Wire Wire Line
	2200 3700 2200 3900
Wire Wire Line
	2900 3600 3300 3600
$Comp
L Eurorack_Symbols:Thonkiconn_Mono J?
U 1 1 5FDDAD02
P 1200 3550
AR Path="/5FDDAD02" Ref="J?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAD02" Ref="J?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAD02" Ref="J?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAD02" Ref="J16"  Part="1" 
F 0 "J16" H 1017 3570 50  0000 R CNN
F 1 "Thonkiconn_Mono" H 1350 3400 50  0000 R CNN
F 2 "PROJECT_FOOTPRINTS:Jack_3.5mm_Thonkiconn_Mono" H 1500 3500 50  0001 C CNN
F 3 "" H 1500 3500 50  0001 C CNN
	1    1200 3550
	1    0    0    1   
$EndComp
Wire Wire Line
	1450 3500 1650 3500
Wire Wire Line
	1450 3700 1450 3750
$Comp
L power:GND #PWR?
U 1 1 5FDDAD0B
P 1450 3900
AR Path="/5FDDAD0B" Ref="#PWR?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAD0B" Ref="#PWR?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAD0B" Ref="#PWR?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAD0B" Ref="#PWR097"  Part="1" 
F 0 "#PWR097" H 1450 3650 50  0001 C CNN
F 1 "GND" H 1455 3727 50  0000 C CNN
F 2 "" H 1450 3900 50  0001 C CNN
F 3 "" H 1450 3900 50  0001 C CNN
	1    1450 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 3600 1500 3600
Wire Wire Line
	1500 3600 1500 3750
Wire Wire Line
	1500 3750 1450 3750
Connection ~ 1450 3750
Wire Wire Line
	1450 3750 1450 3900
Text GLabel 1600 2950 0    50   Input ~ 0
AREF_-10
Wire Wire Line
	1600 2950 1750 2950
Text Notes 650  3850 0    50   ~ 0
-5.0 to +5.0 V
Text Notes 3050 3800 0    50   ~ 0
+3.3 to 0.0 V
$Comp
L power:GND #PWR?
U 1 1 5FDDAD1A
P 5500 3900
AR Path="/5FDDAD1A" Ref="#PWR?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAD1A" Ref="#PWR?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAD1A" Ref="#PWR?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAD1A" Ref="#PWR0109"  Part="1" 
F 0 "#PWR0109" H 5500 3650 50  0001 C CNN
F 1 "GND" H 5505 3727 50  0000 C CNN
F 2 "" H 5500 3900 50  0001 C CNN
F 3 "" H 5500 3900 50  0001 C CNN
	1    5500 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 5FDDAD20
P 5200 3500
AR Path="/5FDDAD20" Ref="R?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAD20" Ref="R?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAD20" Ref="R?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAD20" Ref="R75"  Part="1" 
F 0 "R75" V 4995 3500 50  0000 C CNN
F 1 "100k" V 5086 3500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5240 3490 50  0001 C CNN
F 3 "~" H 5200 3500 50  0001 C CNN
	1    5200 3500
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 5FDDAD27
P 5200 2950
AR Path="/5FDDAD27" Ref="R?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAD27" Ref="R?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAD27" Ref="R?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAD27" Ref="R74"  Part="1" 
F 0 "R74" V 4995 2950 50  0000 C CNN
F 1 "200k" V 5086 2950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5240 2940 50  0001 C CNN
F 3 "~" H 5200 2950 50  0001 C CNN
	1    5200 2950
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 5FDDAD2E
P 5850 3050
AR Path="/5FDDAD2E" Ref="R?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAD2E" Ref="R?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAD2E" Ref="R?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAD2E" Ref="R81"  Part="1" 
F 0 "R81" V 5645 3050 50  0000 C CNN
F 1 "33k" V 5736 3050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5890 3040 50  0001 C CNN
F 3 "~" H 5850 3050 50  0001 C CNN
	1    5850 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	5600 3500 5350 3500
Wire Wire Line
	5600 3500 5600 3050
Wire Wire Line
	5600 3050 5700 3050
Wire Wire Line
	5600 3050 5600 2950
Wire Wire Line
	5600 2650 5700 2650
Connection ~ 5600 3050
Wire Wire Line
	6200 3600 6200 3050
Wire Wire Line
	6200 3050 6000 3050
Wire Wire Line
	6000 2650 6200 2650
Wire Wire Line
	6200 2650 6200 3050
Connection ~ 6200 3050
Wire Wire Line
	5350 2950 5600 2950
Connection ~ 5600 2950
Wire Wire Line
	5600 2950 5600 2650
Wire Wire Line
	5600 3700 5500 3700
Wire Wire Line
	5500 3700 5500 3900
Wire Wire Line
	6200 3600 6600 3600
$Comp
L Eurorack_Symbols:Thonkiconn_Mono J?
U 1 1 5FDDAD4E
P 4500 3550
AR Path="/5FDDAD4E" Ref="J?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAD4E" Ref="J?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAD4E" Ref="J?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAD4E" Ref="J20"  Part="1" 
F 0 "J20" H 4317 3570 50  0000 R CNN
F 1 "Thonkiconn_Mono" H 4650 3400 50  0000 R CNN
F 2 "PROJECT_FOOTPRINTS:Jack_3.5mm_Thonkiconn_Mono" H 4800 3500 50  0001 C CNN
F 3 "" H 4800 3500 50  0001 C CNN
	1    4500 3550
	1    0    0    1   
$EndComp
Wire Wire Line
	4750 3500 4950 3500
Wire Wire Line
	4750 3700 4750 3750
$Comp
L power:GND #PWR?
U 1 1 5FDDAD57
P 4750 3900
AR Path="/5FDDAD57" Ref="#PWR?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAD57" Ref="#PWR?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAD57" Ref="#PWR?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAD57" Ref="#PWR0105"  Part="1" 
F 0 "#PWR0105" H 4750 3650 50  0001 C CNN
F 1 "GND" H 4755 3727 50  0000 C CNN
F 2 "" H 4750 3900 50  0001 C CNN
F 3 "" H 4750 3900 50  0001 C CNN
	1    4750 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 3600 4800 3600
Wire Wire Line
	4800 3600 4800 3750
Wire Wire Line
	4800 3750 4750 3750
Connection ~ 4750 3750
Wire Wire Line
	4750 3750 4750 3900
Text GLabel 4900 2950 0    50   Input ~ 0
AREF_-10
Wire Wire Line
	4900 2950 5050 2950
Text Notes 3950 3850 0    50   ~ 0
-5.0 to +5.0 V
Text Notes 6350 3800 0    50   ~ 0
+3.3 to 0.0 V
$Comp
L Amplifier_Operational:MCP6004 U?
U 2 1 5FDDAD66
P 2600 3600
AR Path="/5FDDAD66" Ref="U?"  Part="2" 
AR Path="/5FDCE2F2/5FDDAD66" Ref="U?"  Part="2" 
AR Path="/5FDD8FDE/5FDDAD66" Ref="U?"  Part="2" 
AR Path="/606BA1B5/606C6F2E/5FDDAD66" Ref="U13"  Part="2" 
F 0 "U13" H 2600 3967 50  0000 C CNN
F 1 "MCP6004" H 2600 3876 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 2550 3700 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21733j.pdf" H 2650 3800 50  0001 C CNN
	2    2600 3600
	1    0    0    1   
$EndComp
$Comp
L Amplifier_Operational:MCP6004 U?
U 3 1 5FDDAD6F
P 2600 5250
AR Path="/5FDDAD6F" Ref="U?"  Part="3" 
AR Path="/5FDCE2F2/5FDDAD6F" Ref="U?"  Part="3" 
AR Path="/5FDD8FDE/5FDDAD6F" Ref="U?"  Part="3" 
AR Path="/606BA1B5/606C6F2E/5FDDAD6F" Ref="U13"  Part="3" 
F 0 "U13" H 2600 5617 50  0000 C CNN
F 1 "MCP6004" H 2600 5526 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 2550 5350 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21733j.pdf" H 2650 5450 50  0001 C CNN
	3    2600 5250
	1    0    0    1   
$EndComp
$Comp
L Amplifier_Operational:MCP6004 U?
U 4 1 5FDDAD78
P 2650 6850
AR Path="/5FDDAD78" Ref="U?"  Part="4" 
AR Path="/5FDCE2F2/5FDDAD78" Ref="U?"  Part="4" 
AR Path="/5FDD8FDE/5FDDAD78" Ref="U?"  Part="4" 
AR Path="/606BA1B5/606C6F2E/5FDDAD78" Ref="U13"  Part="4" 
F 0 "U13" H 2650 7217 50  0000 C CNN
F 1 "MCP6004" H 2650 7126 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 2600 6950 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21733j.pdf" H 2700 7050 50  0001 C CNN
	4    2650 6850
	1    0    0    1   
$EndComp
$Comp
L Amplifier_Operational:MCP6004 U?
U 1 1 5FDDAD81
P 5850 2000
AR Path="/5FDDAD81" Ref="U?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAD81" Ref="U?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAD81" Ref="U?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAD81" Ref="U14"  Part="1" 
F 0 "U14" H 5850 1633 50  0000 C CNN
F 1 "MCP6004" H 5850 1724 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5800 2100 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21733j.pdf" H 5900 2200 50  0001 C CNN
	1    5850 2000
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FDDAD88
P 2200 5550
AR Path="/5FDDAD88" Ref="#PWR?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAD88" Ref="#PWR?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAD88" Ref="#PWR?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAD88" Ref="#PWR0102"  Part="1" 
F 0 "#PWR0102" H 2200 5300 50  0001 C CNN
F 1 "GND" H 2205 5377 50  0000 C CNN
F 2 "" H 2200 5550 50  0001 C CNN
F 3 "" H 2200 5550 50  0001 C CNN
	1    2200 5550
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 5FDDAD8E
P 1900 5150
AR Path="/5FDDAD8E" Ref="R?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAD8E" Ref="R?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAD8E" Ref="R?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAD8E" Ref="R65"  Part="1" 
F 0 "R65" V 1695 5150 50  0000 C CNN
F 1 "100k" V 1786 5150 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 1940 5140 50  0001 C CNN
F 3 "~" H 1900 5150 50  0001 C CNN
	1    1900 5150
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 5FDDAD95
P 1900 4600
AR Path="/5FDDAD95" Ref="R?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAD95" Ref="R?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAD95" Ref="R?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAD95" Ref="R64"  Part="1" 
F 0 "R64" V 1695 4600 50  0000 C CNN
F 1 "200k" V 1786 4600 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 1940 4590 50  0001 C CNN
F 3 "~" H 1900 4600 50  0001 C CNN
	1    1900 4600
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 5FDDAD9C
P 2550 4700
AR Path="/5FDDAD9C" Ref="R?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAD9C" Ref="R?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAD9C" Ref="R?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAD9C" Ref="R70"  Part="1" 
F 0 "R70" V 2345 4700 50  0000 C CNN
F 1 "33k" V 2436 4700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 2590 4690 50  0001 C CNN
F 3 "~" H 2550 4700 50  0001 C CNN
	1    2550 4700
	0    1    1    0   
$EndComp
Wire Wire Line
	2300 5150 2050 5150
Wire Wire Line
	2300 5150 2300 4700
Wire Wire Line
	2300 4700 2400 4700
Wire Wire Line
	2300 4700 2300 4600
Wire Wire Line
	2300 4300 2400 4300
Connection ~ 2300 4700
Wire Wire Line
	2900 5250 2900 4700
Wire Wire Line
	2900 4700 2700 4700
Wire Wire Line
	2700 4300 2900 4300
Wire Wire Line
	2900 4300 2900 4700
Connection ~ 2900 4700
Wire Wire Line
	2050 4600 2300 4600
Connection ~ 2300 4600
Wire Wire Line
	2300 4600 2300 4300
Wire Wire Line
	2300 5350 2200 5350
Wire Wire Line
	2200 5350 2200 5550
Wire Wire Line
	2900 5250 3300 5250
$Comp
L Eurorack_Symbols:Thonkiconn_Mono J?
U 1 1 5FDDADBE
P 1200 5200
AR Path="/5FDDADBE" Ref="J?"  Part="1" 
AR Path="/5FDCE2F2/5FDDADBE" Ref="J?"  Part="1" 
AR Path="/5FDD8FDE/5FDDADBE" Ref="J?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDADBE" Ref="J17"  Part="1" 
F 0 "J17" H 1017 5220 50  0000 R CNN
F 1 "Thonkiconn_Mono" H 1350 5050 50  0000 R CNN
F 2 "PROJECT_FOOTPRINTS:Jack_3.5mm_Thonkiconn_Mono" H 1500 5150 50  0001 C CNN
F 3 "" H 1500 5150 50  0001 C CNN
	1    1200 5200
	1    0    0    1   
$EndComp
Wire Wire Line
	1450 5150 1650 5150
Wire Wire Line
	1450 5350 1450 5400
$Comp
L power:GND #PWR?
U 1 1 5FDDADC7
P 1450 5550
AR Path="/5FDDADC7" Ref="#PWR?"  Part="1" 
AR Path="/5FDCE2F2/5FDDADC7" Ref="#PWR?"  Part="1" 
AR Path="/5FDD8FDE/5FDDADC7" Ref="#PWR?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDADC7" Ref="#PWR098"  Part="1" 
F 0 "#PWR098" H 1450 5300 50  0001 C CNN
F 1 "GND" H 1455 5377 50  0000 C CNN
F 2 "" H 1450 5550 50  0001 C CNN
F 3 "" H 1450 5550 50  0001 C CNN
	1    1450 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 5250 1500 5250
Wire Wire Line
	1500 5250 1500 5400
Wire Wire Line
	1500 5400 1450 5400
Connection ~ 1450 5400
Wire Wire Line
	1450 5400 1450 5550
Text GLabel 1600 4600 0    50   Input ~ 0
AREF_-10
Wire Wire Line
	1600 4600 1750 4600
Text Notes 650  5500 0    50   ~ 0
-5.0 to +5.0 V
Text Notes 3050 5450 0    50   ~ 0
+3.3 to 0.0 V
$Comp
L power:GND #PWR?
U 1 1 5FDDADD6
P 5500 5550
AR Path="/5FDDADD6" Ref="#PWR?"  Part="1" 
AR Path="/5FDCE2F2/5FDDADD6" Ref="#PWR?"  Part="1" 
AR Path="/5FDD8FDE/5FDDADD6" Ref="#PWR?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDADD6" Ref="#PWR0110"  Part="1" 
F 0 "#PWR0110" H 5500 5300 50  0001 C CNN
F 1 "GND" H 5505 5377 50  0000 C CNN
F 2 "" H 5500 5550 50  0001 C CNN
F 3 "" H 5500 5550 50  0001 C CNN
	1    5500 5550
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 5FDDADDC
P 5200 5150
AR Path="/5FDDADDC" Ref="R?"  Part="1" 
AR Path="/5FDCE2F2/5FDDADDC" Ref="R?"  Part="1" 
AR Path="/5FDD8FDE/5FDDADDC" Ref="R?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDADDC" Ref="R77"  Part="1" 
F 0 "R77" V 4995 5150 50  0000 C CNN
F 1 "100k" V 5086 5150 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5240 5140 50  0001 C CNN
F 3 "~" H 5200 5150 50  0001 C CNN
	1    5200 5150
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 5FDDADE3
P 5200 4600
AR Path="/5FDDADE3" Ref="R?"  Part="1" 
AR Path="/5FDCE2F2/5FDDADE3" Ref="R?"  Part="1" 
AR Path="/5FDD8FDE/5FDDADE3" Ref="R?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDADE3" Ref="R76"  Part="1" 
F 0 "R76" V 4995 4600 50  0000 C CNN
F 1 "200k" V 5086 4600 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5240 4590 50  0001 C CNN
F 3 "~" H 5200 4600 50  0001 C CNN
	1    5200 4600
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 5FDDADEA
P 5850 4700
AR Path="/5FDDADEA" Ref="R?"  Part="1" 
AR Path="/5FDCE2F2/5FDDADEA" Ref="R?"  Part="1" 
AR Path="/5FDD8FDE/5FDDADEA" Ref="R?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDADEA" Ref="R82"  Part="1" 
F 0 "R82" V 5645 4700 50  0000 C CNN
F 1 "33k" V 5736 4700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5890 4690 50  0001 C CNN
F 3 "~" H 5850 4700 50  0001 C CNN
	1    5850 4700
	0    1    1    0   
$EndComp
Wire Wire Line
	5600 5150 5350 5150
Wire Wire Line
	5600 5150 5600 4700
Wire Wire Line
	5600 4700 5700 4700
Wire Wire Line
	5600 4700 5600 4600
Wire Wire Line
	5600 4300 5700 4300
Connection ~ 5600 4700
Wire Wire Line
	6200 5250 6200 4700
Wire Wire Line
	6200 4700 6000 4700
Wire Wire Line
	6000 4300 6200 4300
Wire Wire Line
	6200 4300 6200 4700
Connection ~ 6200 4700
Wire Wire Line
	5350 4600 5600 4600
Connection ~ 5600 4600
Wire Wire Line
	5600 4600 5600 4300
Wire Wire Line
	5600 5350 5500 5350
Wire Wire Line
	5500 5350 5500 5550
Wire Wire Line
	6200 5250 6600 5250
$Comp
L Eurorack_Symbols:Thonkiconn_Mono J?
U 1 1 5FDDAE0A
P 4500 5200
AR Path="/5FDDAE0A" Ref="J?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAE0A" Ref="J?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAE0A" Ref="J?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAE0A" Ref="J21"  Part="1" 
F 0 "J21" H 4317 5220 50  0000 R CNN
F 1 "Thonkiconn_Mono" H 4650 5050 50  0000 R CNN
F 2 "PROJECT_FOOTPRINTS:Jack_3.5mm_Thonkiconn_Mono" H 4800 5150 50  0001 C CNN
F 3 "" H 4800 5150 50  0001 C CNN
	1    4500 5200
	1    0    0    1   
$EndComp
Wire Wire Line
	4750 5150 4950 5150
Wire Wire Line
	4750 5350 4750 5400
$Comp
L power:GND #PWR?
U 1 1 5FDDAE13
P 4750 5550
AR Path="/5FDDAE13" Ref="#PWR?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAE13" Ref="#PWR?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAE13" Ref="#PWR?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAE13" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 4750 5300 50  0001 C CNN
F 1 "GND" H 4755 5377 50  0000 C CNN
F 2 "" H 4750 5550 50  0001 C CNN
F 3 "" H 4750 5550 50  0001 C CNN
	1    4750 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 5250 4800 5250
Wire Wire Line
	4800 5250 4800 5400
Wire Wire Line
	4800 5400 4750 5400
Connection ~ 4750 5400
Wire Wire Line
	4750 5400 4750 5550
Text GLabel 4900 4600 0    50   Input ~ 0
AREF_-10
Wire Wire Line
	4900 4600 5050 4600
Text Notes 3950 5500 0    50   ~ 0
-5.0 to +5.0 V
Text Notes 6350 5450 0    50   ~ 0
+3.3 to 0.0 V
$Comp
L power:GND #PWR?
U 1 1 5FDDAE22
P 2250 7150
AR Path="/5FDDAE22" Ref="#PWR?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAE22" Ref="#PWR?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAE22" Ref="#PWR?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAE22" Ref="#PWR0103"  Part="1" 
F 0 "#PWR0103" H 2250 6900 50  0001 C CNN
F 1 "GND" H 2255 6977 50  0000 C CNN
F 2 "" H 2250 7150 50  0001 C CNN
F 3 "" H 2250 7150 50  0001 C CNN
	1    2250 7150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 5FDDAE28
P 1950 6750
AR Path="/5FDDAE28" Ref="R?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAE28" Ref="R?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAE28" Ref="R?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAE28" Ref="R67"  Part="1" 
F 0 "R67" V 1745 6750 50  0000 C CNN
F 1 "100k" V 1836 6750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 1990 6740 50  0001 C CNN
F 3 "~" H 1950 6750 50  0001 C CNN
	1    1950 6750
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 5FDDAE2F
P 1950 6200
AR Path="/5FDDAE2F" Ref="R?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAE2F" Ref="R?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAE2F" Ref="R?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAE2F" Ref="R66"  Part="1" 
F 0 "R66" V 1745 6200 50  0000 C CNN
F 1 "200k" V 1836 6200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 1990 6190 50  0001 C CNN
F 3 "~" H 1950 6200 50  0001 C CNN
	1    1950 6200
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 5FDDAE36
P 2600 6300
AR Path="/5FDDAE36" Ref="R?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAE36" Ref="R?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAE36" Ref="R?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAE36" Ref="R71"  Part="1" 
F 0 "R71" V 2395 6300 50  0000 C CNN
F 1 "33k" V 2486 6300 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 2640 6290 50  0001 C CNN
F 3 "~" H 2600 6300 50  0001 C CNN
	1    2600 6300
	0    1    1    0   
$EndComp
Wire Wire Line
	2350 6750 2100 6750
Wire Wire Line
	2350 6750 2350 6300
Wire Wire Line
	2350 6300 2450 6300
Wire Wire Line
	2350 6300 2350 6200
Wire Wire Line
	2350 5900 2450 5900
Connection ~ 2350 6300
Wire Wire Line
	2950 6850 2950 6300
Wire Wire Line
	2950 6300 2750 6300
Wire Wire Line
	2750 5900 2950 5900
Wire Wire Line
	2950 5900 2950 6300
Connection ~ 2950 6300
Wire Wire Line
	2100 6200 2350 6200
Connection ~ 2350 6200
Wire Wire Line
	2350 6200 2350 5900
Wire Wire Line
	2350 6950 2250 6950
Wire Wire Line
	2250 6950 2250 7150
Wire Wire Line
	2950 6850 3350 6850
$Comp
L Eurorack_Symbols:Thonkiconn_Mono J?
U 1 1 5FDDAE56
P 1250 6800
AR Path="/5FDDAE56" Ref="J?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAE56" Ref="J?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAE56" Ref="J?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAE56" Ref="J18"  Part="1" 
F 0 "J18" H 1067 6820 50  0000 R CNN
F 1 "Thonkiconn_Mono" H 1400 6650 50  0000 R CNN
F 2 "PROJECT_FOOTPRINTS:Jack_3.5mm_Thonkiconn_Mono" H 1550 6750 50  0001 C CNN
F 3 "" H 1550 6750 50  0001 C CNN
	1    1250 6800
	1    0    0    1   
$EndComp
Wire Wire Line
	1500 6750 1700 6750
Wire Wire Line
	1500 6950 1500 7000
$Comp
L power:GND #PWR?
U 1 1 5FDDAE5F
P 1500 7150
AR Path="/5FDDAE5F" Ref="#PWR?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAE5F" Ref="#PWR?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAE5F" Ref="#PWR?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAE5F" Ref="#PWR099"  Part="1" 
F 0 "#PWR099" H 1500 6900 50  0001 C CNN
F 1 "GND" H 1505 6977 50  0000 C CNN
F 2 "" H 1500 7150 50  0001 C CNN
F 3 "" H 1500 7150 50  0001 C CNN
	1    1500 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 6850 1550 6850
Wire Wire Line
	1550 6850 1550 7000
Wire Wire Line
	1550 7000 1500 7000
Connection ~ 1500 7000
Wire Wire Line
	1500 7000 1500 7150
Text GLabel 1650 6200 0    50   Input ~ 0
AREF_-10
Wire Wire Line
	1650 6200 1800 6200
Text Notes 700  7100 0    50   ~ 0
-5.0 to +5.0 V
Text Notes 3100 7050 0    50   ~ 0
+3.3 to 0.0 V
$Comp
L power:GND #PWR?
U 1 1 5FDDAE6E
P 5550 7150
AR Path="/5FDDAE6E" Ref="#PWR?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAE6E" Ref="#PWR?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAE6E" Ref="#PWR?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAE6E" Ref="#PWR0111"  Part="1" 
F 0 "#PWR0111" H 5550 6900 50  0001 C CNN
F 1 "GND" H 5555 6977 50  0000 C CNN
F 2 "" H 5550 7150 50  0001 C CNN
F 3 "" H 5550 7150 50  0001 C CNN
	1    5550 7150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 5FDDAE74
P 5250 6750
AR Path="/5FDDAE74" Ref="R?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAE74" Ref="R?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAE74" Ref="R?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAE74" Ref="R79"  Part="1" 
F 0 "R79" V 5045 6750 50  0000 C CNN
F 1 "100k" V 5136 6750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5290 6740 50  0001 C CNN
F 3 "~" H 5250 6750 50  0001 C CNN
	1    5250 6750
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 5FDDAE7B
P 5250 6200
AR Path="/5FDDAE7B" Ref="R?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAE7B" Ref="R?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAE7B" Ref="R?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAE7B" Ref="R78"  Part="1" 
F 0 "R78" V 5045 6200 50  0000 C CNN
F 1 "200k" V 5136 6200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5290 6190 50  0001 C CNN
F 3 "~" H 5250 6200 50  0001 C CNN
	1    5250 6200
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 5FDDAE82
P 5900 6300
AR Path="/5FDDAE82" Ref="R?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAE82" Ref="R?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAE82" Ref="R?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAE82" Ref="R83"  Part="1" 
F 0 "R83" V 5695 6300 50  0000 C CNN
F 1 "33k" V 5786 6300 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 5940 6290 50  0001 C CNN
F 3 "~" H 5900 6300 50  0001 C CNN
	1    5900 6300
	0    1    1    0   
$EndComp
Wire Wire Line
	5650 6750 5400 6750
Wire Wire Line
	5650 6750 5650 6300
Wire Wire Line
	5650 6300 5750 6300
Wire Wire Line
	5650 6300 5650 6200
Wire Wire Line
	5650 5900 5750 5900
Connection ~ 5650 6300
Wire Wire Line
	6250 6850 6250 6300
Wire Wire Line
	6250 6300 6050 6300
Wire Wire Line
	6050 5900 6250 5900
Wire Wire Line
	6250 5900 6250 6300
Connection ~ 6250 6300
Wire Wire Line
	5400 6200 5650 6200
Connection ~ 5650 6200
Wire Wire Line
	5650 6200 5650 5900
Wire Wire Line
	5650 6950 5550 6950
Wire Wire Line
	5550 6950 5550 7150
Wire Wire Line
	6250 6850 6650 6850
$Comp
L Eurorack_Symbols:Thonkiconn_Mono J?
U 1 1 5FDDAEA2
P 4550 6800
AR Path="/5FDDAEA2" Ref="J?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAEA2" Ref="J?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAEA2" Ref="J?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAEA2" Ref="J22"  Part="1" 
F 0 "J22" H 4367 6820 50  0000 R CNN
F 1 "Thonkiconn_Mono" H 4700 6650 50  0000 R CNN
F 2 "PROJECT_FOOTPRINTS:Jack_3.5mm_Thonkiconn_Mono" H 4850 6750 50  0001 C CNN
F 3 "" H 4850 6750 50  0001 C CNN
	1    4550 6800
	1    0    0    1   
$EndComp
Wire Wire Line
	4800 6750 5000 6750
Wire Wire Line
	4800 6950 4800 7000
$Comp
L power:GND #PWR?
U 1 1 5FDDAEAB
P 4800 7150
AR Path="/5FDDAEAB" Ref="#PWR?"  Part="1" 
AR Path="/5FDCE2F2/5FDDAEAB" Ref="#PWR?"  Part="1" 
AR Path="/5FDD8FDE/5FDDAEAB" Ref="#PWR?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FDDAEAB" Ref="#PWR0107"  Part="1" 
F 0 "#PWR0107" H 4800 6900 50  0001 C CNN
F 1 "GND" H 4805 6977 50  0000 C CNN
F 2 "" H 4800 7150 50  0001 C CNN
F 3 "" H 4800 7150 50  0001 C CNN
	1    4800 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 6850 4850 6850
Wire Wire Line
	4850 6850 4850 7000
Wire Wire Line
	4850 7000 4800 7000
Connection ~ 4800 7000
Wire Wire Line
	4800 7000 4800 7150
Text GLabel 4950 6200 0    50   Input ~ 0
AREF_-10
Wire Wire Line
	4950 6200 5100 6200
Text Notes 4000 7100 0    50   ~ 0
-5.0 to +5.0 V
Text Notes 6400 7050 0    50   ~ 0
+3.3 to 0.0 V
$Comp
L Amplifier_Operational:MCP6004 U?
U 2 1 5FDDAEBA
P 5900 3600
AR Path="/5FDDAEBA" Ref="U?"  Part="2" 
AR Path="/5FDCE2F2/5FDDAEBA" Ref="U?"  Part="2" 
AR Path="/5FDD8FDE/5FDDAEBA" Ref="U?"  Part="2" 
AR Path="/606BA1B5/606C6F2E/5FDDAEBA" Ref="U14"  Part="2" 
F 0 "U14" H 5900 3967 50  0000 C CNN
F 1 "MCP6004" H 5900 3876 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5850 3700 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21733j.pdf" H 5950 3800 50  0001 C CNN
	2    5900 3600
	1    0    0    1   
$EndComp
$Comp
L Amplifier_Operational:MCP6004 U?
U 3 1 5FDDAEC3
P 5900 5250
AR Path="/5FDDAEC3" Ref="U?"  Part="3" 
AR Path="/5FDCE2F2/5FDDAEC3" Ref="U?"  Part="3" 
AR Path="/5FDD8FDE/5FDDAEC3" Ref="U?"  Part="3" 
AR Path="/606BA1B5/606C6F2E/5FDDAEC3" Ref="U14"  Part="3" 
F 0 "U14" H 5900 5617 50  0000 C CNN
F 1 "MCP6004" H 5900 5526 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5850 5350 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21733j.pdf" H 5950 5450 50  0001 C CNN
	3    5900 5250
	1    0    0    1   
$EndComp
$Comp
L Amplifier_Operational:MCP6004 U?
U 4 1 5FDDAECC
P 5950 6850
AR Path="/5FDDAECC" Ref="U?"  Part="4" 
AR Path="/5FDCE2F2/5FDDAECC" Ref="U?"  Part="4" 
AR Path="/5FDD8FDE/5FDDAECC" Ref="U?"  Part="4" 
AR Path="/606BA1B5/606C6F2E/5FDDAECC" Ref="U14"  Part="4" 
F 0 "U14" H 5950 7217 50  0000 C CNN
F 1 "MCP6004" H 5950 7126 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5900 6950 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21733j.pdf" H 6000 7050 50  0001 C CNN
	4    5950 6850
	1    0    0    1   
$EndComp
Connection ~ 5650 6750
Connection ~ 6250 6850
$Comp
L Amplifier_Operational:MCP6004 U?
U 5 1 5FE2D93F
P 8100 1550
AR Path="/5FDCE2F2/5FE2D93F" Ref="U?"  Part="5" 
AR Path="/5FDD8FDE/5FE2D93F" Ref="U?"  Part="5" 
AR Path="/606BA1B5/606C6F2E/5FE2D93F" Ref="U13"  Part="5" 
F 0 "U13" H 8058 1596 50  0000 L CNN
F 1 "MCP6004" H 8058 1505 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 8050 1650 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21733j.pdf" H 8150 1750 50  0001 C CNN
	5    8100 1550
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:MCP6004 U?
U 5 1 5FE2D946
P 8800 1550
AR Path="/5FDCE2F2/5FE2D946" Ref="U?"  Part="5" 
AR Path="/5FDD8FDE/5FE2D946" Ref="U?"  Part="5" 
AR Path="/606BA1B5/606C6F2E/5FE2D946" Ref="U14"  Part="5" 
F 0 "U14" H 8758 1596 50  0000 L CNN
F 1 "MCP6004" H 8758 1505 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 8750 1650 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21733j.pdf" H 8850 1750 50  0001 C CNN
	5    8800 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5FE2D94D
P 9350 1550
AR Path="/5FDCE2F2/5FE2D94D" Ref="C?"  Part="1" 
AR Path="/5FDD8FDE/5FE2D94D" Ref="C?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FE2D94D" Ref="C51"  Part="1" 
F 0 "C51" H 9465 1596 50  0000 L CNN
F 1 "100n" H 9465 1505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 9388 1400 50  0001 C CNN
F 3 "~" H 9350 1550 50  0001 C CNN
	1    9350 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5FE2D954
P 9900 1550
AR Path="/5FDCE2F2/5FE2D954" Ref="C?"  Part="1" 
AR Path="/5FDD8FDE/5FE2D954" Ref="C?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FE2D954" Ref="C52"  Part="1" 
F 0 "C52" H 10015 1596 50  0000 L CNN
F 1 "100n" H 10015 1505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 9938 1400 50  0001 C CNN
F 3 "~" H 9900 1550 50  0001 C CNN
	1    9900 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 1250 8700 1250
Connection ~ 8700 1250
Wire Wire Line
	8700 1250 9000 1250
Wire Wire Line
	8000 1850 8700 1850
Connection ~ 8700 1850
Wire Wire Line
	8700 1850 9050 1850
$Comp
L power:GND #PWR?
U 1 1 5FE2D967
P 9050 1850
AR Path="/5FDCE2F2/5FE2D967" Ref="#PWR?"  Part="1" 
AR Path="/5FDD8FDE/5FE2D967" Ref="#PWR?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FE2D967" Ref="#PWR0114"  Part="1" 
F 0 "#PWR0114" H 9050 1600 50  0001 C CNN
F 1 "GND" H 9055 1677 50  0000 C CNN
F 2 "" H 9050 1850 50  0001 C CNN
F 3 "" H 9050 1850 50  0001 C CNN
	1    9050 1850
	1    0    0    -1  
$EndComp
Connection ~ 9050 1850
$Comp
L power:+3.3VA #PWR?
U 1 1 5FE2D96F
P 9000 1250
AR Path="/5FDCE2F2/5FE2D96F" Ref="#PWR?"  Part="1" 
AR Path="/5FDD8FDE/5FE2D96F" Ref="#PWR?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/5FE2D96F" Ref="#PWR0113"  Part="1" 
F 0 "#PWR0113" H 9000 1100 50  0001 C CNN
F 1 "+3.3VA" H 9015 1423 50  0000 C CNN
F 2 "" H 9000 1250 50  0001 C CNN
F 3 "" H 9000 1250 50  0001 C CNN
	1    9000 1250
	1    0    0    -1  
$EndComp
Connection ~ 9000 1250
$Comp
L 4xxx:4051 U?
U 1 1 606D54DF
P 9200 4050
AR Path="/606D54DF" Ref="U?"  Part="1" 
AR Path="/606BA1B5/606D54DF" Ref="U?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/606D54DF" Ref="U15"  Part="1" 
F 0 "U15" H 9741 4096 50  0000 L CNN
F 1 "4051" H 9741 4005 50  0000 L CNN
F 2 "Package_SO:SOP-16_4.4x10.4mm_P1.27mm" H 9200 4050 50  0001 C CNN
F 3 "http://www.intersil.com/content/dam/Intersil/documents/cd40/cd4051bms-52bms-53bms.pdf" H 9200 4050 50  0001 C CNN
	1    9200 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 4950 9250 4950
$Comp
L power:GND #PWR?
U 1 1 606D54EA
P 9250 4950
AR Path="/606D54EA" Ref="#PWR?"  Part="1" 
AR Path="/606BA1B5/606D54EA" Ref="#PWR?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/606D54EA" Ref="#PWR0116"  Part="1" 
F 0 "#PWR0116" H 9250 4700 50  0001 C CNN
F 1 "GND" H 9255 4777 50  0000 C CNN
F 2 "" H 9250 4950 50  0001 C CNN
F 3 "" H 9250 4950 50  0001 C CNN
	1    9250 4950
	1    0    0    -1  
$EndComp
Connection ~ 9250 4950
Wire Wire Line
	9250 4950 9300 4950
$Comp
L power:+3.3VA #PWR?
U 1 1 606D54F3
P 9200 3000
AR Path="/606D54F3" Ref="#PWR?"  Part="1" 
AR Path="/606BA1B5/606D54F3" Ref="#PWR?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/606D54F3" Ref="#PWR0115"  Part="1" 
F 0 "#PWR0115" H 9200 2850 50  0001 C CNN
F 1 "+3.3VA" H 9215 3173 50  0000 C CNN
F 2 "" H 9200 3000 50  0001 C CNN
F 3 "" H 9200 3000 50  0001 C CNN
	1    9200 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 606DE41B
P 7900 3350
AR Path="/5FDCE2F2/606DE41B" Ref="C?"  Part="1" 
AR Path="/5FDD8FDE/606DE41B" Ref="C?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/606DE41B" Ref="C50"  Part="1" 
F 0 "C50" H 8015 3396 50  0000 L CNN
F 1 "100n" H 8015 3305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 7938 3200 50  0001 C CNN
F 3 "~" H 7900 3350 50  0001 C CNN
	1    7900 3350
	1    0    0    -1  
$EndComp
Text Label 3250 2000 0    50   ~ 0
CV_IN_8
Text Label 3300 3600 0    50   ~ 0
CV_IN_9
Text Label 3300 5250 0    50   ~ 0
CV_IN_10
Text Label 3350 6850 0    50   ~ 0
CV_IN_11
Text Label 6550 2000 0    50   ~ 0
CV_IN_12
Text Label 6600 3600 0    50   ~ 0
CV_IN_13
Text Label 6600 5250 0    50   ~ 0
CV_IN_14
Text Label 6650 6850 0    50   ~ 0
CV_IN_15
Text Label 8700 3450 2    50   ~ 0
CV_IN_8
Text Label 8700 3550 2    50   ~ 0
CV_IN_9
Text Label 8700 3650 2    50   ~ 0
CV_IN_10
Text Label 8700 3750 2    50   ~ 0
CV_IN_11
Text Label 8700 3850 2    50   ~ 0
CV_IN_12
Text Label 8700 3950 2    50   ~ 0
CV_IN_13
Text Label 8700 4050 2    50   ~ 0
CV_IN_14
Text Label 8700 4150 2    50   ~ 0
CV_IN_15
Text HLabel 8700 4350 0    50   Input ~ 0
MUX_ADDR_3n
Text HLabel 8700 4450 0    50   Input ~ 0
MUX_ADDR_0
Text HLabel 8700 4550 0    50   Input ~ 0
MUX_ADDR_1
Text HLabel 8700 4650 0    50   Input ~ 0
MUX_ADDR_2
Text HLabel 9700 3450 2    50   Output ~ 0
CV_IN_MUXED
Wire Wire Line
	9050 1850 9350 1850
Wire Wire Line
	9000 1250 9350 1250
Wire Wire Line
	9900 1700 9900 1850
Wire Wire Line
	9350 1700 9350 1850
Connection ~ 9350 1850
Wire Wire Line
	9350 1850 9900 1850
Wire Wire Line
	9350 1400 9350 1250
Connection ~ 9350 1250
Wire Wire Line
	9350 1250 9900 1250
Wire Wire Line
	9900 1400 9900 1250
Wire Wire Line
	9200 3000 9200 3100
Wire Wire Line
	9200 3100 7900 3100
Wire Wire Line
	7900 3100 7900 3200
Connection ~ 9200 3100
Wire Wire Line
	9200 3100 9200 3150
$Comp
L power:GND #PWR0112
U 1 1 60896902
P 7900 3500
F 0 "#PWR0112" H 7900 3250 50  0001 C CNN
F 1 "GND" H 7905 3327 50  0000 C CNN
F 2 "" H 7900 3500 50  0001 C CNN
F 3 "" H 7900 3500 50  0001 C CNN
	1    7900 3500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x08 J23
U 1 1 607C502F
P 8900 5650
F 0 "J23" H 8980 5642 50  0000 L CNN
F 1 "Conn_01x08" H 8980 5551 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 8900 5650 50  0001 C CNN
F 3 "~" H 8900 5650 50  0001 C CNN
	1    8900 5650
	1    0    0    -1  
$EndComp
Text Label 8700 5350 2    50   ~ 0
CV_IN_8
Text Label 8700 5450 2    50   ~ 0
CV_IN_9
Text Label 8700 5550 2    50   ~ 0
CV_IN_10
Text Label 8700 5650 2    50   ~ 0
CV_IN_11
Text Label 8700 5750 2    50   ~ 0
CV_IN_12
Text Label 8700 5850 2    50   ~ 0
CV_IN_13
Text Label 8700 5950 2    50   ~ 0
CV_IN_14
Text Label 8700 6050 2    50   ~ 0
CV_IN_15
$Comp
L Device:D_TVS D?
U 1 1 609252B7
P 1600 2100
AR Path="/606BA1B5/606BEB7D/609252B7" Ref="D?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/609252B7" Ref="D26"  Part="1" 
F 0 "D26" V 1554 2179 50  0000 L CNN
F 1 "D_TVS" V 1645 2179 50  0000 L CNN
F 2 "Diode_SMD:D_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1600 2100 50  0001 C CNN
F 3 "~" H 1600 2100 50  0001 C CNN
	1    1600 2100
	0    1    1    0   
$EndComp
Wire Wire Line
	1600 2250 1600 2300
$Comp
L power:GND #PWR?
U 1 1 609252C0
P 1600 2300
AR Path="/606BA1B5/606BEB7D/609252C0" Ref="#PWR?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/609252C0" Ref="#PWR0126"  Part="1" 
F 0 "#PWR0126" H 1600 2050 50  0001 C CNN
F 1 "GND" H 1605 2127 50  0000 C CNN
F 2 "" H 1600 2300 50  0001 C CNN
F 3 "" H 1600 2300 50  0001 C CNN
	1    1600 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:D_TVS D?
U 1 1 6092E81A
P 1650 3700
AR Path="/606BA1B5/606BEB7D/6092E81A" Ref="D?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/6092E81A" Ref="D27"  Part="1" 
F 0 "D27" V 1604 3779 50  0000 L CNN
F 1 "D_TVS" V 1695 3779 50  0000 L CNN
F 2 "Diode_SMD:D_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1650 3700 50  0001 C CNN
F 3 "~" H 1650 3700 50  0001 C CNN
	1    1650 3700
	0    1    1    0   
$EndComp
Wire Wire Line
	1650 3550 1650 3500
Wire Wire Line
	1650 3850 1650 3900
$Comp
L power:GND #PWR?
U 1 1 6092E823
P 1650 3900
AR Path="/606BA1B5/606BEB7D/6092E823" Ref="#PWR?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/6092E823" Ref="#PWR0127"  Part="1" 
F 0 "#PWR0127" H 1650 3650 50  0001 C CNN
F 1 "GND" H 1655 3727 50  0000 C CNN
F 2 "" H 1650 3900 50  0001 C CNN
F 3 "" H 1650 3900 50  0001 C CNN
	1    1650 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:D_TVS D?
U 1 1 6093804A
P 1650 5350
AR Path="/606BA1B5/606BEB7D/6093804A" Ref="D?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/6093804A" Ref="D28"  Part="1" 
F 0 "D28" V 1604 5429 50  0000 L CNN
F 1 "D_TVS" V 1695 5429 50  0000 L CNN
F 2 "Diode_SMD:D_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1650 5350 50  0001 C CNN
F 3 "~" H 1650 5350 50  0001 C CNN
	1    1650 5350
	0    1    1    0   
$EndComp
Wire Wire Line
	1650 5200 1650 5150
Wire Wire Line
	1650 5500 1650 5550
$Comp
L power:GND #PWR?
U 1 1 60938053
P 1650 5550
AR Path="/606BA1B5/606BEB7D/60938053" Ref="#PWR?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/60938053" Ref="#PWR0128"  Part="1" 
F 0 "#PWR0128" H 1650 5300 50  0001 C CNN
F 1 "GND" H 1655 5377 50  0000 C CNN
F 2 "" H 1650 5550 50  0001 C CNN
F 3 "" H 1650 5550 50  0001 C CNN
	1    1650 5550
	1    0    0    -1  
$EndComp
$Comp
L Device:D_TVS D?
U 1 1 60942072
P 1700 6950
AR Path="/606BA1B5/606BEB7D/60942072" Ref="D?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/60942072" Ref="D29"  Part="1" 
F 0 "D29" V 1654 7029 50  0000 L CNN
F 1 "D_TVS" V 1745 7029 50  0000 L CNN
F 2 "Diode_SMD:D_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 1700 6950 50  0001 C CNN
F 3 "~" H 1700 6950 50  0001 C CNN
	1    1700 6950
	0    1    1    0   
$EndComp
Wire Wire Line
	1700 6800 1700 6750
Wire Wire Line
	1700 7100 1700 7150
$Comp
L power:GND #PWR?
U 1 1 6094207B
P 1700 7150
AR Path="/606BA1B5/606BEB7D/6094207B" Ref="#PWR?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/6094207B" Ref="#PWR0129"  Part="1" 
F 0 "#PWR0129" H 1700 6900 50  0001 C CNN
F 1 "GND" H 1705 6977 50  0000 C CNN
F 2 "" H 1700 7150 50  0001 C CNN
F 3 "" H 1700 7150 50  0001 C CNN
	1    1700 7150
	1    0    0    -1  
$EndComp
$Comp
L Device:D_TVS D?
U 1 1 6094BE72
P 5000 6950
AR Path="/606BA1B5/606BEB7D/6094BE72" Ref="D?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/6094BE72" Ref="D33"  Part="1" 
F 0 "D33" V 4954 7029 50  0000 L CNN
F 1 "D_TVS" V 5045 7029 50  0000 L CNN
F 2 "Diode_SMD:D_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5000 6950 50  0001 C CNN
F 3 "~" H 5000 6950 50  0001 C CNN
	1    5000 6950
	0    1    1    0   
$EndComp
Wire Wire Line
	5000 6800 5000 6750
Wire Wire Line
	5000 7100 5000 7150
$Comp
L power:GND #PWR?
U 1 1 6094BE7B
P 5000 7150
AR Path="/606BA1B5/606BEB7D/6094BE7B" Ref="#PWR?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/6094BE7B" Ref="#PWR0133"  Part="1" 
F 0 "#PWR0133" H 5000 6900 50  0001 C CNN
F 1 "GND" H 5005 6977 50  0000 C CNN
F 2 "" H 5000 7150 50  0001 C CNN
F 3 "" H 5000 7150 50  0001 C CNN
	1    5000 7150
	1    0    0    -1  
$EndComp
$Comp
L Device:D_TVS D?
U 1 1 60955DDD
P 4950 5350
AR Path="/606BA1B5/606BEB7D/60955DDD" Ref="D?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/60955DDD" Ref="D32"  Part="1" 
F 0 "D32" V 4904 5429 50  0000 L CNN
F 1 "D_TVS" V 4995 5429 50  0000 L CNN
F 2 "Diode_SMD:D_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4950 5350 50  0001 C CNN
F 3 "~" H 4950 5350 50  0001 C CNN
	1    4950 5350
	0    1    1    0   
$EndComp
Wire Wire Line
	4950 5200 4950 5150
Wire Wire Line
	4950 5500 4950 5550
$Comp
L power:GND #PWR?
U 1 1 60955DE6
P 4950 5550
AR Path="/606BA1B5/606BEB7D/60955DE6" Ref="#PWR?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/60955DE6" Ref="#PWR0132"  Part="1" 
F 0 "#PWR0132" H 4950 5300 50  0001 C CNN
F 1 "GND" H 4955 5377 50  0000 C CNN
F 2 "" H 4950 5550 50  0001 C CNN
F 3 "" H 4950 5550 50  0001 C CNN
	1    4950 5550
	1    0    0    -1  
$EndComp
$Comp
L Device:D_TVS D?
U 1 1 6096024D
P 4950 3700
AR Path="/606BA1B5/606BEB7D/6096024D" Ref="D?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/6096024D" Ref="D31"  Part="1" 
F 0 "D31" V 4904 3779 50  0000 L CNN
F 1 "D_TVS" V 4995 3779 50  0000 L CNN
F 2 "Diode_SMD:D_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4950 3700 50  0001 C CNN
F 3 "~" H 4950 3700 50  0001 C CNN
	1    4950 3700
	0    1    1    0   
$EndComp
Wire Wire Line
	4950 3550 4950 3500
Wire Wire Line
	4950 3850 4950 3900
$Comp
L power:GND #PWR?
U 1 1 60960256
P 4950 3900
AR Path="/606BA1B5/606BEB7D/60960256" Ref="#PWR?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/60960256" Ref="#PWR0131"  Part="1" 
F 0 "#PWR0131" H 4950 3650 50  0001 C CNN
F 1 "GND" H 4955 3727 50  0000 C CNN
F 2 "" H 4950 3900 50  0001 C CNN
F 3 "" H 4950 3900 50  0001 C CNN
	1    4950 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:D_TVS D?
U 1 1 6096A8AA
P 4900 2100
AR Path="/606BA1B5/606BEB7D/6096A8AA" Ref="D?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/6096A8AA" Ref="D30"  Part="1" 
F 0 "D30" V 4854 2179 50  0000 L CNN
F 1 "D_TVS" V 4945 2179 50  0000 L CNN
F 2 "Diode_SMD:D_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4900 2100 50  0001 C CNN
F 3 "~" H 4900 2100 50  0001 C CNN
	1    4900 2100
	0    1    1    0   
$EndComp
Wire Wire Line
	4900 2250 4900 2300
$Comp
L power:GND #PWR?
U 1 1 6096A8B3
P 4900 2300
AR Path="/606BA1B5/606BEB7D/6096A8B3" Ref="#PWR?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/6096A8B3" Ref="#PWR0130"  Part="1" 
F 0 "#PWR0130" H 4900 2050 50  0001 C CNN
F 1 "GND" H 4905 2127 50  0000 C CNN
F 2 "" H 4900 2300 50  0001 C CNN
F 3 "" H 4900 2300 50  0001 C CNN
	1    4900 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 609D2CBC
P 2500 1050
AR Path="/606BA1B5/606BEB7D/609D2CBC" Ref="C?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/609D2CBC" Ref="C42"  Part="1" 
F 0 "C42" V 2248 1050 50  0000 C CNN
F 1 "1n" V 2339 1050 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2538 900 50  0001 C CNN
F 3 "~" H 2500 1050 50  0001 C CNN
	1    2500 1050
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 609DD354
P 2550 2650
AR Path="/606BA1B5/606BEB7D/609DD354" Ref="C?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/609DD354" Ref="C43"  Part="1" 
F 0 "C43" V 2298 2650 50  0000 C CNN
F 1 "1n" V 2389 2650 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2588 2500 50  0001 C CNN
F 3 "~" H 2550 2650 50  0001 C CNN
	1    2550 2650
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 609E7AD0
P 2550 4300
AR Path="/606BA1B5/606BEB7D/609E7AD0" Ref="C?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/609E7AD0" Ref="C44"  Part="1" 
F 0 "C44" V 2298 4300 50  0000 C CNN
F 1 "1n" V 2389 4300 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2588 4150 50  0001 C CNN
F 3 "~" H 2550 4300 50  0001 C CNN
	1    2550 4300
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 609F22DE
P 2600 5900
AR Path="/606BA1B5/606BEB7D/609F22DE" Ref="C?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/609F22DE" Ref="C45"  Part="1" 
F 0 "C45" V 2348 5900 50  0000 C CNN
F 1 "1n" V 2439 5900 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 2638 5750 50  0001 C CNN
F 3 "~" H 2600 5900 50  0001 C CNN
	1    2600 5900
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 609FC925
P 5900 5900
AR Path="/606BA1B5/606BEB7D/609FC925" Ref="C?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/609FC925" Ref="C49"  Part="1" 
F 0 "C49" V 5648 5900 50  0000 C CNN
F 1 "1n" V 5739 5900 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5938 5750 50  0001 C CNN
F 3 "~" H 5900 5900 50  0001 C CNN
	1    5900 5900
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 60A07128
P 5850 4300
AR Path="/606BA1B5/606BEB7D/60A07128" Ref="C?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/60A07128" Ref="C48"  Part="1" 
F 0 "C48" V 5598 4300 50  0000 C CNN
F 1 "1n" V 5689 4300 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5888 4150 50  0001 C CNN
F 3 "~" H 5850 4300 50  0001 C CNN
	1    5850 4300
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 60A1183C
P 5850 2650
AR Path="/606BA1B5/606BEB7D/60A1183C" Ref="C?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/60A1183C" Ref="C47"  Part="1" 
F 0 "C47" V 5598 2650 50  0000 C CNN
F 1 "1n" V 5689 2650 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5888 2500 50  0001 C CNN
F 3 "~" H 5850 2650 50  0001 C CNN
	1    5850 2650
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 60A1BD9E
P 5800 1050
AR Path="/606BA1B5/606BEB7D/60A1BD9E" Ref="C?"  Part="1" 
AR Path="/606BA1B5/606C6F2E/60A1BD9E" Ref="C46"  Part="1" 
F 0 "C46" V 5548 1050 50  0000 C CNN
F 1 "1n" V 5639 1050 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5838 900 50  0001 C CNN
F 3 "~" H 5800 1050 50  0001 C CNN
	1    5800 1050
	0    1    1    0   
$EndComp
Wire Wire Line
	1600 1950 1600 1900
Connection ~ 1600 1900
Wire Wire Line
	1600 1900 1700 1900
Wire Wire Line
	4900 1950 4900 1900
Connection ~ 4900 1900
Wire Wire Line
	4900 1900 5000 1900
Connection ~ 1650 3500
Wire Wire Line
	1650 3500 1750 3500
Connection ~ 1650 5150
Wire Wire Line
	1650 5150 1750 5150
Connection ~ 4950 5150
Wire Wire Line
	4950 5150 5050 5150
Connection ~ 4950 3500
Wire Wire Line
	4950 3500 5050 3500
Connection ~ 1700 6750
Wire Wire Line
	1700 6750 1800 6750
Connection ~ 5000 6750
Wire Wire Line
	5000 6750 5100 6750
Connection ~ 2300 3500
Connection ~ 2900 3600
Connection ~ 5550 1900
Connection ~ 6150 2000
Connection ~ 2300 5150
Connection ~ 2900 5250
Connection ~ 5600 3500
Connection ~ 6200 3600
Connection ~ 5600 5150
Connection ~ 6200 5250
Connection ~ 2350 6750
Connection ~ 2950 6850
Text Notes 8400 6350 0    50   ~ 0
External Breakout Connector \n(for debug and hacking)
$EndSCHEMATC
