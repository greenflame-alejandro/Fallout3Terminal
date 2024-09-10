#!/bin/bash

# Función para verificar la conexión a internet
check_internet() {
    wget -q --spider http://google.com
    return $?
}

# Función para mostrar una animación ASCII local
show_local_animation() {
    echo "Mostrando entretenimiento local..."
    for i in {1..50}; do
        clear
        case $((i % 4)) in
            0) echo "( •_•)";;
            1) echo "( •_•)>⌐■-■";;
            2) echo "(⌐■_■)";;
            3) echo " DEAL WITH IT ";;
        esac
        sleep 0.5
    done
}

# Verificar la conexión a internet
if check_internet; then
    echo "Conexión a Poseidonet detectada. Intentando conectar al entretenimiento especial..."
    sleep 2
    
    # Intentar ejecutar telnet con un timeout
    timeout 10s telnet towel.blinkenlights.nl

    # Verificar si telnet se ejecutó correctamente
    if [ $? -ne 0 ]; then
        echo "No se pudo establecer la conexión con el servidor remoto."
        echo "Cambiando a entretenimiento local..."
        sleep 2
        show_local_animation
    fi
else
    echo "No se detectó conexión a internet. Mostrando entretenimiento local."
    sleep 2
    show_local_animation
fi

echo "Entretenimiento finalizado. Presiona cualquier tecla para volver al menú principal..."
read -n 1 -s -r