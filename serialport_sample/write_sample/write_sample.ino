int LED_SOCKET = 13;
char ch = '0';

void setup() {
  Serial.begin(9600);
  pinMode(LED_SOCKET, OUTPUT);
}

void loop() {
  if(Serial.available() > 0){
    ch = Serial.read();
    if (ch == '1') {
        digitalWrite(LED_SOCKET, HIGH);
    } else if (ch == '0') {
        digitalWrite(LED_SOCKET, LOW);
    }
  }
}
