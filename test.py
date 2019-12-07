# External module imports
import RPi.GPIO as GPIO
import time

house1 = 6
house2 = 13
house3 = 19
comcen = 26

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

GPIO.setup(house1, GPIO.OUT)
GPIO.setup(house2, GPIO.OUT)
GPIO.setup(house3, GPIO.OUT)
GPIO.setup(comcen, GPIO.OUT)

print "LED on"
GPIO.output(house1, GPIO.HIGH)
time.sleep(10)
print "LED off"
GPIO.output(house1, GPIO.LOW)

