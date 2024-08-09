#!/usr/bin/env bash

# Directorio donde se crearán los archivos
output_dir="base"

# Crear el directorio si no existe
mkdir -p "$output_dir"

# Datos de las entradas de la bitácora
entries=(
    "01-Inicio de Procedimiento de Evaluación de Recursos: El Overseer ha comenzado un inventario completo de los recursos del Vault. Los suministros parecen ser suficientes, pero ha expresado su preocupación por la sostenibilidad a largo plazo. Ordena reducir las raciones diarias 'para preservar los recursos'. Algunos residentes comienzan a murmurar sobre la verdadera necesidad de estas restricciones."
    "02-Reubicación Forzosa: Programa Experimental de Asentamientos Externos: El Overseer ha implementado un 'programa piloto' que selecciona a ciertos habitantes del Vault para ser reasentados fuera de la seguridad del Vault. Oficialmente, se dice que es una misión para explorar y establecer nuevos asentamientos, pero se sospecha que es una medida para deshacerse de los individuos menos productivos."
    "03-Informe de Seguridad: Infiltración de Elementos Externos: Una supuesta brecha de seguridad permitió que 'elementos peligrosos' entraran al Vault. El Overseer decreta el cierre total de ciertas áreas, obligando a varios residentes a evacuar hacia el exterior. No hay evidencia clara de la infiltración, pero la evacuación se llevó a cabo sin cuestionamientos."
    "04-Racionamiento Crítico: Emergencia Alimentaria: Un misterioso 'fallo técnico' en el sistema de almacenamiento provocó la pérdida de una gran cantidad de suministros. El Overseer declara una emergencia alimentaria y ordena la salida de un grupo selecto de residentes 'para encontrar recursos alternativos'. La misión resulta en la pérdida de contacto con estos habitantes."
    "05-Programa de Control Demográfico: Se instaura un programa de control de natalidad estricto, bajo la excusa de que la población del Vault ha alcanzado un 'punto crítico'. Algunos residentes seleccionados para esterilización obligatoria comienzan a cuestionar las intenciones del Overseer, sospechando que busca controlar la población mediante la fuerza."
    "06-Crisis Energética: Mantenimiento de Reactores: El Overseer anuncia que los reactores del Vault están funcionando a una capacidad crítica y que es necesario realizar reparaciones urgentes. Un equipo de técnicos es enviado al exterior para obtener piezas de repuesto, pero nunca regresan. Los rumores sobre la intención del Overseer de deshacerse de personal clave comienzan a circular."
    "07-Iniciativa de Mejoramiento Genético: El Overseer lanza un programa experimental de mejoramiento genético, afirmando que los residentes seleccionados serán enviados a un 'centro especializado' en el exterior. Los seleccionados desaparecen sin dejar rastro, y el programa es rápidamente abandonado, levantando sospechas sobre su verdadero propósito."
    "08-Simulacro de Evacuación Total: El Vault realiza un simulacro de evacuación total bajo la supervisión directa del Overseer. Durante el ejercicio, un grupo significativo de residentes es dirigido hacia el exterior bajo la promesa de refugio adicional, pero las puertas del Vault se cierran detrás de ellos. Los registros oficiales no mencionan su destino."
    "09-Propaganda de Reconstrucción Externa: Se distribuyen panfletos y mensajes en el Vault, alentando a los residentes a participar en la 'Reconstrucción del Mundo Exterior'. El Overseer promueve activamente la idea de que la vida fuera del Vault es viable y prometedora. Los voluntarios que salen no son vistos nuevamente, y los informes sobre sus progresos se detienen repentinamente."
    "10-Última Fase del Plan de Despoblación: El Overseer da la orden final para reducir significativamente la población del Vault. Los residentes son enviados en 'misiones de rescate' al exterior, pero estas resultan ser trampas para forzarlos a abandonar el Vault de manera definitiva. La resistencia interna crece, pero es rápidamente suprimida, mientras que la salida del Vault se convierte en una obsesión creciente entre los habitantes restantes."
)

# Crear los archivos con los nombres y contenidos correspondientes
for entry in "${entries[@]}"; do
    filename=$(echo "$entry" | cut -d: -f1)
    content=$(echo "$entry" | cut -d: -f2-)
    echo "$content" > "$output_dir/$filename.txt"
done

echo "Archivos de bitácora creados en $output_dir"