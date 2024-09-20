#!/bin/bash

# Función para enviar comando al Arduino
send_command() {
    local command=$1
    
    # Verificar si se proporcionaron exactamente 4 dígitos
    if [[ ! $command =~ ^[0-9]{4}$ ]]; then
        echo "Error: El comando debe tener exactamente 4 dígitos."
        return 1
    fi
    
    # Configurar el puerto serie
    stty -F /dev/ttyUSB0 9600 cs8 -cstopb -parenb raw -echo
    
    # Enviar el comando al puerto serial
    echo -n "$command" > /dev/ttyUSB0
    
    # Esperar un momento para que el comando se procese
    sleep 0.1
    
    # Leer la respuesta del Arduino (si la hay)
    read -t 1 response < /dev/ttyUSB0
    if [ ! -z "$response" ]; then
        echo "Respuesta del Arduino: $response"
    fi
}

# Bucle principal
while true; do
    echo "Ingrese un comando de 4 dígitos (o 'q' para salir):"
    read input
    
    if [ "$input" = "q" ]; then
        echo "Saliendo del programa."
        break
    fi
    
    send_command "$input"
done