int SWITCH_SOCKET = 2;
int count = 0;

void setup() {
  pinMode(SWITCH_SOCKET, INPUT);
  Serial.begin(9600);
}

void loop() {
  if (digitalRead(SWITCH_SOCKET) == 1) {
    count = count + 1;
    Serial.print("Count : ");
    Serial.println(count);
    while(digitalRead(SWITCH_SOCKET) == 1) {
      delay(100);
    }
  }
}
