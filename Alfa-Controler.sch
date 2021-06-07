EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L MCU_Module:Arduino_UNO_R3 A1
U 1 1 606C3E4D
P 1550 3900
F 0 "A1" H 1550 5081 50  0000 C CNN
F 1 "Arduino_UNO_R3" H 1550 4990 50  0000 C CNN
F 2 "Module:Arduino_UNO_R3" H 1550 3900 50  0001 C CIN
F 3 "https://www.arduino.cc/en/Main/arduinoBoardUno" H 1550 3900 50  0001 C CNN
	1    1550 3900
	-1   0    0    -1  
$EndComp
$Comp
L Motor:Motor_Servo M1
U 1 1 606CB7A9
P 6500 4100
F 0 "M1" V 6950 4150 50  0000 L CNN
F 1 "X-axis Servo" V 6850 3750 50  0000 L CNN
F 2 "Alfa-Controler:Servo_Pins" H 6500 3910 50  0001 C CNN
F 3 "http://forums.parallax.com/uploads/attachments/46831/74481.png" H 6500 3910 50  0001 C CNN
	1    6500 4100
	0    -1   -1   0   
$EndComp
$Comp
L Motor:Motor_Servo M2
U 1 1 606CCD21
P 7500 4100
F 0 "M2" V 7950 4150 50  0000 L CNN
F 1 "Y-axis Servo" V 7850 3750 50  0000 L CNN
F 2 "Alfa-Controler:Servo_Pins" H 7500 3910 50  0001 C CNN
F 3 "http://forums.parallax.com/uploads/attachments/46831/74481.png" H 7500 3910 50  0001 C CNN
	1    7500 4100
	0    -1   -1   0   
$EndComp
$Comp
L Device:CP C1
U 1 1 606CEC54
P 7550 4800
F 0 "C1" V 7300 4750 50  0000 L CNN
F 1 "100uF" V 7400 4700 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 7588 4650 50  0001 C CNN
F 3 "~" H 7550 4800 50  0001 C CNN
	1    7550 4800
	0    -1   -1   0   
$EndComp
$Comp
L Device:CP C2
U 1 1 606CF577
P 6550 4850
F 0 "C2" V 6300 4800 50  0000 L CNN
F 1 "100uF" V 6400 4750 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 6588 4700 50  0001 C CNN
F 3 "~" H 6550 4850 50  0001 C CNN
	1    6550 4850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7700 4800 7700 4650
Wire Wire Line
	7700 4650 7600 4650
Wire Wire Line
	7600 4650 7600 4400
Wire Wire Line
	7400 4800 7400 5100
Wire Wire Line
	7400 5100 6400 5100
Wire Wire Line
	6400 5100 6400 4850
Wire Wire Line
	6400 4850 6400 4650
Wire Wire Line
	6400 4650 6500 4650
Wire Wire Line
	6500 4650 6500 4400
Connection ~ 6400 4850
Wire Wire Line
	6600 4400 6600 4650
Wire Wire Line
	6600 4650 6700 4650
Wire Wire Line
	6700 4650 6700 4850
Wire Wire Line
	7500 4400 7500 4650
Wire Wire Line
	7500 4650 7400 4650
Wire Wire Line
	7400 4650 7400 4800
Connection ~ 7400 4800
Wire Wire Line
	6400 4400 6400 4550
Wire Wire Line
	7400 4400 7400 4550
Text Label 2500 4000 2    50   ~ 0
Servo_X
Wire Wire Line
	2050 4000 2500 4000
$Comp
L power:GND #PWR0104
U 1 1 60758C97
P 7850 5300
F 0 "#PWR0104" H 7850 5050 50  0001 C CNN
F 1 "GND" H 7855 5127 50  0000 C CNN
F 2 "" H 7850 5300 50  0001 C CNN
F 3 "" H 7850 5300 50  0001 C CNN
	1    7850 5300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 607590BA
