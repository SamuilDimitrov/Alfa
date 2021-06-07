#include <Servo.h>
#include <Wire.h>
#include <SPI.h>
#include <SD.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BME280.h>
#include <MPU6050_tockn.h>

//to do
#define servo_gear_ratio 5
#define servoX_offset 95
#define servoY_offset 90
#define test_offset 40

#define X_Servo_pin 6
#define Y_Servo_pin 7
#define ledblu 3
#define ledgrn 4
#define ledred 5
#define mosfet 8
#define pyro1 9
#define BTN1 0
#define BTN_PRESSED LOW

#define desired_angleX 0
#define desired_angleY 0

double deviationX, deviationY, previos_deviationX, previos_deviationY;
float elapsedTime, currentTime, previousTime;
float Orientation_X, Orientation_Y, Orientation_Z;
float air_pressure, altitude, ground_level_air_pressure, max_altitude;
double PID_X, PID_Y, servoX_angle, servoY_angle;

int state = 0;
//0 - initialising
//1 - testing
//2 - launch
//3 - powerd flight
//4 - parachute
//5 - landed
//-1 - aborted


//"P" Constants
float pidX_p = 0;
float pidY_p = 0;

//"I" Constants
float pidY_i = 0;
float pidX_i = 0;

//"D" Constants
float pidX_d = 0;
float pidY_d = 0;

//to do
//PID Gains
double kp = 0.2;
double ki = 0.03;
double kd = 0.02;

Servo servoX;
Servo servoY;
Adafruit_BME280 bme;
MPU6050 mpu6050(Wire);
File myFile;

void setup() {
  
  pinMode(mosfet, OUTPUT);
  pinMode(ledblu, OUTPUT);
  pinMode(ledgrn, OUTPUT);
  pinMode(ledred, OUTPUT);
  pinMode(pyro1, OUTPUT);
  pinMode(BTN1, INPUT);
  
  Serial.begin(9600);
  Wire.begin();
  mpu6050.begin();
  mpu6050.calcGyroOffsets(true);
  
  digitalWrite(ledred, HIGH);
  
  servoX.attach(X_Servo_pin);
  servoY.attach(Y_Servo_pin);
  servoX_angle = servoX_offset;
  servoY_angle = servoY_offset;
  servoX.write(servoX_angle);
  servoY.write(servoY_angle);
  
  digitalWrite(ledgrn, HIGH);
  
  Serial.println("BMP280 test");
  if (!bme.begin(0x76)) {
    Serial.println("Could not find a valid BME280 sensor, check wiring!");servoX_angle = servoX_offset;
    while (1){
      digitalWrite(ledred, HIGH);
      digitalWrite(ledgrn, HIGH);
      digitalWrite(ledblu, HIGH);
    }
  }
  digitalWrite(ledgrn, HIGH);
  delay(1000);
  digitalWrite(ledgrn, LOW);
  digitalWrite(ledblu, LOW);
  delay(1000);
  if (!SD.begin(10)) {
    while (1){
      digitalWrite(ledred, HIGH);
      digitalWrite(ledgrn, HIGH);
      digitalWrite(ledblu, HIGH);
    }
  }
  ground_level_air_pressure = determine_ground_airpresure();
  delay(1000);
  digitalWrite(ledred, LOW);
  digitalWrite(ledgrn, LOW);
  digitalWrite(ledblu, LOW);
  //tvc_test();
  launchpoll();
}

void loop() {
  if(state == 0){
    launchpoll(); 
  }
  else if(state == -1){
    exit(0);
  }
  else if(state == 1){
    detect_liftoff (); 
  }
  else if(state == 3){
    compute_TVC_corection();
    if(elapsedTime >= 200){
      check_alt();
    }
  }
  else if(state == 4){
    check_landed();
  }
  compute_TVC_corection();
  previousTime = currentTime;
  currentTime = millis();
  elapsedTime = (currentTime - previousTime) / 1000;
//  Serial.print("PID_X = ");
//  Serial.print(PID_X);
//  Serial.print(" | PID_Y = ");
//  Serial.print(PID_Y);
//  Serial.print(" | servoX_angle = ");
//  Serial.print(servoX_angle);
//  Serial.print(" | servoY_angle = ");
//  Serial.println(servoY_angle);
  SD_Write();
  
}

void SD_Write(){
  myFile = SD.open("data.txt", FILE_WRITE);

  if (myFile) {
    Serial.print("Writing to test.txt...");
    myFile.print("Timestamp:"); myFile.print(millis());
    myFile.print(" DivX:"); myFile.print(deviationX);
    myFile.print(" DivY:"); myFile.print(deviationY);
    myFile.print(" Orientation_X:"); myFile.print(Orientation_X);
    myFile.print(" Orientation_:Y "); myFile.print(Orientation_Y);
    myFile.println(" Alt: "); myFile.print(altitude);
    myFile.print(" MaxAlt:"); myFile.print(max_altitude);
    myFile.print(" pressure:"); myFile.print(air_pressure);
    myFile.print(" servoX:"); myFile.print(servoX_angle);
    myFile.print(" servoY:"); myFile.print(servoY_angle);
    myFile.close();
    Serial.println("done.");
  }
}

