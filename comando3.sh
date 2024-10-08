#!/usr/bin/env bash

BASE_DIR="$(cd "$(dirname "$0")"; pwd)" || exit 2

"$BASE_DIR/relay.sh" 2500

# Ejecutar la alarma en segundo plano
play -q "$BASE_DIR/ui_alarm_01.mp3" -b 16 > /dev/null 2>&1 &

play -q "$BASE_DIR/ui_hacking_charscroll.wav" -b 16 > /dev/null 2>&1
echo "Iniciando secuencia de autodestrucción..." | pv -qL 20
sleep 1

play -q "$BASE_DIR/ui_hacking_charscroll.wav" -b 16 > /dev/null 2>&1
echo -n "[###................] 20% Preparando sistemas..." | pv -qL 10
sleep 2

play -q "$BASE_DIR/ui_hacking_charscroll.wav" -b 16 > /dev/null 2>&1
echo -n -e "\r[#######............] 40% Iniciando protocolos de seguridad..." | pv -qL 10
sleep 2

play -q "$BASE_DIR/ui_hacking_charscroll.wav" -b 16 > /dev/null 2>&1
echo -n -e "\r[############.......] 60% Desbloqueando módulos críticos..." | pv -qL 10
sleep 2

play -q "$BASE_DIR/ui_hacking_charscroll.wav" -b 16 > /dev/null 2>&1
echo -n -e "\r[##################.] 90% Activando sistemas principales..." | pv -qL 10
sleep 2

play -q "$BASE_DIR/ui_hacking_charscroll.wav" -b 16 > /dev/null 2>&1
echo -n -e "\r[###################] 100% Proceso completado." | pv -qL 10
sleep 1

play -q "$BASE_DIR/ui_hacking_passbad.wav" -b 16 > /dev/null 2>&1
echo -e "\n\nError: Secuencia de autodestrucción no autorizada. Abortando operación. Esta acción será reportada" | pv -qL 20