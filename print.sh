#!/bin/bash

# Array de noticias aleatorias
noticias=(
  "Vault 112: Un fallo en los reactores causó una explosión catastrófica. No hay sobrevivientes."
  "Vault 7: Un brote de una enfermedad desconocida ha afectado a la mayoría de los residentes. Se teme lo peor."
  "Vault 54: Se reporta que el Overseer ha sido derrocado. La situación es caótica."
  "Vault 98: Se ha agotado el suministro de alimentos. Los residentes están recurriendo al canibalismo."
  "Vault 15: Una tormenta radiactiva destruyó las comunicaciones. No se sabe nada del paradero de los habitantes."
  "Vault 31: Se han reportado avistamientos de mutantes cerca de la entrada. Los residentes están aterrorizados."
  "Vault 3: Una falla en el sistema de seguridad dejó a varios residentes atrapados en áreas selladas."
  "Vault 21: Un ataque de saqueadores ha destruido gran parte del Vault. Los sobrevivientes están en estado de shock."
  "Vault 92: Una fuga de radiación ha contaminado el suministro de agua. Las tasas de mortalidad se han disparado."
  "Vault 101: El sistema de soporte vital está fallando. El Overseer ha ordenado la evacuación inmediata."
  "Vault 76: Se han perdido los registros de varios residentes. Se sospecha de experimentos encubiertos."
  "Vault 77: Los residentes han desaparecido sin dejar rastro. Se rumorea que algo en el exterior está cazándolos."
  "Vault 14: Se ha detectado un grupo armado avanzando hacia el Vault. Las defensas están preparadas para el ataque."
  "Vault 65: Una inteligencia artificial ha tomado el control del Vault, dejando a los residentes sin poder de decisión."
  "Vault 32: Se han reportado señales extrañas provenientes del exterior. Nadie sabe lo que significan."
  "Vault 88: Un terremoto ha comprometido la integridad estructural del Vault. Las evacuaciones están en curso."
  "Vault 13: Un grupo de exploradores no ha regresado de su misión. Se teme que no haya sobrevivientes."
  "Vault 29: Los niños del Vault están desapareciendo misteriosamente. Nadie sabe qué está pasando."
  "Vault 90: Un virus desconocido ha comenzado a afectar la mente de los residentes, causando paranoia extrema."
  "Vault 50: El sistema de control del aire está emitiendo gases tóxicos. Los residentes están buscando refugio."
  "Vault 66: Se ha reportado una insurrección dentro del Vault. El control del Overseer está siendo desafiado."
  "Vault 40: Una señal de auxilio ha sido enviada, pero las comunicaciones se cortaron antes de obtener detalles."
  "Vault 75: Los residentes han comenzado a escuchar voces en los túneles. El miedo se ha apoderado del Vault."
  "Vault 16: La electricidad ha fallado por completo. La oscuridad y el frío extremo están afectando a todos."
  "Vault 45: Se ha encontrado un código encriptado: 010101. Nadie sabe para qué sirve, pero se dice que es importante."
  "Vault 24: Se ha iniciado un éxodo masivo hacia el exterior. Los que se quedan esperan no ser abandonados."
  "Vault 6: Se ha detectado radiación fuera de los niveles normales. Los residentes temen por su salud."
  "Vault 86: Un grupo rebelde ha tomado el control del sistema de suministros y está exigiendo nuevas condiciones."
  "Vault 44: Las reservas de agua han sido envenenadas. Las muertes aumentan rápidamente entre los habitantes."
  "Vault 1: El Overseer ha decidido cerrar las puertas del Vault para siempre. Nadie entra, nadie sale."
  "Vault 22: Algo está acechando a los residentes en las sombras. El miedo se está propagando como el fuego."
)

# Seleccionar una noticia aleatoria
noticia_aleatoria=${noticias[$RANDOM % ${#noticias[@]}]}

# Imprimir la noticia en la impresora térmica
echo "=============================" > /dev/usb/lp0
echo "Mensaje Secreto del Vault" >> /dev/usb/lp0
echo "=============================" >> /dev/usb/lp0
echo "$noticia_aleatoria" >> /dev/usb/lp0
echo "=============================" >> /dev/usb/lp0
echo "" >> /dev/usb/lp0