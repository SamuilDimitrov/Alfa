#include <Servo.h>
#include <Wire.h>
#include <SPI.h>
#include <SD.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BMP280.h>
#include <MPU6050_tockn.h>

Adafruit_BMP280 bme;
MPU6050 mpu6050(Wire);

double deviationX, deviationY, previos_deviationX, previos_deviationY;
float elapsedTime, currentTime, previousTime;
float Orientation_X, Orientation_Y, Orientation_Z;
float air_pressure, altitude, ground_level_air_pressure; 
double PID_X, PID_Y, servoX_angle, servoY_angle;
//deviation
#define desired_angleX 0
#define desired_angleY 0

//"P" Constants
float pidX_p = 0;
float pidY_p = 0;

//"I" Constants
float pidY_i = 0;
float pidX_i = 0;

//"D" Constants
float pidX_d = 0;
float pidY_d = 0;

//PID Gains
double kp = 0.2;
double ki = 0.03;
double kd = 0.02;

//to be determined:
int valueX = 100; //serdoX default position
int valueY = 100; //serdoY default position

Servo servoX;
Servo servoY;

void setup(){
  Serial.begin(9600);
  Wire.begin();
  mpu6050.begin();
  mpu6050.calcGyroOffsets(true);
  
  Serial.println(F("BMP280 test"));
  if (!bme.begin(0x76)) {
    Serial.println("Could not find a valid BME280 sensor, check wiring!");
    while (1);
  }
  ground_level_air_pressure = bme.readPressure();
}

void loop(){
    previousTime = currentTime;
    currentTime = millis();
    elapsedTime = (currentTime - previousTime) / 1000;
    get_orietation();
    
    Serial.print("Orientation_X = ");
    Serial.print(Orientation_X);
    Serial.print(" | Orientation_Y = ");
    Serial.print(Orientation_Y);
    Serial.print(" | Orientation_Z = ");
    Serial.println(Orientation_Z);
    
}

void get_Altitude(){
  altitude = bme.readAltitude(ground_level_air_pressure);
  air_pressure = bme.readPressure();
    Serial.print("Pressure = ");
    Serial.print(air_pressure);
    Serial.println(" Pa");
 
    Serial.print("Approx altitude = ");
    Serial.print(altitude);
    Serial.println(" m");
}
void get_orietation(){
  mpu6050.update();
  Orientation_X = mpu6050.getAngleX();
  Orientation_Y = mpu6050.getAngleY();
  Orientation_Z = mpu6050.getAngleZ();
}

void compute_TVC_corection(){
  get_orietation();
  previos_deviationX = deviationX;
  previos_deviationY = deviationY;
  deviationX = Orientation_X - desired_angleX;
  deviationY = Orientation_Y - desired_angleY;

  //calculate P
  pidX_p = deviationX * kp;
  pidY_p = deviationY * kp;

  //calculate D
  pidX_d = ((deviationX - previos_deviationX)/elapsedTime) * kd;
  pidY_d = ((deviationY - previos_deviationY)/elapsedTime) * kd;

  //calculae I
  pidX_i = (pidX_i + deviationX * elapsedTime) *ki;
  pidY_i = (pidY_i + deviationY * elapsedTime) *ki;

  PID_X = pidX_p + pidX_d + pidX_i;
  PID_Y = pidY_p + pidY_d + pidY_i;
  
  servoX_angle = PID_X + valueX;
  servoY_angle = PID_Y + valueY;

  servowrite();
}

void servowrite(){
  servoX.write(servoX_angle);
  servoY.write(servoY_angle);
}