float determine_ground_airpresure(){
  float avg = 0;
  for(int i = 0;i < 200; i++){
    avg += (bme.readPressure() / 100.0F);
  }
  return avg/200;
}

void get_Altitude() {
  mpu6050.update();
  altitude = bme.readAltitude(ground_level_air_pressure);
  air_pressure = bme.readPressure();
  Serial.print("Pressure = ");
  Serial.print(air_pressure);
  Serial.println(" Pa");

  Serial.print("Approx altitude = ");
  Serial.print(altitude);
  Serial.println(" m");
}

void get_orietation() {
  mpu6050.update();
  Orientation_X = mpu6050.getAngleX();
  Orientation_Y = mpu6050.getAngleY();
  Orientation_Z = mpu6050.getAngleZ();
  
}

void compute_TVC_corection() {
  get_orietation();
  previos_deviationX = deviationX;
  previos_deviationY = deviationY;
  deviationX = Orientation_X - desired_angleX;
  deviationY = Orientation_Y - desired_angleY;

  //calculate P
  pidX_p = deviationX * kp;
  pidY_p = deviationY * kp;

  //calculate D
  pidX_d = ((deviationX - previos_deviationX) / elapsedTime) * kd;
  pidY_d = ((deviationY - previos_deviationY) / elapsedTime) * kd;

  //calculae I
  pidX_i = (pidX_i + deviationX * elapsedTime) * ki;
  pidY_i = (pidY_i + deviationY * elapsedTime) * ki;

  PID_X = pidX_p + pidX_d + pidX_i;
  PID_Y = pidY_p + pidY_d + pidY_i;

  servoX_angle = (-1 * (PID_X * servo_gear_ratio) + servoX_offset);
  servoY_angle = ((PID_Y * servo_gear_ratio) + servoY_offset);

  servowrite();
}

void servowrite() {
  mpu6050.begin();
  servoX.write(servoX_angle);
  servoY.write(servoY_angle);
}

void tvc_test(){
  servoX.write(servoX_angle + test_offset);
  delay(200);
  servoX.write(servoX_angle - test_offset);
  delay(200);
  servoX.write(servoX_angle);
  delay(100);
  servoY.write(servoY_angle + test_offset);
  delay(200);
  servoY.write(servoY_angle - test_offset);
  delay(200);
  servoY.write(servoY_angle);
  delay(200);
  
  servoX.write(servoX_angle + test_offset);
  delay(100);
  servoY.write(servoY_angle + test_offset);
  delay(100);
  servoX.write(servoX_angle);
  delay(100);
  servoX.write(servoX_angle - test_offset);
  delay(100);
  servoY.write(servoY_angle);
  delay(100);
  servoY.write(servoY_angle - test_offset);
  delay(100);
  servoX.write(servoX_angle);
  delay(100);
  servoX.write(servoX_angle + test_offset);
  delay(100);
  servoY.write(servoY_angle);
  delay(100);
  servoX.write(servoX_angle);
  delay(1000);
}

void detect_liftoff(){
  if(state == 1 && mpu6050.getAccZ() > 1){
    digitalWrite(mosfet, LOW);
    state = 2;
  }
}

void abortstart()
{
  get_orietation();
  if (Orientation_X > 10 || Orientation_Y > 10)
  {
    state = -1;
    digitalWrite(ledgrn, LOW);
    digitalWrite(ledblu, LOW);
    digitalWrite(ledred, LOW);
    digitalWrite(ledred, HIGH);
  }
}

void check_alt(){
  get_Altitude();
  if(altitude > max_altitude){
    max_altitude = altitude;
  }
  else if((max_altitude - 2) >= altitude){
    digitalWrite(pyro1,HIGH);
    digitalWrite(ledgrn, LOW);
    digitalWrite(ledblu, LOW);
    digitalWrite(ledblu, HIGH);
    state = 4;
  }
}

void launchpoll()
{
    state = 1;
    tvc_test();
    delay(750);
    Serial.println("Alfa is Armed");
    mpu6050.calcGyroOffsets(true);
    delay(500);
    Serial.println("Gyros has been calibrated, we are ready for launch");
    digitalWrite(ledgrn, HIGH);
    digitalWrite(ledred, LOW);
    
    int buttonState = 0;
    while(1){
      Serial.println("Waithin for button");
      buttonState = digitalRead(BTN1);
      if (buttonState == HIGH) {
        break;
      }
    }
    delay(10000);
    digitalWrite(ledgrn, HIGH);
    digitalWrite(ledred, HIGH);

    ignition();
}
void ignition() {
  Serial.println("Ignition");
  digitalWrite(mosfet, HIGH);
  Serial.println("mosfetHIGH");
  delay(3000);

}

void check_landed(){
  if (state == 4 && mpu6050.getAccZ() < -1)
    {
        state = 5;
    }
}
