import datetime
import pyrebase
import random as rnd
from time import sleep

config = {
  "apiKey": "AlzaSyCrqU73UvQpYWQ4L2PoC1_oM-Nwzep31U0",
  "authDomain": "advancedagvdatabase.firebaseapp.com",
  "databaseURL": "https://advancedagvdatabase.firebaseio.com/",
  "storageBucket": "advancedagvdatabase.projectID.appspot.com"
}

print("Setting up connection")

firebase = pyrebase.initialize_app(config)
database = firebase.database()

print("Done. Database Successfully connected.")
print("Starting to send random dummy temperature data now.")

def update_agv(number):
  temperature = rnd.randint(25,45)
  voltage = rnd.uniform(24.0,25.0)
  timestamp = "{:%Y-%m-%d %H:%M:%S}".format(datetime.datetime.now())
  data = {"name": "agv_%s" % number,
          "temperature": temperature,
          "voltage": voltage,
          "timestamp": timestamp}
  database.child("agv_%s" % number).set(data)
  print("Pushed data for agv_%s to database." % number)
  

i = 0
while i < 10:
  update_agv(1)
  update_agv(2)
  update_agv(3)
  update_agv(4)
  i += 1
  sleep(5)
  
print("Done with script.")
