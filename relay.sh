#!/bin/bash

# Verificar si se proporcionaron exactamente 4 dígitos
if [[ ! $1 =~ ^[0-9]{4}$ ]]; then
    echo "Error: El comando debe tener exactamente 4 dígitos."
    exit 1
fi

# Ejecutar stty para configurar el puerto
sudo stty -F /dev/ttyUSB0 -hupcl 2>/dev/null

# Enviar el comando al puerto serial
echo -n "$1" | sudo tee /dev/ttyUSB0 > /dev/null 2>&1

# Ignorar errores y continuar
exit 0