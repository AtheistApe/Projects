from time import sleep
import serial
ser = serial.Serial('/dev/tty.usbmodemFA141', 9600) # Establish the connection on a specific port

while True:
    print(ser.readline())