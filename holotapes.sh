#!/usr/bin/env bash

BASE_DIR="$(cd "$(dirname "$0")"; pwd)" || exit 2

# Función para reproducir sonidos
play_sound() {
    play -q "$BASE_DIR/$1" -b 16 > /dev/null 2>&1
}

# Función para mostrar el encabezado superior alineado al centro
display_center(){
    columns="$(tput cols)"
    while IFS= read -r line; do
        printf "%*s\n" $(( (${#line} + columns) / 2)) "$line"
    done < "$1"
}

# Función para mostrar la fecha y hora con el año ajustado
display_date_time() {
    local current_date=$(date +"%Y-%m-%d %H:%M:%S")
    local adjusted_year=2190
    local adjusted_date="${adjusted_year}${current_date:4}"
    printf "%*s\n" $(( (${#adjusted_date} + $(tput cols)) / 2)) "$adjusted_date"
}

# Aquí la función principal holotape_reader_func
holotape_reader_func () {
    clear
    display_center "$BASE_DIR/greeterheader.txt"
    display_date_time  # Mostrar la fecha y hora ajustada
    echo "$greeter"
    play_sound "ui_hacking_charscroll.wav"
    echo "Presiona CTRL+C para salir." | pv -qL 80
    echo
    play_sound "ui_hacking_charscroll.wav"

    while true; do
        read -p "> " input_text
        valid_text=$(echo "$input_text" | tr -cd '[:alnum:] [:punct:]')

        while [ ${#valid_text} -gt $(tput cols) ]; do
            echo "${valid_text:0:$(tput cols)}"
            valid_text="${valid_text:$(tput cols)}"
        done

        echo "$valid_text"

        if [ -z "$input_text" ]; then
            break
        fi
    done

    play_sound "ui_hacking_charenter_01.wav"
    # Llamar a la función que quieras al finalizar
}

# Ejecutar la función automáticamente al llamar el script
holotape_reader_func