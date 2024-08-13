#!/usr/bin/env bash

# Directorio donde se crearán los archivos
output_dir="holotapes"

# Crear el directorio si no existe
mkdir -p "$output_dir"

# Datos de las holocintas (registros más detallados, con fechas entre 2180 y 2190)
holotapes=(
    "2183-07-11 Evaluacion de Recursos El Overseer ordena reducir drasticamente las raciones advirtiendo que los recursos son insuficientes Paranoia crece Es real la escasez o una estrategia de control"
    "2184-06-25 Reubicacion Forzosa Un programa piloto expulsa a habitantes para explorar el exterior Oficialmente es un nuevo asentamiento pero muchos creen que es un plan para deshacerse de los inutiles"
    "2184-10-14 Informe de Seguridad Una supuesta brecha de seguridad obliga a evacuar areas clave del Vault Sin pruebas el miedo se instala y los expulsados nunca regresan Quien esta realmente detras"
    "2185-01-23 Emergencia Alimentaria Un fallo tecnico destruye suministros vitales Overseer decreta la salida de un grupo para buscar alimentos pero desaparecen sin dejar rastro Error o sacrificio calculado"
    "2185-04-11 Control Demografico Bajo excusa de sobrepoblacion el Overseer implementa un programa de esterilizacion forzada La resistencia es sofocada Un plan para un futuro mejor o pura tirania"
    "2185-09-08 Crisis Energetica Los reactores fallan y el Overseer envia tecnicos al exterior Nunca regresan Fallo la mision o se deshizo de quienes sabian demasiado"
    "2186-11-20 Mejoramiento Genetico Un programa experimental promete mejoras geneticas pero los seleccionados desaparecen misteriosamente Avance cientifico o purga encubierta"
    "2188-05-13 Simulacro de Evacuacion Un simulacro por seguridad termina con un grupo grande de residentes fuera del Vault Las puertas se cierran tras ellos Evacuacion o exilio"
    "2188-12-19 Propaganda de Reconstruccion El Overseer anima a los habitantes a reconstruir el exterior Los voluntarios se marchan para no regresar jamas Promesa de un futuro mejor o trampa mortal"
    "2189-03-04 Plan de Despoblacion El plan final del Overseer envia a los residentes a misiones de rescate que son trampas mortales La paranoia y el miedo consumen a los pocos que quedan"
    "2189-07-15 Codigo de Autodestruccion En caso de necesidad extrema utiliza el codigo 010101 para activar la secuencia de autodestruccion Esta es la ultima carta del Overseer un secreto mortal"
)

# Crear los archivos con los nombres y contenidos correspondientes
counter=1
for holotape in "${holotapes[@]}"; do
    filename="QR-$counter"
    content=$(echo "$holotape")
    echo "$content" > "$output_dir/$filename"
    ((counter++))
done

echo "Holocintas creadas en $output_dir"