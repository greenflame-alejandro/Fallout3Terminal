const int relayPins[] = {2, 3, 4, 5};  // Pines conectados a los relés
bool relayStates[] = {false, false, false, false};  // Estado de los relés
String commandBuffer = "";  // Buffer para almacenar los comandos
unsigned long relayTimers[4] = {0, 0, 0, 0};  // Temporizadores para cada relé

void setup() {
  Serial.begin(9600);  // Iniciar la comunicación serial
  for (int i = 0; i < 4; i++) {
    pinMode(relayPins[i], OUTPUT);  // Configurar los pines de los relés como salida
    digitalWrite(relayPins[i], HIGH);  // Inicializar los relés apagados (cambio a HIGH)
  }
}

void loop() {
  // Verificar y procesar comandos entrantes
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

  // Verificar y apagar relés si su tiempo ha expirado
  for (int i = 0; i < 4; i++) {
    if (relayStates[i] && relayTimers[i] > 0 && millis() >= relayTimers[i]) {
      digitalWrite(relayPins[i], HIGH);  // Apagar el relé
      relayStates[i] = false;
      relayTimers[i] = 0;
      Serial.print("Pin ");
      Serial.print(relayPins[i]);
      Serial.println(" apagado automáticamente.");
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

  // Apagar el relé antes de ejecutar el nuevo comando
  digitalWrite(relayPins[pinIndex], HIGH);
  relayStates[pinIndex] = false;
  relayTimers[pinIndex] = 0;
  delay(100);  // Pequeña pausa antes de ejecutar el nuevo comando

  if (mode == 1) {
    digitalWrite(relayPins[pinIndex], LOW);  // Encender el relé indefinidamente
    relayStates[pinIndex] = true;
    Serial.print("Pin ");
    Serial.print(relayPins[pinIndex]);
    Serial.println(" encendido indefinidamente.");
  } else if (mode == 0) {
    digitalWrite(relayPins[pinIndex], LOW);  // Encender el relé
    relayStates[pinIndex] = true;
    relayTimers[pinIndex] = millis() + (unsigned long)duration * 1000;  // Establecer el temporizador
    Serial.print("Pin ");
    Serial.print(relayPins[pinIndex]);
    Serial.print(" encendido por ");
    Serial.print(duration);
    Serial.println(" segundos.");
  }
}