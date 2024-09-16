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
  local word1=$1
  local word2=$2
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

# Elegir palabras aleatoriamente
selected_words=()
for ((i = 0; i < 10; i++)); do
  word=${palabras[RANDOM % ${#palabras[@]}]}
  while [[ " ${selected_words[@]} " =~ " ${word} " ]]; do
    word=${palabras[RANDOM % ${#palabras[@]}]}
  done
  selected_words+=("$word")
done

# Asegurarse de que haya al menos 10 palabras
while [[ ${#selected_words[@]} -lt 10 ]]; do
  word=${palabras[RANDOM % ${#palabras[@]}]}
  if [[ ! " ${selected_words[@]} " =~ " ${word} " ]]; then
    selected_words+=("$word")
  fi
done

# Insertar palabras en las líneas de hack
for ((i = 0; i < ${#selected_words[@]}; i++)); do
  hack_line="${hack_lines[i]}"
  selected_word="${selected_words[i]}"
  position=$((RANDOM % (24 - ${#selected_word} + 1) + 9))
  hack_lines[i]="${hack_line:0:position}${selected_word}${hack_line:position+${#selected_word}}"
done

# Función para mostrar las líneas de hack en dos columnas
display_hack_lines() {
  for ((i = 0; i < 18; i++)); do
    printf "%-38s %-38s\n" "${hack_lines[i]}" "${hack_lines[i+18]}"
  done
}

# Bucle principal del juego
attempts=4
clear
echo "ROBCO INDUSTRIES (TM) PROTOCOLO TERMLINK"
echo "ESTADO: INTRODUZCA LA CONTRASEÑA AHORA"
echo " "
echo -n "$attempts INTENTO(S) RESTANTE(S): "
for ((i = 0; i < attempts; i++)); do
  echo -n "█ "
done
echo " "
echo " "

# Mostrar las líneas de hack en dos columnas
display_hack_lines

previous_inputs=()
while [[ $attempts -gt 0 ]]; do
  echo " "
  read -p "C> " input
  if [[ "$input" == "$password" ]]; then
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
  elif [[ "${selected_words[@]}" =~ "$input" ]]; then
    ((attempts--))
    clear
    echo "ROBCO INDUSTRIES (TM) PROTOCOLO TERMLINK"
    echo "ESTADO: ENTRADA DENEGADA"
    echo -n "$attempts INTENTO(S) RESTANTE(S): "
    for ((i = 0; i < attempts; i++)); do
      echo -n "█ "
    done
    echo " "
    echo " "
    display_hack_lines
    if [[ ${#previous_inputs[@]} -gt 0 ]]; then
      for stored_input in "${previous_inputs[@]}"; do
        echo -n "C> $stored_input > ENTRADA DENEGADA. $(similarity_score "$stored_input" "$password")/${#stored_input} "
      done
      echo ""
    fi
    previous_inputs+=("$input")
    echo -n "C> $input > ENTRADA DENEGADA. $(similarity_score "$input" "$password")/${#input} "
  else
    ((attempts--))
    clear
    echo "ROBCO INDUSTRIES (TM) PROTOCOLO TERMLINK"
    echo "ESTADO: ENTRADA INVÁLIDA"
    echo -n "$attempts INTENTO(S) RESTANTE(S): "
    for ((i = 0; i < attempts; i++)); do
      echo -n "█ "
    done
    echo " "
    echo " "
    display_hack_lines
    if [[ ${#previous_inputs[@]} -gt 0 ]]; then
      for stored_input in "${previous_inputs[@]}"; do
        echo -n "C> $stored_input > ENTRADA DENEGADA. $(similarity_score "$stored_input" "$password")/${#stored_input} "
      done
      echo ""
    fi
    echo -n "C> $input > ENTRADA INVÁLIDA "
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