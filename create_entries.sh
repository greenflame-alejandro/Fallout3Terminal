#!/usr/bin/env bash

# Directorio donde se crearán los archivos
output_dir="base"

# Crear el directorio si no existe
mkdir -p "$output_dir"

# Datos de las entradas de la bitácora
entries=(
    "2180-02-10 Mantenimiento de Sistemas: Revisión diaria de los sistemas eléctricos completada. No se encontraron irregularidades. Se recomienda continuar con las revisiones semanales."
    "2180-06-15 Informe de Recursos: Los niveles de agua y alimentos se mantienen dentro de los parámetros normales. No se detectaron anomalías en los suministros."
    "2181-01-20 Reunión del Overseer: El Overseer realizó una reunión con el equipo de mantenimiento para discutir la próxima actualización del software de la terminal principal."
    "2181-09-03 Entrenamiento de Seguridad: Se llevó a cabo una sesión de entrenamiento de seguridad para todos los residentes. El enfoque estuvo en la prevención de incendios y evacuación."
    "2182-04-22 Informe de Salud: El equipo médico informó que no se han registrado enfermedades graves en las últimas semanas. Continúa la vigilancia de salud."
    "2183-12-18 Evento Social: Se organizó un evento social para los residentes. La participación fue alta, lo que contribuyó al bienestar general."
    "2184-07-09 Evaluación de Moral: Una encuesta reciente muestra que la moral de los residentes se mantiene alta. Se planean más actividades recreativas."
    "2185-11-25 Actualización del Software: El software de la terminal principal fue actualizado sin problemas. Los residentes reportan un rendimiento más rápido."
    "2186-08-14 Inspección de Seguridad: La inspección de seguridad mensual no reveló problemas graves. Se sugirió mejorar el control de acceso en ciertas áreas."
    "2187-03-30 Informe Climático: El sistema climático del Vault continúa funcionando correctamente, manteniendo la temperatura y humedad en niveles óptimos."
)

# Crear los archivos con los nombres y contenidos correspondientes
for entry in "${entries[@]}"; do
    filename=$(echo "$entry" | cut -d: -f1)
    content=$(echo "$entry" | cut -d: -f2-)
    echo "$content" > "$output_dir/$filename"
done

echo "Archivos de bitácora creados en $output_dir"