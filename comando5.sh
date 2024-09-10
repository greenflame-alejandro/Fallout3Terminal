#!/bin/bash

# Función para verificar la conexión a internet
check_internet() {
    wget -q --spider http://google.com

    if [ $? -eq 0 ]; then
        return 0
    else
        return 1
    fi
}

# Verificar la conexión a internet
if check_internet; then
    echo "Conexión a internet detectada. Iniciando entretenimiento especial..."
    sleep 2
    
    # Ejecutar telnet en segundo plano
    ( telnet towel.blinkenlights.nl ) &
    
    # Guardar el PID del proceso telnet
    TELNET_PID=$!
    
    # Esperar a que se presione cualquier tecla
    read -n 1 -s -r -p "Presiona cualquier tecla para volver al menú principal..."
    
    # Matar el proceso telnet
    kill $TELNET_PID
    
    echo "Volviendo al menú principal..."
else
    echo "No se detectó conexión a internet. El entretenimiento especial no está disponible."
    sleep 2
fi