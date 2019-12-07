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
GPIO.output(house2, GPIO.HIGH)
GPIO.output(house3, GPIO.HIGH)
GPIO.output(comcen, GPIO.HIGH)
time.sleep(1)
print "LED off"
GPIO.output(house1, GPIO.LOW)
GPIO.output(house2, GPIO.LOW)
GPIO.output(house3, GPIO.LOW)
GPIO.output(comcen, GPIO.LOW)


from bottle import route, run, template, post, get

@route('/')
def home():
  return template('home')

@route('/main')
def home():
  return template('main')

@route('/styles.css')
def home():
  return template('styles')

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

@post('/api/comcen/<onoff>')
def comcenpost(onoff):
  if (onoff == 'on'):
    GPIO.output(comcen, GPIO.HIGH)
  else:
    GPIO.output(comcen, GPIO.LOW)



run(host='0.0.0.0', port=8080)
