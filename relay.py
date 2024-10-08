import serial
import time

# Inicializa el objeto ser como None para evitar errores en el finally
ser = None

# Configurar el puerto serial
try:
    ser = serial.Serial(
        port='/dev/ttyUSB0',  # Nombre del puerto
        baudrate=9600,        # Velocidad de transmisión
        bytesize=serial.EIGHTBITS,  # Tamaño del byte (cs8)
        parity=serial.PARITY_NONE,  # Sin paridad (cread clocal)
        stopbits=serial.STOPBITS_ONE,  # Bit de parada
        timeout=1,             # Tiempo de espera para la lectura
        rtscts=False           # Desactivar el control de flujo de hardware
    )
    
    if ser.is_open:
        print("Puerto serial {} abierto correctamente".format(ser.port))
    
    # Enviar algún comando o datos por el puerto serial
    ser.write(b'Hola, puerto serial!\n')

    # Leer la respuesta (si la hay)
    while True:
        if ser.in_waiting > 0:
            data = ser.readline()
            print("Recibido: {}".format(data.decode('utf-8')))
        time.sleep(1)

except serial.SerialException as e:
    print("Error al abrir el puerto serial: {}".format(e))

finally:
    if ser and ser.is_open:
        ser.close()
        print("Puerto serial cerrado")