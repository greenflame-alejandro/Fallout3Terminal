#!/bin/bash

SERIAL_PORT="/dev/ttyUSB0"

# Verificar si se está ejecutando como root
if [ "$EUID" -ne 0 ]; then
    echo "Este script debe ejecutarse como root (usando sudo)."
    exit 1
fi

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

# Asegurar que tenemos permisos de escritura en el puerto
chmod 666 "$SERIAL_PORT"

# Enviar el comando al puerto serial
echo -n "$1" > "$SERIAL_PORT"

echo "Comando enviado: $1"

# Esperar un momento para que el comando se procese
sleep 0.5

# Intentar leer la respuesta del Arduino
timeout 2 cat "$SERIAL_PORT" | while IFS= read -r line
do
    echo "Respuesta del Arduino: $line"
done

exit 0