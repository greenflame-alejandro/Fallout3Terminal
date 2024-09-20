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
  "Vault 101: El Overseer ha desaparecido. Nadie sabe quien esta a cargo, el caos ha tomado control."
  "Vault 33: Una figura oscura ha sido vista cerca de las puertas. Todos tienen miedo, nadie se atreve a salir."
  "Vault 57: Hemos perdido el contacto con el exterior. No queda esperanza, solo estamos esperando el final."
  "Vault 41: Los niveles de oxigeno estan bajando. Estamos peleando por cada respiracion."
  "Vault 66: Una plaga se esta extendiendo. Cada dia pierdo mas amigos... temo que sere el proximo."
  "Vault 18: El reactor esta a punto de colapsar. No hay forma de detenerlo, estamos condenados."
  "Vault 90: Los experimentos geneticos han salido mal. Ya no somos humanos, algo mas esta tomando nuestro lugar."
  "Vault 52: El sistema de energia ha fallado. La oscuridad esta por todas partes y no sabemos como arreglarlo."
  "Vault 13: La radiacion esta entrando a raudales. Nuestros cuerpos se estan desintegrando lentamente."
  "Vault 5: Me he quedado solo. No queda nadie con quien hablar. Este es mi ultimo mensaje."
  "Vault 44: Algo en el agua esta envenenandonos. Cada sorbo es una sentencia de muerte."
  "Vault 29: Las criaturas del exterior estan tocando las puertas. Sabemos que pronto nos alcanzaran."
  "Vault 86: La locura se ha apoderado de todos. No queda nadie cuerdo, excepto yo. ¿O ya estoy perdiendo la razon tambien?"
  "Vault 20: El sistema de soporte vital ha fallado. Estamos respirando nuestro propio destino, y no es el que esperabamos."
  "Vault 31: Un brote de violencia nos esta destruyendo desde adentro. Nos hemos convertido en nuestros propios enemigos."
  "Vault 72: Las maquinas han tomado el control. Ya no somos necesarios. Nos estan cazando."
  "Vault 49: La comida ha desaparecido. Hay rumores de canibalismo. No se si podre resistir mucho mas."
  "Vault 68: Cada dia se siente mas largo. La soledad es lo unico que me acompana. Los recuerdos me consumen."
  "Vault 19: No puedo soportar el silencio. Mis propios pensamientos me estan volviendo loco."
  "Vault 76: Un grupo de rebeldes se ha hecho con el control del Vault. Ya no estoy seguro en ningun lado."
  "Vault 88: El sistema de seguridad se ha bloqueado. Estamos atrapados. Nadie vendra a rescatarnos."
  "Vault 37: Los niños han comenzado a desaparecer. Cada dia hay menos. Nadie sabe adonde se los llevan."
  "Vault 60: Hemos detectado una figura solitaria caminando en la superficie. No sabemos si es amigo o enemigo."
  "Vault 25: El agua esta contaminada. Todos estan enfermos. No queda nadie sano."
  "Vault 79: Un fallo en los generadores ha dejado todo en tinieblas. Es imposible ver, imposible escapar."
  "Vault 34: Nos hemos quedado sin medicinas. Los enfermos no sobreviven mas de un dia. No queda esperanza."
  "Vault 11: El Overseer esta tomando decisiones sin sentido. Todos tememos que algo no esta bien con el."
  "Vault 3: Los saqueadores han encontrado nuestro Vault. Estamos preparandonos para lo peor."
  "Vault 91: Los mutantes han comenzado a atacarnos. No podemos detenerlos, son demasiados."
  "Vault 43: Cada dia que pasa, la comida es mas escasa. La desesperacion esta en todas partes."
  "Vault 12: El sistema de agua ha fallado. No nos queda mucho tiempo. Moriremos de sed."
  "Vault 53: Hemos encontrado mensajes codificados en los archivos del Overseer. No podemos descifrarlos, pero no son buenos."
  "Vault 2: Los rumores de una conspiracion dentro del Vault estan creciendo. Nadie sabe en quien confiar."
  "Vault 61: El aire esta contaminado. Cada respiro nos acerca un paso mas al final."
  "Vault 14: La radiacion nos ha alcanzado. Nuestros cuerpos estan empezando a colapsar."
  "Vault 27: La desesperacion ha tomado control. Algunos estan hablando de salir al exterior sin proteccion."
  "Vault 82: Los ataques mentales no se detienen. No hay forma de escapar de las voces."
  "Vault 55: Las puertas han sido selladas. Estamos atrapados, sin forma de escapar ni de luchar."
  "Vault 10: Hay algo en los tuneles. No lo podemos ver, pero sabemos que esta alli, acechandonos."
  "Vault 92: Se ha encontrado un diario de un residente que habla de una traicion en el Vault. No sabemos quien es el traidor."  
)

# Seleccionar una noticia aleatoria
noticia_aleatoria=$(limpiar_texto "${noticias[$RANDOM % ${#noticias[@]}]}")

# Imprimir la noticia en la impresora térmica
echo "=============================" > /dev/usb/lp0
echo "Mensaje nuevo del Vault" >> /dev/usb/lp0
echo "=============================" >> /dev/usb/lp0
echo "$noticia_aleatoria" >> /dev/usb/lp0
echo "=============================" >> /dev/usb/lp0
# Agregar saltos de línea adicionales
for i in {1..5}; do
  echo "" >> /dev/usb/lp0
done
echo "" >> /dev/usb/lp0

/home/vault/Escritorio/Fallout3Terminal/relay.sh 2100

aplay -q "/home/vault/Escritorio/Fallout3Terminal/ui_hacking_passgood.wav" > /dev/null 2>&1
