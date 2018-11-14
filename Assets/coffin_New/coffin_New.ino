
#include "Keyboard.h"
 bool closed = false;
void setup() {
  // make pin 2 an input and turn on the 
  // pullup resistor so it goes high unless
  // connected to ground:
  pinMode(2, INPUT_PULLUP);
  Keyboard.begin();
}

void loop() {
  //if the button is pressed
  if(digitalRead(2)==LOW && closed ==false){
    //Send the message
    Keyboard.println("t"); 
    closed = true;   
  }
  else if(digitalRead(2)==HIGH && closed ==true){
    Keyboard.println("ns");
    closed = false;   
  }
  delay(1000);
}
