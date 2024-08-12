#!/usr/bin/env bash

# Directorio donde se crearán los archivos
output_dir="holotapes"

# Crear el directorio si no existe
mkdir -p "$output_dir"

# Datos de las holocintas (registros más detallados, con fechas entre 2180 y 2190)
holotapes=(
    "2183-07-11 Inicio de Procedimiento de Evaluacion de Recursos El Overseer ha comenzado un inventario completo de los recursos del Vault Los suministros parecen ser suficientes pero ha expresado su preocupacion por la sostenibilidad a largo plazo Ordena reducir las raciones diarias para preservar los recursos Algunos residentes comienzan a murmurar sobre la verdadera necesidad de estas restricciones"
    "2184-06-25 Reubicacion Forzosa Programa Experimental de Asentamientos Externos El Overseer ha implementado un programa piloto que selecciona a ciertos habitantes del Vault para ser reasentados fuera de la seguridad del Vault Oficialmente se dice que es una mision para explorar y establecer nuevos asentamientos pero se sospecha que es una medida para deshacerse de los individuos menos productivos"
    "2184-10-14 Informe de Seguridad Infiltracion de Elementos Externos Una supuesta brecha de seguridad permitio que elementos peligrosos entraran al Vault El Overseer decreta el cierre total de ciertas areas obligando a varios residentes a evacuar hacia el exterior No hay evidencia clara de la infiltracion pero la evacuacion se llevo a cabo sin cuestionamientos"
    "2185-01-23 Racionamiento Critico Emergencia Alimentaria Un misterioso fallo tecnico en el sistema de almacenamiento provoco la perdida de una gran cantidad de suministros El Overseer declara una emergencia alimentaria y ordena la salida de un grupo selecto de residentes para encontrar recursos alternativos La mision resulta en la perdida de contacto con estos habitantes"
    "2185-04-11 Programa de Control Demografico Se instaura un programa de control de natalidad estricto bajo la excusa de que la poblacion del Vault ha alcanzado un punto critico Algunos residentes seleccionados para esterilizacion obligatoria comienzan a cuestionar las intenciones del Overseer sospechando que busca controlar la poblacion mediante la fuerza"
    "2185-09-08 Crisis Energetica Mantenimiento de Reactores El Overseer anuncia que los reactores del Vault estan funcionando a una capacidad critica y que es necesario realizar reparaciones urgentes Un equipo de tecnicos es enviado al exterior para obtener piezas de repuesto pero nunca regresan Los rumores sobre la intencion del Overseer de deshacerse de personal clave comienzan a circular"
    "2186-11-20 Iniciativa de Mejoramiento Genetico El Overseer lanza un programa experimental de mejoramiento genetico afirmando que los residentes seleccionados seran enviados a un centro especializado en el exterior Los seleccionados desaparecen sin dejar rastro y el programa es rapidamente abandonado levantando sospechas sobre su verdadero proposito"
    "2188-05-13 Simulacro de Evacuacion Total El Vault realiza un simulacro de evacuacion total bajo la supervision directa del Overseer Durante el ejercicio un grupo significativo de residentes es dirigido hacia el exterior bajo la promesa de refugio adicional pero las puertas del Vault se cierran detras de ellos Los registros oficiales no mencionan su destino"
    "2188-12-19 Propaganda de Reconstruccion Externa Se distribuyen panfletos y mensajes en el Vault alentando a los residentes a participar en la Reconstruccion del Mundo Exterior El Overseer promueve activamente la idea de que la vida fuera del Vault es viable y prometedora Los voluntarios que salen no son vistos nuevamente y los informes sobre sus progresos se detienen repentinamente"
    "2189-03-04 Ultima Fase del Plan de Despoblacion El Overseer da la orden final para reducir significativamente la poblacion del Vault Los residentes son enviados en misiones de rescate al exterior pero estas resultan ser trampas para forzarlos a abandonar el Vault de manera definitiva La resistencia interna crece pero es rapidamente suprimida mientras que la salida del Vault se convierte en una obsesion creciente entre los habitantes restantes"
)

# Crear los archivos con los nombres y contenidos correspondientes
counter=1
for holotape in "${holotapes[@]}"; do
    filename="QR-$counter"
    content=$(echo "$holotape" | cut -d' ' -f2-)
    date=$(echo "$holotape" | cut -d: -f1)
    echo "$date - $content" > "$output_dir/$filename"
    ((counter++))
done

echo "Holocintas creadas en $output_dir"
