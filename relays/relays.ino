const int relayPins[] = {2, 3, 4, 5};  // Pines conectados a los relés
bool relayStates[] = {false, false, false, false};  // Estado de los relés
String commandBuffer = "";  // Buffer para almacenar los comandos

void setup() {
  Serial.begin(9600);  // Iniciar la comunicación serial
  for (int i = 0; i < 4; i++) {
    pinMode(relayPins[i], OUTPUT);  // Configurar los pines de los relés como salida
    digitalWrite(relayPins[i], HIGH);  // Inicializar los relés apagados (cambio a HIGH)
  }
}

void loop() {
  while (Serial.available() > 0) {
    char incomingChar = Serial.read();  // Leer un carácter del puerto serie
    if (isDigit(incomingChar)) {
      commandBuffer += incomingChar;  // Añadir el carácter al buffer si es un dígito
    }

    // Procesar el comando si el buffer tiene 4 caracteres
    if (commandBuffer.length() == 4) {
      processCommand(commandBuffer);
      commandBuffer = "";  // Limpiar el buffer para el siguiente comando
    }
  }
}

void processCommand(String command) {
  int pinIndex = command.charAt(0) - '2';  // Convertir el primer dígito al índice del pin (0-3)
  int duration = command.substring(1, 3).toInt();  // Convertir los siguientes dos dígitos al tiempo
  int mode = command.charAt(3) - '0';  // Convertir el último dígito al modo (0 o 1)

  if (pinIndex < 0 || pinIndex > 3) {
    Serial.println("Pin inválido");
    return;
  }

  if (relayStates[pinIndex]) {
    // Si el relé ya está encendido, apagarlo antes de ejecutar el nuevo comando
    digitalWrite(relayPins[pinIndex], HIGH);  // Cambiar a HIGH para apagar
    relayStates[pinIndex] = false;
    delay(100);  // Pequeña pausa antes de ejecutar el nuevo comando
  }

  if (mode == 1) {
    digitalWrite(relayPins[pinIndex], LOW);  // Encender el relé indefinidamente (cambio a LOW)
    relayStates[pinIndex] = true;
    Serial.print("Pin ");
    Serial.print(relayPins[pinIndex]);
    Serial.println(" encendido indefinidamente.");
  } else if (mode == 0) {
    digitalWrite(relayPins[pinIndex], LOW);  // Encender el relé (cambio a LOW)
    relayStates[pinIndex] = true;
    Serial.print("Pin ");
    Serial.print(relayPins[pinIndex]);
    Serial.print(" encendido por ");
    Serial.print(duration);
    Serial.println(" segundos.");
    delay(duration * 1000);  // Mantener el relé encendido por el tiempo especificado
    digitalWrite(relayPins[pinIndex], HIGH);  // Apagar el relé (cambio a HIGH)
    relayStates[pinIndex] = false;
    Serial.print("Pin ");
    Serial.print(relayPins[pinIndex]);
    Serial.println(" apagado.");
  }
}