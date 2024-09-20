#!/bin/bash

SERIAL_PORT="/dev/ttyUSB0"

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

# Enviar el comando al puerto serial
echo -n "$1" > "$SERIAL_PORT"

echo "Comando enviado: $1"

exit 0