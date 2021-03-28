
long last;
double speed;
double distance;

#include <SoftwareSerial.h>

SoftwareSerial bl(7, 8); // RX, TX

bool currentlySending = false;

void setup() {
  // put your setup code here, to run once:
bl.begin(9600);
Serial.begin(9600);
attachInterrupt(0,magnetDetect,RISING);
last = millis();
speed = 0;
}

void loop() {
  // put your main code here, to run repeatedly:
  if(millis() - last >= 3000 && speed != 0) {
    speed = 0;
    if(millis() - last >= 3000) {
      if(currentlySending) {
        String toSend = String(speed) + "S" + String(distance);
        bl.println(toSend);
      }
      Serial.println(speed);
    }
  }
  if(bl.available()) {
    char c = bl.read();
    if(c == 'F') {
      currentlySending = false;
    }
    else if(c == 'G') {
      currentlySending = true;

    }
  }

}
void magnetDetect(){
  speed = millis() - last;
  last = millis();
  speed = speed / 1000;
  speed = 26/speed;
  speed = speed * 0.09144;
  distance += 0.6604;
  if(speed != 0) {
    if(currentlySending) {
        String toSend = String(speed) + "S" + String(distance);
        bl.println(toSend);
    }
    Serial.println(speed);
  }
}
