#!/usr/bin/env bash

BASE_DIR="$(cd "$(dirname "$0")"; pwd)" || exit 2

play -q "$BASE_DIR/ui_hacking_charscroll.wav" -b 16 > /dev/null 2>&1
echo "Iniciando chequeo del estado del chip de agua..." | pv -qL 20
sleep 1

play -q "$BASE_DIR/ui_hacking_charscroll.wav" -b 16 > /dev/null 2>&1
echo -n "[##########..........] 50% Comprobando integridad del sistema..." | pv -qL 10
sleep 2

play -q "$BASE_DIR/ui_hacking_charscroll.wav" -b 16 > /dev/null 2>&1
echo -n -e "\r[###################.] 90% Verificando conexiones..." | pv -qL 10
sleep 2

play -q "$BASE_DIR/ui_hacking_charscroll.wav" -b 16 > /dev/null 2>&1
echo -n -e "\r[####################] 100% Proceso completado." | pv -qL 10
sleep 1

play -q "$BASE_DIR/ui_hacking_passgood.wav" -b 16 > /dev/null 2>&1
echo -e "\n\nResultado: Chip de agua en funcionamiento óptimo." | pv -qL 20

echo '
⠀⠀⠀⠀⠀⠀⠀⠀⣤⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⢀⣄⠀⣠⠶⠲⠞⠁⠀⠙⠛⠳⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⡟⠙⠛⠁⣀⣀⢀⡤⢤⠀⠀⠀⠙⢷⣄⠀⠀⠀⠀⠀⠀⠀
⢠⡷⢄⣠⠊⠀⠀⠁⠀⡀⠑⠒⠈⢳⠀⢻⡆⠀⠀⠀⠀⠀⠀
⠀⣷⠃⢠⡀⠀⠀⠀⠀⠈⠀⠀⠀⢎⠀⢸⡇⠀⠀⠀⠀⠀⠀
⢠⡇⠀⠘⢁⡄⠀⠀⠉⠉⠀⠀⠀⣳⢧⣾⠃⠀⠀⠀⠀⠀⠀
⢸⡇⠀⠀⠘⠆⠀⠀⢀⠀⠀⠀⠀⠁⢿⡏⠀⠀⠀⠀⠀⠀⠀
⠈⣇⠸⢖⡀⠀⠐⣂⠹⡇⠀⠀⠀⣀⣼⠇⠀⠀⠀⠀⠀⠀⠀
⠀⠹⣦⠀⠈⠭⠉⠀⠀⠀⠀⣠⡾⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠈⠳⢦⣄⣀⣀⣠⡴⠞⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
'