P 1550 5150
F 0 "#PWR0105" H 1550 4900 50  0001 C CNN
F 1 "GND" H 1555 4977 50  0000 C CNN
F 2 "" H 1550 5150 50  0001 C CNN
F 3 "" H 1550 5150 50  0001 C CNN
	1    1550 5150
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1650 5000 1650 5050
Wire Wire Line
	1650 5050 1550 5050
Wire Wire Line
	1550 5050 1550 5150
Wire Wire Line
	1550 5000 1550 5050
Connection ~ 1550 5050
Wire Wire Line
	1450 5000 1450 5050
Wire Wire Line
	1450 5050 1550 5050
Wire Notes Line
	11300 4400 11300 5700
Text Label 2500 3500 2    50   ~ 0
INT
Wire Wire Line
	2500 3500 2050 3500
Wire Wire Line
	4100 4300 4100 4200
Wire Wire Line
	4100 4200 4450 4200
Connection ~ 4100 4200
Wire Wire Line
	4100 4200 4100 4050
Wire Wire Line
	4100 4400 4100 4500
Wire Wire Line
	4100 4500 4450 4500
Wire Wire Line
	4100 4500 4100 4650
Wire Wire Line
	4100 4650 4450 4650
Connection ~ 4100 4500
Wire Wire Line
	4100 4400 3700 4400
Text Label 4450 4500 2    50   ~ 0
SCL_MPU
Text Label 4450 4650 2    50   ~ 0
SCL_BMP
Text Label 4450 4200 2    50   ~ 0
SDA_BMP
Text Label 4450 4050 2    50   ~ 0
SDA_MPU
Wire Wire Line
	4100 4050 4450 4050
$Comp
L My_LIB:SD_CARD SD1
U 1 1 606E3FEE
P 4750 7250
F 0 "SD1" H 5100 7900 50  0000 L CNN
F 1 "SD_CARD" H 5000 7800 50  0000 L CNN
F 2 "Alfa-Controler:SD_CARD" H 4900 7750 50  0001 C CNN
F 3 "" H 4900 7750 50  0001 C CNN
	1    4750 7250
	1    0    0    -1  
$EndComp
$Comp
L My_LIB:MPU-6050BB U2
U 1 1 60720649
P 9950 4200
F 0 "U2" H 9900 4200 50  0000 L CNN
F 1 "MPU-6050BB" H 9750 4100 39  0000 L CNN
F 2 "Alfa-Controler:MPU6050" H 9900 4600 50  0001 C CNN
F 3 "" H 9900 4600 50  0001 C CNN
	1    9950 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 5450 9200 5450
Wire Wire Line
	9200 5450 9200 5250
Wire Wire Line
	9450 3950 9200 3950
Wire Wire Line
	9200 3950 9200 3700
$Comp
L power:+5V #PWR03
U 1 1 60744D1C
P 9200 3700
F 0 "#PWR03" H 9200 3550 50  0001 C CNN
F 1 "+5V" H 9215 3873 50  0000 C CNN
F 2 "" H 9200 3700 50  0001 C CNN
F 3 "" H 9200 3700 50  0001 C CNN
	1    9200 3700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR04
U 1 1 607453C1
P 9200 5250
F 0 "#PWR04" H 9200 5100 50  0001 C CNN
F 1 "+5V" H 9215 5423 50  0000 C CNN
F 2 "" H 9200 5250 50  0001 C CNN
F 3 "" H 9200 5250 50  0001 C CNN
	1    9200 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 6074597B
P 9450 4050
F 0 "#PWR05" H 9450 3800 50  0001 C CNN
F 1 "GND" V 9455 3922 50  0000 R CNN
F 2 "" H 9450 4050 50  0001 C CNN
F 3 "" H 9450 4050 50  0001 C CNN
	1    9450 4050
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR06
U 1 1 60746529
P 9450 5600
F 0 "#PWR06" H 9450 5350 50  0001 C CNN
F 1 "GND" V 9455 5472 50  0000 R CNN
F 2 "" H 9450 5600 50  0001 C CNN
F 3 "" H 9450 5600 50  0001 C CNN
	1    9450 5600
	0    1    1    0   
