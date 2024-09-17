#!/bin/bash

# Función para limpiar caracteres especiales
limpiar_texto() {
    echo "$1" | iconv -f utf-8 -t ascii//TRANSLIT | tr -d "'\`"
}

# Array de noticias dramáticas
noticias=(
  "Vault 112: El reactor ha explotado. No queda nadie vivo. Si estas leyendo esto, no hay esperanza."
  "Vault 7: Un virus ha infectado a todos. Estoy solo en la oscuridad... esperando mi final."
  "Vault 54: El Overseer ha sido asesinado. Nos estamos matando entre nosotros. Esto es el fin."
  "Vault 98: La comida se ha acabado. Estamos recurriendo a medidas desesperadas. Nunca pense que llegaria a esto."
  "Vault 15: La tormenta radiactiva ha destruido todo. No hay salida. Solo queda esperar la muerte."
  "Vault 31: Mutantes han invadido. No hay donde correr. Este sera mi ultimo mensaje."
  "Vault 3: Las puertas se han sellado. No hay escape. Estoy atrapado. Solo queda el silencio."
  "Vault 21: Saqueadores han destruido todo. Estoy escondido, pero no sobrevivire mucho mas."
  "Vault 92: El agua esta contaminada. Nadie lo sabe aun... pero ya es demasiado tarde para todos."
  "Vault 101: El sistema de soporte vital ha fallado. No hay vuelta atras. Que alguien recuerde mi nombre."
  "Vault 76: Los experimentos secretos nos han destruido. Ya no somos humanos."
  "Vault 77: Todos han desaparecido. No estoy seguro si soy el unico que queda. Es como si nunca hubieran existido."
  "Vault 14: Un grupo armado esta avanzando. No hay forma de defendernos. Esta es mi despedida."
  "Vault 65: La inteligencia artificial controla todo ahora. No tenemos libre albedrio. Somos marionetas."
  "Vault 32: Las señales extrañas... ¿es esto real? O mi mente me esta jugando una broma cruel."
  "Vault 88: El terremoto ha dejado todo en ruinas. No queda esperanza ni futuro. Solo polvo."
  "Vault 13: Los exploradores nunca volvieron. Algo esta cazando afuera. Algo que no podemos detener."
  "Vault 29: Los niños... estan desapareciendo. No entiendo que esta pasando, pero temo lo peor."
  "Vault 90: El virus nos esta volviendo locos. No confio en nadie. Ni siquiera en mi."
  "Vault 50: Gases toxicos estan llenando el Vault. No podemos respirar. No podemos escapar."
  "Vault 66: Hay una rebelion. Nos estamos matando por el control, pero ¿para que? Ya estamos condenados."
  "Vault 40: Se corto la comunicacion. Nadie viene a rescatarnos. Estamos olvidados."
  "Vault 75: Hay voces... voces en los tuneles. No puedo mas. No se si son reales."
  "Vault 16: La electricidad fallo. La oscuridad... la oscuridad esta en todas partes. No puedo soportarla."
  "Vault 45: Hemos encontrado un codigo encriptado: 010101. Nadie sabe para que es. Me aterra lo que pueda significar."
  "Vault 24: La gente esta huyendo. Los que quedan aqui estan perdiendo la razon. Yo soy uno de ellos."
  "Vault 6: La radiacion nos esta matando lentamente. No hay salida. Solo queda dolor."
  "Vault 86: Un grupo rebelde tiene los suministros. Nos controlan con hambre y miedo."
  "Vault 44: El agua ha sido envenenada. No queda mucho tiempo. Pronto estaremos todos muertos."
  "Vault 1: Las puertas se han cerrado para siempre. No podemos entrar ni salir. Es nuestro fin."
  "Vault 22: Algo se esconde en las sombras. Nos esta cazando uno por uno. No sobreviviremos."
  "Vault 19: Estoy solo. Todos se han ido. No puedo recordar cuando fue la ultima vez que hable con alguien."
  "Vault 84: Las luces parpadean... el silencio es insoportable. Me pregunto si soy el unico que queda."
  "Vault 5: No queda nadie con quien hablar. El silencio es lo unico que me acompana. La soledad es peor que la muerte."
  "Vault 17: Han pasado semanas sin una voz humana. Las maquinas zumban... pero yo me estoy apagando lentamente."
  "Vault 11: Cada dia es mas dificil respirar. No solo por la falta de aire... sino por la desesperacion."
  "Vault 71: Hace dias que no como. El hambre me consume, pero lo peor es la soledad. Nadie vendra."
  "Vault 9: Nadie responde las transmisiones. Creo que soy el unico que sigue con vida."
  "Vault 63: Mi piel esta empezando a quemarse... no pense que la radiacion llegaria tan rapido."
  "Vault 45: Si encuentras este mensaje, recuerda el codigo: 010101. No se que significa, pero es lo unico que tengo."
)

# Seleccionar una noticia aleatoria
noticia_aleatoria=$(limpiar_texto "${noticias[$RANDOM % ${#noticias[@]}]}")

# Imprimir la noticia en la impresora térmica
echo "=============================" > /dev/usb/lp0
echo "Mensaje nuevo del Vault" >> /dev/usb/lp0
echo "=============================" >> /dev/usb/lp0
echo "$noticia_aleatoria" >> /dev/usb/lp0
echo "=============================" >> /dev/usb/lp0
echo "" >> /dev/usb/lp0