import serial
import time

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
        print(f"Puerto serial {ser.port} abierto correctamente")
    
    # Enviar algún comando o datos por el puerto serial
    ser.write(b'Hola, puerto serial!\n')

    # Leer la respuesta (si la hay)
    while True:
        if ser.in_waiting > 0:
            data = ser.readline()
            print(f"Recibido: {data.decode('utf-8')}")
        time.sleep(1)

except serial.SerialException as e:
    print(f"Error al abrir el puerto serial: {e}")

finally:
    if ser.is_open:
        ser.close()
        print("Puerto serial cerrado")