$EndComp
Wire Wire Line
	9450 5750 9100 5750
Wire Wire Line
	9450 5900 9100 5900
Text Label 8750 4250 0    50   ~ 0
SDA_MPU
Text Label 9100 5750 0    50   ~ 0
SCL_BMP
Text Label 9100 5900 0    50   ~ 0
SDA_BMP
Text Label 9100 4150 2    50   ~ 0
SCL_MPU
Wire Wire Line
	8750 4150 9450 4150
Wire Wire Line
	8750 4250 9450 4250
Wire Wire Line
	9450 4650 9100 4650
Text Label 9100 4650 0    50   ~ 0
INT
$Comp
L power:GND #PWR02
U 1 1 607525CA
P 3650 7200
F 0 "#PWR02" H 3650 6950 50  0001 C CNN
F 1 "GND" H 3655 7027 50  0000 C CNN
F 2 "" H 3650 7200 50  0001 C CNN
F 3 "" H 3650 7200 50  0001 C CNN
	1    3650 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 7050 3650 7050
Wire Wire Line
	3650 7050 3650 7200
$Comp
L Device:LED D1
U 1 1 609C19D9
P 6700 1500
F 0 "D1" H 6700 1300 50  0000 C CNN
F 1 "BLUE_LED" H 6700 1400 50  0000 C CNN
F 2 "LED_THT:LED_D4.0mm" H 6700 1500 50  0001 C CNN
F 3 "~" H 6700 1500 50  0001 C CNN
	1    6700 1500
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D2
U 1 1 609C3E82
P 6700 1800
F 0 "D2" H 6700 1600 50  0000 C CNN
F 1 "GREEN_LED" H 6700 1700 50  0000 C CNN
F 2 "LED_THT:LED_D4.0mm" H 6700 1800 50  0001 C CNN
F 3 "~" H 6700 1800 50  0001 C CNN
	1    6700 1800
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D3
U 1 1 609C5469
P 6700 2100
F 0 "D3" H 6700 1900 50  0000 C CNN
F 1 "RED_LED" H 6700 2000 50  0000 C CNN
F 2 "LED_THT:LED_D4.0mm" H 6700 2100 50  0001 C CNN
F 3 "~" H 6700 2100 50  0001 C CNN
	1    6700 2100
	-1   0    0    1   
$EndComp
$Comp
L Device:R R1
U 1 1 609CC87A
P 7150 1500
F 0 "R1" V 7050 1500 50  0000 C CNN
F 1 "220" V 7150 1500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7080 1500 50  0001 C CNN
F 3 "~" H 7150 1500 50  0001 C CNN
	1    7150 1500
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 609CE3D7
P 7150 1800
F 0 "R2" V 7050 1800 50  0000 C CNN
F 1 "220" V 7150 1800 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7080 1800 50  0001 C CNN
F 3 "~" H 7150 1800 50  0001 C CNN
	1    7150 1800
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 609CF6A7
P 7150 2100
F 0 "R3" V 7050 2100 50  0000 C CNN
F 1 "220" V 7150 2100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 7080 2100 50  0001 C CNN
F 3 "~" H 7150 2100 50  0001 C CNN
	1    7150 2100
	0    1    1    0   
$EndComp
Wire Wire Line
	6850 2100 7000 2100
Wire Wire Line
	6850 1800 7000 1800
Wire Wire Line
	6850 1500 7000 1500
Wire Wire Line
	7300 1800 7550 1800
Wire Wire Line
	7550 1800 7550 2100
$Comp
L power:GND #PWR0101
U 1 1 609D764B
P 7550 2300
F 0 "#PWR0101" H 7550 2050 50  0001 C CNN
F 1 "GND" H 7555 2127 50  0000 C CNN
F 2 "" H 7550 2300 50  0001 C CNN
F 3 "" H 7550 2300 50  0001 C CNN
	1    7550 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 2100 7550 2100
