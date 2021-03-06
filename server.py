# External module imports
import platform
import time
from bottle import route, run, template, post, get
runGpio = False

if (platform.system() == 'Linux'):
  import RPi.GPIO as GPIO
  runGpio = True

house1 = 6
house2 = 13
house3 = 19
house4 = 26

if ( runGpio):
  GPIO.setmode(GPIO.BCM)
  GPIO.setwarnings(False)
  GPIO.setup(house1, GPIO.OUT)
  GPIO.setup(house2, GPIO.OUT)
  GPIO.setup(house3, GPIO.OUT)
  GPIO.setup(house4, GPIO.OUT)
  print( 'LED on')
  GPIO.output(house1, GPIO.HIGH)
  GPIO.output(house2, GPIO.HIGH)
  GPIO.output(house3, GPIO.HIGH)
  GPIO.output(house4, GPIO.HIGH)
  time.sleep(1)
  print( 'LED off')
  GPIO.output(house1, GPIO.LOW)
  GPIO.output(house2, GPIO.LOW)
  GPIO.output(house3, GPIO.LOW)
  GPIO.output(house4, GPIO.LOW)

def updateHouse( house, onoff):
  # get house io
  pin = 0
  if ( house == 'house1'):
    pin = house1
  elif ( house == 'house2'):
    pin = house2
  elif ( house == 'house3'):
    pin = house3
  else:
    pin = house4
  print( 'Turning %s state %s ' % (house, onoff) )
  if ( runGpio): 
    if ( onoff == 'on'):
      GPIO.output(pin, GPIO.HIGH)
    else:
      GPIO.output(pin, GPIO.LOW)
  # update local state as well
  return (onoff == 'on')

# setup routes
@route('/')
def home():
  return template('home')

@route('/main')
def main():
  return template('main')

@route('/demo')
def demo():
  return template('demo')

@route('/styles.css')
def styles():
  return template('styles')

@route('/styles2.css')
def styles2():
  return template('styles2')

@route('/hello/<name>')
def index(name):
  return template('<b>Hello {{name}}</b>!', name=name)


@post('/api/house1/<onoff>')
def house1post(onoff):
  if (onoff == 'on'):
    GPIO.output(house1, GPIO.HIGH)
  else:
    GPIO.output(house1, GPIO.LOW)

@post('/api/house2/<onoff>')
def house2post(onoff):
  if (onoff == 'on'):
    GPIO.output(house2, GPIO.HIGH)
  else:
    GPIO.output(house2, GPIO.LOW)

@post('/api/house3/<onoff>')
def house3post(onoff):
  if (onoff == 'on'):
    GPIO.output(house3, GPIO.HIGH)
  else:
    GPIO.output(house3, GPIO.LOW)

@post('/api/house4/<onoff>')
def house4post(onoff):
  if (onoff == 'on'):
    GPIO.output(house4, GPIO.HIGH)
  else:
    GPIO.output(house4, GPIO.LOW)



run(host='0.0.0.0', port=8080)
