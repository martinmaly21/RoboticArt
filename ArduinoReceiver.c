//16 bits will be sent because there are 16 keys
//E.g. "1000000000000001" would play the first and last key
//E.g. "0000000110000000" would play the two middle keys
const byte numChars = 16;

//constants for the shift register
int clearPin = 5; //Arduino pin 5 connected to Pin 10, SRCLR(Clear/Reset) of 74HC595
int serialData = 6;  //Arduino pin 6 connected to Pin 14, SER(serial input) of 74HC595
int shiftClock = 7;  //Arduino pin 7 connected to Pin 11, SRCLK(shift clock) of 74HC595
int latchClock = 8;  //Arduino pin 8 connected to Pin 12, RCLK(storage/latch clock) of 74HC595 ]

//this array of characters is used to save the string
//that is received from the SwiftUI app
char receivedChars[numChars];

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
   digitalWrite(latchClock, LOW);    
   shiftOut(serialData, shiftClock, MSBFIRST, 0b10101011);      // shift out the bits
   shiftOut(serialData, shiftClock, MSBFIRST, 0b10101011);
   digitalWrite(latchClock, HIGH);     //take the latch pin high so the LEDs will light up
   delay(500);     // pause before next value
   digitalWrite(latchClock, LOW);    
   shiftOut(serialData, shiftClock, MSBFIRST, 0b00000000);      // shift out the bits
   shiftOut(serialData, shiftClock, MSBFIRST, 0b00000000);
   digitalWrite(latchClock, HIGH);     //take the latch pin high so the LEDs will light up
   delay(500);     // pause before next value

  
//    receiveValueFromApp();
//    playPianoKeys();
}

void receiveValueFromApp() {
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
}

void playPianoKeys() {
    if (newData == true) {
        //convert array of characters into integer
        int receivedIntegerValue = atoi(receivedChars);
        
        digitalWrite(latchClock, LOW);  
        shiftOut(serialData, shiftClock, MSBFIRST, receivedIntegerValue);
        digitalWrite(latchClock, HIGH);
        
        newData = false;
    }
}
