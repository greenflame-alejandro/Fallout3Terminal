#!/usr/bin/env bash

# Directorio donde se encuentran los archivos WAV
input_dir="$(pwd)"  # Usa el directorio actual donde están los archivos WAV

# Lista de archivos WAV a optimizar
wav_files=(
    "ui_hacking_charenter_01.wav"
    "ui_hacking_charscroll.wav"
    "ui_hacking_passbad.wav"
    "ui_hacking_passgood.wav"
)

# Procesar cada archivo WAV en la lista
for wav_file in "${wav_files[@]}"; do
    # Optimizar el archivo y sobrescribir el original
    ffmpeg -i "$input_dir/$wav_file" -ar 22050 -acodec pcm_u8 -ac 1 -b:a 64k -f wav "$input_dir/$wav_file.tmp" && mv "$input_dir/$wav_file.tmp" "$input_dir/$wav_file"

    echo "Archivo $wav_file optimizado y sobrescrito."
done

echo "Optimización de archivos completada."