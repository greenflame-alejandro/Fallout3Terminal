#!/usr/bin/env bash

play -q "$BASE_DIR/ui_hacking_charscroll.wav" -b 16 > /dev/null 2>&1
echo "Iniciando análisis del sistema de ventilación..." | pv -qL 20
sleep 1

play -q "$BASE_DIR/ui_hacking_charscroll.wav" -b 16 > /dev/null 2>&1
echo -n "[####...............] 25% Análisis del flujo de aire..." | pv -qL 10
sleep 2

play -q "$BASE_DIR/ui_hacking_charscroll.wav" -b 16 > /dev/null 2>&1
echo -n -e "\r[#########..........] 50% Comprobando filtros..." | pv -qL 10
sleep 2

play -q "$BASE_DIR/ui_hacking_charscroll.wav" -b 16 > /dev/null 2>&1
echo -n -e "\r[############.......] 75% Verificando sensores..." | pv -qL 10
sleep 2

play -q "$BASE_DIR/ui_hacking_charscroll.wav" -b 16 > /dev/null 2>&1
echo -n -e "\r[###################] 100% Proceso completado." | pv -qL 10
sleep 1

play -q "$BASE_DIR/ui_hacking_passgood.wav" -b 16 > /dev/null 2>&1
echo -e "\n\nResultado: Sistema de ventilación operativo. Sin anomalías detectadas." | pv -qL 20

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