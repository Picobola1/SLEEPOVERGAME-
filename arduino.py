import serial
from pynput.keyboard import Controller, Key

keyboard = Controller()

arduino = serial.Serial("/dev/cu.usbmodem14201", 9600)

while True:
    line = arduino.readline().decode().strip()

    if line == "UP":
        keyboard.press(Key.space)
        keyboard.release(Key.space)
    if line == "LEFT": 
    
        keyboard.press("a")
        keyboard.release("a")
    if line == "RIGHT":
        keyboard.press("d")
        keyboard.release("d")
         
  


                 