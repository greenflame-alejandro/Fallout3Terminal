#!/bin/bash

# Función para iniciar un nuevo juego
start_new_game() {
  clear
  "$0"
  exit
}

# Función para generar símbolos aleatorios
generate_symbols() {
  local symbols=""
  local symbols_list=("!" "@" "#" "$" "%" "^" "&" "*" "(" ")" "_" "-" "=" "+" "[" "{" "]" "}" "|" ":" ";" "\"" "," "<" "." ">" "/" "?" "\`" "~")

  for ((i = 0; i < 24; i++)); do
    symbols+=${symbols_list[RANDOM % ${#symbols_list[@]}]}
  done

  echo "$symbols"
}

# Función para calcular el número de caracteres comunes entre la entrada y la contraseña
similarity_score() {
  local word1=$(echo $1 | tr '[:lower:]' '[:upper:]')
  local word2=$(echo $2 | tr '[:lower:]' '[:upper:]')
  local score=0

  for ((i = 0; i < ${#word1}; i++)); do
    if [[ ${word1:i:1} == ${word2:i:1} ]]; then
      ((score++))
    fi
  done

  echo "$score"
}

# Inicializar RANDOM con el ID del proceso
RANDOM=$$

# Array de palabras en español
palabras=(
  "FRITO" "ARBOL" "RIGIDO" "CONTRATADO" "INTENTA" "ESCRIBE" "PROBO" "CODICIA" "SECADO" "CEREBRO" "CIELOS" "CESPED" "FANTASMA" "CAUSA" "PINTAR" "BRILLANTE" "HACE" "GANA" "LADRON" "BASES" "SUBIR" "REFERIR" "CUIDA" "TOMADO" "DESPIERTA" "ONDAS" "ADVIERTE" "SALVA"
)

# Generar una contraseña aleatoria de las palabras
password=${palabras[RANDOM % ${#palabras[@]}]}

# Generar líneas de hack para el juego
hack_lines=()
for ((i = 0; i < 36; i++)); do
  symbols=$(generate_symbols)
  line="0xF$(printf "%03d" $((RANDOM % 1000)))   ${symbols}"
  hack_lines+=("$line")
done

# Elegir palabras aleatoriamente y distribuirlas en las líneas de hack
selected_words=()
available_lines=($(seq 0 35))
for ((i = 0; i < 8; i++)); do
  # Seleccionar una palabra aleatoria
  word=${palabras[RANDOM % ${#palabras[@]}]}
  while [[ " ${selected_words[@]} " =~ " ${word} " ]]; do
    word=${palabras[RANDOM % ${#palabras[@]}]}
  done
  selected_words+=("$word")

  # Seleccionar una línea aleatoria disponible
  line_index=$((RANDOM % ${#available_lines[@]}))
  line_number=${available_lines[line_index]}
  
  # Remover la línea seleccionada de las disponibles
  unset 'available_lines[line_index]'
  available_lines=(${available_lines[@]})

  # Insertar la palabra en la línea seleccionada
  hack_line="${hack_lines[line_number]}"
  position=$((RANDOM % (24 - ${#word} + 1) + 9))
  hack_lines[line_number]="${hack_line:0:position}${word}${hack_line:position+${#word}}"
done

# Función para mostrar las líneas de hack en dos columnas
display_hack_lines() {
  for ((i = 0; i < 18; i++)); do
    printf "%-38s %-38s\n" "${hack_lines[i]}" "${hack_lines[i+18]}"
  done
}

# Función para mostrar la interfaz del juego
display_interface() {
  clear
  echo "ROBCO INDUSTRIES (TM) PROTOCOLO TERMLINK"
  echo "ESTADO: INTRODUZCA LA CONTRASEÑA AHORA"
  echo " "
  echo -n "$1 INTENTO(S) RESTANTE(S): "
  for ((i = 0; i < $1; i++)); do
    echo -n "█ "
  done
  echo " "
  echo " "
  display_hack_lines
  echo " "
}

# Bucle principal del juego
attempts=4
display_interface $attempts

previous_inputs=()
while [[ $attempts -gt 0 ]]; do
  read -p "C> " input
  input_upper=$(echo $input | tr '[:lower:]' '[:upper:]')
  if [[ "$input_upper" == "$password" ]]; then
    sleep 1.5
    echo "> Entrada aceptada. Cargando SO..."
    sleep 0.5
    echo " "
    ./holotapes.sh
    read -p "¿RECARGAR TERMINAL? (S/N): " retry
    if [[ $retry =~ ^[Ss] ]]; then
      start_new_game
    else
      echo "APAGANDO TERMINAL..."
      sleep 1
      exit
    fi
  else
    ((attempts--))
    display_interface $attempts
    if [[ ${#previous_inputs[@]} -gt 0 ]]; then
      for stored_input in "${previous_inputs[@]}"; do
        echo -n "C> $stored_input > ENTRADA DENEGADA. $(similarity_score "$stored_input" "$password")/${#stored_input} "
      done
      echo ""
    fi
    previous_inputs+=("$input")
    if [[ "${selected_words[@]}" =~ "$input_upper" ]]; then
      echo -n "C> $input > ENTRADA DENEGADA. $(similarity_score "$input" "$password")/${#input}"
    else
      echo -n "C> $input > ENTRADA INVÁLIDA"
    fi
  fi
done

if [[ $attempts -eq 0 ]]; then
  sleep 1
  echo " "
  echo "ACCESO DENEGADO."
  echo "POR FAVOR CONTACTE A UN ADMINISTRADOR."
  echo " "
  sleep 1
  echo "ENTRADA ESPERADA: $password"
  echo " "
  sleep 1
  read -p "¿RECARGAR TERMINAL? (S/N): " retry
  if [[ $retry =~ ^[Ss] ]]; then
    start_new_game
  else
    echo "APAGANDO TERMINAL..."
    sleep 2
    exit
  fi
fi