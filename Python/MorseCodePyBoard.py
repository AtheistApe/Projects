# main.py -- put your code here!
import pyb

led = pyb.LED(4)
led.off()

morse_codes = {'a':'*-', 'b':'-***', 'c':'-*-*', 'd':'-**',
'e':'*', 'f':'**-*', 'g':'--*', 'h':'****', 'i':'**', 'j':'*---',
'k':'-*-', 'l':'*-**', 'm':'--', 'n':'-*', 'o':'---', 'p':'*--*',
'q':'--*-', 'r':'*-*', 's':'***', 't':'-', 'u':'**-', 'v':'***-',
'w':'*--', 'x':'-**-', 'y':'-*--', 'z':'--**', ' ':' '}

message = 'This is my message'

dot_length = 200 # The length of a 'dot' is 200 ms (0.2 s)
dash_length = 3*dot_length # The length of a 'dash'

def dot():
    led.on()
    pyb.delay(dot_length)
    led.off()
    pyb.delay(dot_length)

def dash():
    led.on()
    pyb.delay(dash_length)
    led.off()
    pyb.delay(dot_length)

def word():
    pyb.delay(2*dash_length)

def encode(message):
    encoded_message = []
    message = message.lower()
    for char in message:
        encoded_message.append(morse_codes[char])
    return ' '.join(encoded_message)

def send(encoded_message):
    print(encoded_message)
    for dotdash in encoded_message:
        if dotdash == '*':
            dot()
        if dotdash == '-':
            dash()
        if dotdash == ' ':
            word()


send(encode('This is an encoded message))
