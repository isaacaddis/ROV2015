// This code is proprietary information of
// Obsidian ROV inc.
// Written by Coleman Christy
#include <Servo.h>
Servo claw;

float bouy = 0;
bool sent = false;
char recived;
const byte controlPin1 = 2;
const byte controlPin2 = 3;
const byte updownpin = 9;//pwm
const byte leftrightpin = 6;//pwm
const byte forwardpin = 5;//pwm
const byte lightpin = 8;//digital
const byte acc1pin = 10;//pwm
const byte acc2pin = 12;//digital
//send a/d for left/right, w/s for up/down
//f/b for forward/back, 1/2 for accesories, o/p to toggle lights
//3 to stop accesories
void setup() {
  claw.attach(acc1pin);
  Serial.begin(4800);
  pinMode(updownpin, OUTPUT);
  pinMode(leftrightpin, OUTPUT);
  pinMode(forwardpin, OUTPUT);
  pinMode(lightpin, OUTPUT);
  //pinMode(acc1pin, OUTPUT);
  pinMode(acc2pin, OUTPUT);
  pinMode(controlPin1, OUTPUT);
  pinMode(controlPin2, OUTPUT);
  analogWrite(forwardpin, 127);
  analogWrite(updownpin, 127);
  analogWrite(leftrightpin, 127);
  claw.write(120);
}
void loop() {
  if (Serial.available()) {
    recived = Serial.read();
    switch (recived) {
      case 'a' :
        digitalWrite(leftrightpin, HIGH);
        break;
      case 'd' :
        digitalWrite(leftrightpin, LOW);
        break;
      case 'w' :
        digitalWrite(updownpin, HIGH);
        digitalWrite(controlPin1, LOW);
        digitalWrite(controlPin2, HIGH);
        break;
      case 's':
        digitalWrite(updownpin, HIGH);
        digitalWrite(controlPin1, HIGH);
        digitalWrite(controlPin2, LOW);
        break;
      case '1':
        claw.write(180);
        //digitalWrite(acc1pin, HIGH);
        break;
      case '2':
        digitalWrite(acc2pin, HIGH);
        break;
      case '3':
        digitalWrite(acc1pin, LOW);
        digitalWrite(acc2pin, LOW);
        break;
      case 'f':
        digitalWrite(forwardpin, HIGH);
        break;
      case 'b':
        digitalWrite(forwardpin, LOW);
        break;
      case 'o':
        digitalWrite(lightpin, HIGH);
        break;
      case 'p':
        digitalWrite(lightpin, LOW);
        break;
      case '+':
        bouy += 0.1;
        if (abs(bouy) > 1) {
          analogWrite(updownpin, abs(int(bouy * 0.8 * bouy)) + 50);
        }
        else {
          digitalWrite(updownpin, LOW);
        }
        break;
      case '-':
        bouy -= 0.1;
        if (abs(bouy) > 1) {
          analogWrite(updownpin, abs(int(bouy * 0.8 * bouy)) + 50);
        }
        else {
          digitalWrite(updownpin, LOW);
        }
        break;
      case 'v':
        claw.write(180);
        analogWrite(forwardpin, 127);
        analogWrite(leftrightpin, 127);

        if (bouy >= 0) {
          digitalWrite(controlPin1, LOW);
          digitalWrite(controlPin2, HIGH);
        }
        else {
          digitalWrite(controlPin1, HIGH);
          digitalWrite(controlPin2, LOW);
        }
        if (abs(bouy) > 1) {
          analogWrite(updownpin, abs(int(bouy * 0.8 * bouy)) + 50);
        }
        else {
          digitalWrite(updownpin, LOW);
        } break;
    }
    if (sent == false && analogRead(0) > 20) {
      Serial.println(9);
      sent = true;
    }
  }
}
