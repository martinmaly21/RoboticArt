/* atoi example */
#include <stdio.h> 
#include <stdlib.h>    
#include <string.h>

//#include <iostream>
//#include <string>
//using namespace std;

//17 bits will be sent because there are 16 keys (plus a null character)
//E.g. "1000000000000001" would play the first and last key
//E.g. "0000000110000000" would play the two middle keys
const byte numChars = 17;

//constants for the shift register
int clearPin = 5; //Arduino pin 5 connected to Pin 10, SRCLR(Clear/Reset) of 74HC595
int serialData = 6;  //Arduino pin 6 connected to Pin 14, SER(serial input) of 74HC595
int shiftClock = 7;  //Arduino pin 7 connected to Pin 11, SRCLK(shift clock) of 74HC595
int latchClock = 8;  //Arduino pin 8 connected to Pin 12, RCLK(storage/latch clock) of 74HC595 ]

//this array of characters is used to save the string
//that is received from the SwiftUI app
char hand1Value[(numChars / 2) + 1];
char hand2Value[(numChars / 2) + 1];

//this flag lets us know if there is new data available
boolean newData = false;

void setup() {
    //set up serial monitor
    Serial.begin(9600);
   
    //set pins to output so you can control the shift register
    pinMode(clearPin, OUTPUT);
    pinMode(shiftClock, OUTPUT);
    pinMode(latchClock, OUTPUT);
    pinMode(serialData, OUTPUT);

    digitalWrite(clearPin, LOW); //Pin is active-low, this clears the shift register
    digitalWrite(clearPin, HIGH); //Clear pin is inactive

    digitalWrite(latchClock, LOW);    
    
    // take the latchClock low so 
    // the LEDs don't change while you're sending in bits:
    shiftOut(serialData, shiftClock, MSBFIRST, 0);      // shift out the bits
    shiftOut(serialData, shiftClock, MSBFIRST, 0);
    digitalWrite(latchClock, HIGH);     //take the latch pin high so the LEDs will light up
    delay(500);     // pause before next value
}

void loop() {
    receiveValueFromApp();
    playPianoKeys();
}

void receiveValueFromApp() {
    char receivedChars[numChars];
    static byte index = 0;
    char endMarker = '\n';
    char receivedCharacter;
    
    if (Serial.available() > 0) {
        receivedCharacter = Serial.read();

        if (receivedCharacter != endMarker) {
            receivedChars[index] = receivedCharacter;
            index++;
        } else {
            receivedChars[index] = '\0'; // terminate the string
            index = 0;
            newData = true;
        }
    }

    for (int i = 8; i < 16; i++) {
        hand1Value[i - 8] = receivedChars[i];
    }
    hand1Value[8] = '\0';
    
    //parse into separate hands
    for (int i = 0; i < 8; i++) {
        hand2Value[i] = receivedChars[i];
    }
    hand2Value[8] = '\0';
}

int convertBinaryToInteger(char* s) {
    int value = 0;
    for (int i=0; i< strlen(s); i++)  // for every character in the string  strlen(s) returns the length of a char array
    {
      value *= 2; // double the result so far
      if (s[i] == '1') value++;  //add 1 if needed
    }
    
    return value;
}

void playPianoKeys() {
    if (newData == true) {
        digitalWrite(latchClock, LOW);  
        
        int hand1Int = convertBinaryToInteger(hand2Value);
        shiftOut(serialData, shiftClock, LSBFIRST, hand1Int);

        int hand2Int = convertBinaryToInteger(hand1Value);
        shiftOut(serialData, shiftClock, LSBFIRST, hand2Int);
        
        digitalWrite(latchClock, HIGH);
        
        newData = false;
    }
}
