#!/usr/bin/env bash

# Definir BASE_DIR relativo al script actual
BASE_DIR="$(cd "$(dirname "$0")"; pwd)" || exit 2

# Definir las rutas
entries_dir="$BASE_DIR/entries"
base_dir="$BASE_DIR/base"

# Verificar si el directorio base existe
if [ ! -d "$base_dir" ]; then
    echo "Error: el directorio base no existe."
    exit 1
fi

# Borrar todos los archivos en la carpeta entries
rm -rf "$entries_dir"/*

# Copiar todos los archivos desde la carpeta base a la carpeta entries
cp -r "$base_dir"/* "$entries_dir"

if [ $? -eq 0 ]; then
    echo "Valores predeterminados restaurados."
else
    echo "Error: no se pudieron copiar los archivos."
fi