#!/usr/bin/env bash

holotape_reader_func() {
    # Mostrar el texto del Menú
    clear
    display_center "$BASE_DIR/greeterheader.txt"
    display_date_time  # Mostrar la fecha y hora ajustada debajo del greeter
    echo "$greeter" 
    play_sound "ui_hacking_charscroll.wav"
    echo "Presiona CTRL+C para salir." | pv -qL 80
    echo
    play_sound "ui_hacking_charscroll.wav"

    # Permitir la escritura libre sin guardar, validando caracteres y manejando líneas largas
    while true; do
        read -p "> " input_text
        # Validar caracteres especiales
        valid_text=$(echo "$input_text" | tr -cd '[:alnum:] [:punct:]')
        
        # Si la longitud de la línea es demasiado larga, cortarla
        while [ ${#valid_text} -gt $(tput cols) ]; do
            echo "${valid_text:0:$(tput cols)}"
            valid_text="${valid_text:$(tput cols)}"
        done
        
        # Imprimir el texto restante
        echo "$valid_text"
        
        # Si el usuario presiona Ctrl+C, salir del bucle y volver al menú principal
        if [ -z "$input_text" ]; then
            break
        fi
    done

    # Volver al menú principal
    play_sound "ui_hacking_charenter_01.wav"
    repeatmainmenufunc
}

holotape_reader_func