Connection ~ 7550 2100
Wire Wire Line
	7550 2100 7550 2300
Wire Wire Line
	7300 1500 7550 1500
Wire Wire Line
	7550 1500 7550 1800
Connection ~ 7550 1800
Wire Wire Line
	4100 4300 3700 4300
Wire Wire Line
	1350 2450 1350 2900
Wire Wire Line
	6200 1500 6550 1500
Wire Wire Line
	6200 2100 6550 2100
$Comp
L power:+5V #PWR0102
U 1 1 60A37566
P 3650 6400
F 0 "#PWR0102" H 3650 6250 50  0001 C CNN
F 1 "+5V" H 3665 6573 50  0000 C CNN
F 2 "" H 3650 6400 50  0001 C CNN
F 3 "" H 3650 6400 50  0001 C CNN
	1    3650 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 6400 3650 6550
Wire Wire Line
	3650 6550 4050 6550
Wire Wire Line
	4050 6650 3650 6650
Wire Wire Line
	4050 6750 3650 6750
Wire Wire Line
	2050 4400 2500 4400
Wire Wire Line
	4050 6950 3650 6950
Wire Wire Line
	2050 4500 2500 4500
Wire Wire Line
	4050 6850 3650 6850
Wire Wire Line
	2050 4600 2500 4600
Wire Wire Line
	1650 2900 1650 1950
$Comp
L power:+9V #PWR0106
U 1 1 60A5897C
P 1650 1950
F 0 "#PWR0106" H 1650 1800 50  0001 C CNN
F 1 "+9V" H 1665 2123 50  0000 C CNN
F 2 "" H 1650 1950 50  0001 C CNN
F 3 "" H 1650 1950 50  0001 C CNN
	1    1650 1950
	1    0    0    -1  
$EndComp
$Comp
L power:+9V #PWR0107
U 1 1 60A63FF1
P 10150 1850
F 0 "#PWR0107" H 10150 1700 50  0001 C CNN
F 1 "+9V" H 10165 2023 50  0000 C CNN
F 2 "" H 10150 1850 50  0001 C CNN
F 3 "" H 10150 1850 50  0001 C CNN
	1    10150 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 1850 9550 1850
Wire Wire Line
	9550 1850 9550 2250
Wire Wire Line
	9550 1850 8850 1850
Wire Wire Line
	8850 1850 8850 2250
Connection ~ 9550 1850
Wire Wire Line
	9350 2550 9350 2800
Wire Wire Line
	8650 2550 8650 2800
Wire Wire Line
	2050 4100 2500 4100
Text Label 2500 4100 2    50   ~ 0
IGNITION
Text Label 2500 4200 2    50   ~ 0
PIRO_1
Wire Wire Line
	2050 4200 2500 4200
Text Label 8650 2800 0    50   ~ 0
IGNITION
Text Label 9350 2800 0    50   ~ 0
PIRO_1
Wire Wire Line
	9150 2250 9150 1700
Wire Wire Line
	8450 2250 8450 1700
$Comp
L Device:SPARK_GAP E2
U 1 1 60A93398
P 9150 1500
F 0 "E2" V 9112 1553 50  0000 L CNN
F 1 "Piro1_SPARK_GAP" V 9195 1553 39  0000 L CNN
F 2 "Alfa-Controler:Spark_cable" H 9150 1430 50  0001 C CNN
F 3 "~" V 9150 1500 50  0001 C CNN
	1    9150 1500
	0    1    1    0   
$EndComp
$Comp
L Device:SPARK_GAP E1
U 1 1 60A941CC
P 8450 1500
F 0 "E1" V 8412 1553 50  0000 L CNN
F 1 "Ignition_SPARK_GAP" V 8495 1553 39  0000 L CNN
F 2 "Alfa-Controler:Spark_cable" H 8450 1430 50  0001 C CNN
F 3 "~" V 8450 1500 50  0001 C CNN
	1    8450 1500
	0    1    1    0   
