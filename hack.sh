#!/bin/bash

# Function to start a new game
start_new_game() {
  clear
  "$0"
  exit
}

# Function to generate random symbols
generate_symbols() {
  local symbols=""
  local symbols_list=("!" "@" "#" "$" "%" "^" "&" "*" "(" ")" "_" "-" "=" "+" "[" "{" "]" "}" "|" ":" ";" "\"" "," "<" "." ">" "/" "?" "\`" "~")

  for ((i = 0; i < 34; i++)); do
    symbols+=${symbols_list[RANDOM % ${#symbols_list[@]}]}
  done

  echo "$symbols"
}

# Function to calculate number of common characters between input and password
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

# Initialize RANDOM with the process ID
RANDOM=$$

# Array of words for Very Easy difficulty
words=(
  "FRIED" "TREES" "RIGID" "HIRED" "TRIES" "WRITE" "TRIED" "GREED" "DRIED" "BRAIN" "SKIES" "LAWNS" "GHOST" "CAUSE" "PAINT" "SHINY" "MAKES" "GAINS" "THIEF" "BASES" "RAISE" "REFER" "CARES" "TAKEN" "WAKES" "WAVES" "WARNS" "SAVES"
)

# Generate a random password from the words
password=${words[RANDOM % ${#words[@]}]}

# Generate hack lines for the game
hack_lines=()
for ((i = 0; i < 19; i++)); do
  symbols1=$(generate_symbols)
  symbols2=$(generate_symbols)
  line="0xF$(printf "%03d" $((RANDOM % 1000)))   ${symbols1}   0xF$(printf "%03d" $((RANDOM % 1000)))   ${symbols2}"
  hack_lines+=("$line")
done

# Randomly choose hack lines and words
selected_hacklines=()
selected_words=()
for ((i = 0; i < 10; i++)); do
  index=$((RANDOM % ${#hack_lines[@]}))
  selected_hacklines+=("${hack_lines[$index]}")
  unset "hack_lines[$index]"
  hack_lines=("${hack_lines[@]}")

  word=${words[RANDOM % ${#words[@]}]}
  while [[ " ${selected_words[@]} " =~ " ${word} " ]]; do
    word=${words[RANDOM % ${#words[@]}]}
  done
  selected_words+=("$word")
done

# Insert words into hack lines
for ((i = 0; i < 10; i++)); do
  hack_line="${selected_hacklines[i]}"
  selected_word="${selected_words[i]}"
  position=$((RANDOM % 23 + 9))
  selected_hacklines[i]="${hack_line:0:position}${selected_word}${hack_line:position+${#selected_word}}"
done

# Combine and mix hack lines
mixed_hacklines=("${selected_hacklines[@]}" "${hack_lines[@]}")

# Main game loop
attempts=4
clear
echo "ROBCO INDUSTRIES (TM) TERMLINK PROTOCOL"
echo "STATUS: ENTER PASSWORD NOW"
echo " "
echo -n "$attempts ATTEMPT(S) LEFT: "
for ((i = 0; i < attempts; i++)); do
  echo -n "█ "
done
echo " "
echo " "

# Display the mixed hack lines
for line in "${mixed_hacklines[@]}"; do
  echo "$line"
done

previous_inputs=()
while [[ $attempts -gt 0 ]]; do
  echo " "
  read -p "C> " input
  if [[ "$input" == "$password" ]]; then
    sleep 1.5
    echo "> Entry accepted. Loading OS..."
    sleep 0.5
    echo " "
    read -p "RELOAD TERMINAL? (Y/N): " retry
    if [[ $retry =~ ^[Yy] ]]; then
      start_new_game
    else
      echo "SHUTTING DOWN TERMINAL..."
      sleep 1
      exit
    fi
  elif [[ "${selected_words[@]}" =~ "$input" ]]; then
    ((attempts--))
    clear
    echo "ROBCO INDUSTRIES (TM) TERMLINK PROTOCOL"
    echo "STATUS: ENTRY DENIED"
    echo " "
    echo -n "$attempts ATTEMPT(S) LEFT: "
    for ((i = 0; i < attempts; i++)); do
      echo -n "█ "
    done
    echo " "
    echo " "
    for line in "${mixed_hacklines[@]}"; do
      echo "$line"
    done
    if [[ ${#previous_inputs[@]} -gt 0 ]]; then
      for stored_input in "${previous_inputs[@]}"; do
        echo " "
        echo "C> $stored_input"
        echo "> ENTRY DENIED. $(similarity_score "$stored_input" "$password")/${#stored_input}"
      done
    fi
    previous_inputs+=("$input")
    echo " "
    echo "C> $input"
    echo "> ENTRY DENIED. $(similarity_score "$input" "$password")/${#input}"
  else
    clear
    echo "ROBCO INDUSTRIES (TM) TERMLINK PROTOCOL"
    echo "STATUS: INVALID ENTRY"
    echo " "
    echo -n "$attempts ATTEMPT(S) LEFT: "
    for ((i = 0; i < attempts; i++)); do
      echo -n "█ "
    done
    echo " "
    echo " "
    for line in "${mixed_hacklines[@]}"; do
      echo "$line"
    done
    if [[ ${#previous_inputs[@]} -gt 0 ]]; then
      for stored_input in "${previous_inputs[@]}"; do
        echo " "
        echo "C> $stored_input"
        echo "> ENTRY DENIED. $(similarity_score "$stored_input" "$password")/${#stored_input}"
      done
    fi
    echo " "
    echo "C> $input"
    echo "> INVALID ENTRY"
  fi
done

if [[ $attempts -eq 0 ]]; then
  sleep 1
  echo " "
  echo "ACCESS DENIED."
  echo "PLEASE CONTACT AN ADMINISTRATOR."
  echo " "
  sleep 1
  echo "EXPECTED ENTRY: $password"
  echo " "
  sleep 1
  read -p "RELOAD TERMINAL? (Y/N): " retry
  if [[ $retry =~ ^[Yy] ]]; then
    start_new_game
  else
    echo "SHUTTING DOWN TERMINAL..."
    sleep 2
    exit
  fi
fi