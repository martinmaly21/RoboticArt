//16 bits will be sent because there are 16 keys
//E.g. "1000000000000001" would play the first and last key
//E.g. "0000000110000000" would play the two middle keys
const byte numChars = 16;

//constants for the shift register
const int clearPin = 5;
const int latchPin = 8;
const int clockPin = 12;
const int dataPin = 11;

//this array of characters is used to save the string
//that is received from the SwiftUI app
char receivedChars[numChars];

//this flag lets us know if there is new data available
boolean newData = false;

void setup() {
    //set up serial monitor
    Serial.begin(9600);

    //set up pins
    pinMode(clearPin, OUTPUT);
    pinMode(latchPin, OUTPUT);
    pinMode(dataPin, OUTPUT);
    pinMode(clockPin, OUTPUT);
    
    digitalWrite(clearPin, LOW);  
    digitalWrite(clearPin, HIGH);  
    
    //set all to 0
    digitalWrite(latchPin, LOW);  
    shiftOut(dataPin, clockPin, MSBFIRST, 0);
    digitalWrite(latchPin, HIGH);
}

void loop() {
    receiveValueFromApp();
    playPianoKeys();
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
        
        digitalWrite(latchPin, LOW);  
        shiftOut(dataPin, clockPin, MSBFIRST, receivedIntegerValue);
        digitalWrite(latchPin, HIGH);
        
        newData = false;
    }
}