$EndComp
Wire Wire Line
	8450 1300 8450 1100
Wire Wire Line
	8450 1100 9150 1100
Wire Wire Line
	9150 1100 9150 1300
Wire Wire Line
	9150 1100 9600 1100
Connection ~ 9150 1100
$Comp
L power:GND #PWR01
U 1 1 60A9AE6F
P 9600 1100
F 0 "#PWR01" H 9600 850 50  0001 C CNN
F 1 "GND" H 9605 927 50  0000 C CNN
F 2 "" H 9600 1100 50  0001 C CNN
F 3 "" H 9600 1100 50  0001 C CNN
	1    9600 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 4300 2500 4300
$Comp
L power:GND #PWR07
U 1 1 609D62E1
P 3700 1300
F 0 "#PWR07" H 3700 1050 50  0001 C CNN
F 1 "GND" H 3705 1127 50  0000 C CNN
F 2 "" H 3700 1300 50  0001 C CNN
F 3 "" H 3700 1300 50  0001 C CNN
	1    3700 1300
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR08
U 1 1 609DCCB0
P 4800 2100
F 0 "#PWR08" H 4800 1950 50  0001 C CNN
F 1 "+5V" H 4815 2273 50  0000 C CNN
F 2 "" H 4800 2100 50  0001 C CNN
F 3 "" H 4800 2100 50  0001 C CNN
	1    4800 2100
	-1   0    0    1   
$EndComp
Wire Wire Line
	4800 2100 4800 1900
$Comp
L power:+5V #PWR09
U 1 1 609EB5D2
P 1350 2450
F 0 "#PWR09" H 1350 2300 50  0001 C CNN
F 1 "+5V" H 1365 2623 50  0000 C CNN
F 2 "" H 1350 2450 50  0001 C CNN
F 3 "" H 1350 2450 50  0001 C CNN
	1    1350 2450
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:2N3904 Q1
U 1 1 60A5DDDB
P 8650 2350
F 0 "Q1" V 8978 2350 50  0000 C CNN
F 1 "2N3904" V 8887 2350 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 8850 2275 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/2N3903-D.PDF" H 8650 2350 50  0001 L CNN
	1    8650 2350
	0    -1   -1   0   
$EndComp
$Comp
L Transistor_BJT:2N3904 Q2
U 1 1 60A5FC15
P 9350 2350
F 0 "Q2" V 9678 2350 50  0000 C CNN
F 1 "2N3904" V 9587 2350 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 9550 2275 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/2N3903-D.PDF" H 9350 2350 50  0001 L CNN
	1    9350 2350
	0    -1   -1   0   
$EndComp
$Comp
L My_LIB:BME280_BB U1
U 1 1 60A8FC08
P 9900 5650
F 0 "U1" H 9950 5700 50  0000 L CNN
F 1 "BME280_BB" H 9800 5600 50  0000 L CNN
F 2 "Alfa-Controler:BMP280" H 9850 5650 50  0001 C CNN
F 3 "" H 9850 5650 50  0001 C CNN
	1    9900 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 1800 6200 1800
Text Label 6200 1500 0    50   ~ 0
BLUE_LED
Text Label 6200 1800 0    50   ~ 0
GREEN_LED
Text Label 6200 2100 0    50   ~ 0
RED_LED
Wire Wire Line
	2050 3600 2500 3600
Wire Wire Line
	2050 3800 2500 3800
Wire Wire Line
	2500 3700 2050 3700
Text Label 2500 3600 2    50   ~ 0
BLUE_LED
Text Label 2500 3700 2    50   ~ 0
GREEN_LED
Text Label 2500 3800 2    50   ~ 0
RED_LED
Wire Wire Line
	2050 3900 2500 3900
