#!/bin/bash

SERIAL_PORT="/dev/ttyUSB0"
BAUD_RATE=9600

# Verificar si se proporcionó exactamente un argumento
if [ $# -ne 1 ] || [[ ! $1 =~ ^[0-9]{4}$ ]]; then
    echo "Error: Debe proporcionar exactamente 4 dígitos como argumento."
    echo "Uso: $0 <cuatro_dígitos>"
    exit 1
fi

# Verificar si el puerto serie existe
if [ ! -e "$SERIAL_PORT" ]; then
    echo "Error: El puerto serie $SERIAL_PORT no existe."
    exit 1
fi

# Configurar el puerto serie
stty -F "$SERIAL_PORT" $BAUD_RATE cs8 -cstopb -parenb -echo || {
    echo "Error: No se pudo configurar el puerto serie. Asegúrate de que Arduino está conectado."
    exit 1
}

# Enviar el comando al puerto serial
echo -n "$1" > "$SERIAL_PORT"

echo "Comando enviado: $1"

# Esperar un momento para que el comando se procese
sleep 0.5

# Leer la respuesta del Arduino (si la hay)
timeout 2 cat "$SERIAL_PORT" | while IFS= read -r line
do
    echo "Respuesta del Arduino: $line"
done

exit 0