Text Label 2500 3900 2    50   ~ 0
Servo_Y
Text Label 6400 4550 2    50   ~ 0
Servo_X
Text Label 7400 4550 2    50   ~ 0
Servo_Y
Wire Wire Line
	6400 5100 6150 5100
Wire Wire Line
	6150 5100 6150 5250
Connection ~ 6400 5100
$Comp
L power:+5V #PWR?
U 1 1 60ABA16B
P 6150 5250
F 0 "#PWR?" H 6150 5100 50  0001 C CNN
F 1 "+5V" H 6165 5423 50  0000 C CNN
F 2 "" H 6150 5250 50  0001 C CNN
F 3 "" H 6150 5250 50  0001 C CNN
	1    6150 5250
	-1   0    0    1   
$EndComp
Connection ~ 6700 4850
Connection ~ 7700 4800
Wire Wire Line
	6700 4850 6950 4850
Wire Wire Line
	7700 4800 7850 4800
Wire Wire Line
	6950 4850 6950 5300
Wire Wire Line
	6950 5300 7850 5300
Connection ~ 7850 5300
Wire Wire Line
	7850 5300 7850 4800
Text Label 3650 6650 0    50   ~ 0
CS
Text Label 2500 4300 2    50   ~ 0
CS
Text Label 3650 6750 0    50   ~ 0
MOSI
Text Label 2500 4400 2    50   ~ 0
MOSI
Text Label 3650 6950 0    50   ~ 0
MISO
Text Label 2500 4500 2    50   ~ 0
MISO
Text Label 2500 4600 2    50   ~ 0
SCK
Text Label 3650 6850 0    50   ~ 0
SCK
Wire Notes Line
	8200 6550 8300 6550
Wire Notes Line
	8200 4900 11250 4900
Wire Notes Line
	5150 450  5550 450 
Wire Notes Line
	8200 450  8200 6550
Wire Notes Line
	5700 450  5700 5700
Wire Wire Line
	2050 3300 2500 3300
Text Label 3650 1900 0    50   ~ 0
BTN
Text Label 2500 3300 2    50   ~ 0
BTN
Text Label 3700 4300 0    50   ~ 0
SDA_A4
Text Label 3700 4400 0    50   ~ 0
SDA_A5
Wire Wire Line
	1050 4300 650  4300
Wire Wire Line
	1050 4400 650  4400
Text Label 650  4300 0    50   ~ 0
SDA_A4
Text Label 650  4400 0    50   ~ 0
SDA_A5
Wire Notes Line
	2850 2900 8200 2900
Wire Notes Line
	2950 5700 8250 5700
Wire Notes Line
	2850 400  2850 7800
$Comp
L Device:R R4
U 1 1 609D470C
P 3950 1600
F 0 "R4" V 3850 1600 50  0000 C CNN
F 1 "10k" V 3950 1600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 3880 1600 50  0001 C CNN
F 3 "~" H 3950 1600 50  0001 C CNN
	1    3950 1600
	0    1    1    0   
$EndComp
Wire Wire Line
	3650 1900 4250 1900
Wire Wire Line
	4100 1600 4250 1600
Wire Wire Line
	4250 1600 4250 1900
Connection ~ 4250 1900
Wire Wire Line
	3700 1300 3700 1600
Wire Wire Line
	3700 1600 3800 1600
Text Notes 7400 7500 0    50   ~ 0
Alfa Constroler
Wire Wire Line
	4250 1900 4400 1900
$Comp
L Switch:SW_Push SW1
U 1 1 60A5BDC8
P 4600 1900
F 0 "SW1" H 4600 2185 50  0000 C CNN
F 1 "SW_Push" H 4600 2094 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H4.3mm" H 4600 2100 50  0001 C CNN
F 3 "~" H 4600 2100 50  0001 C CNN
	1    4600 1900
	1    0    0    -1  
$EndComp
$EndSCHEMATC
