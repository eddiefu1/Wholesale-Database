
# database.py
# Handles all the methods interacting with the database of the application.
# Students must implement their own methods here to meet the project requirements.

import os
import pymysql.cursors
<<<<<<< HEAD
from prettytable import PrettyTable

=======
import dbmodel 
from prettytable import PrettyTable
>>>>>>> 2c97692c79373d8d6a2ae1ad6c1db324a2bef376
db_host = os.environ['DB_HOST']
db_username = os.environ['DB_USER']
db_password = os.environ['DB_PASSWORD']
db_name = os.environ['DB_NAME']


def connect():
    try:
        conn = pymysql.connect(host=db_host,
                               port=3306,
                               user=db_username,
                               password=db_password,
                               db=db_name,
                               charset="utf8mb4", cursorclass=pymysql.cursors.DictCursor)
        print("Bot connected to database {}".format(db_name))
        return conn
    except Exception as e:
        print(e)
                  
        print("Bot failed to create a connection with your database because your secret environment variables " +
              "(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME) are not set".format(db_name))
        print("\n")

# your code here
<<<<<<< HEAD

def NoEntry(message)
=======
def commandInput(message):
  data = message.split() #parses the message
  err = PrettyTable() #makes the output pretty
  err.field_name = ["Error"]
  response = None
  command = data[0]
  hasError = True
  noArg = ["Please input a statement. This command has no arguments."]
  MissArg = ["This input does not have the correct amount of arguments."]
  ManyArg = ["This input does not have the correct amount of arguments."]    
# bot commands below 

#highSale = "Highest sale for a merchandise in a store"
  if "highSale" in command: 
    #check for arguemnts store to narrow down the highest merchandise sold in a store
    #making sure that the user is typing in the right command
    if 2> len(data):
      err.add_row(MissArg) #if an argument is missing a message display missing store code
      err.add_row(["Missing <Store>"])
      hasError = True
  #if the user puts in the correct amount of data then we run the code with the correct data
    elif len(data) == 2:
      code = data[1]
      response = dbmodel.highSale(code) 
#parse through database to obtain code 
#inputs the highest sale of the store if the input is correct
    elif len(data) > 2:
      err.add_row(ManyArg)
      hasError = True

#highCustomer= "The customer that spent the most in this database from all the stores"
  elif "highestCustomer" in command: 
    if 2> len(data):
      response= dbmodel.highestCustomer(code) 
#display the highest spender in this database of so called whales of the business
  else: 
    err.add_row(noArg) #display no argu
    hasError = True
 
#totalMerchandise= "The highest selling merchandise a single store sells"
  if "totalMerchandise" in command:
    if 2 > len(data):
        err.add_row()
        err.add_row(["Missing <store>"])
        hasError = True
    else:
        store = data[1]
        if len(data) > 2:
          for x in range(2, len(data)):
            store = store + " " + data[x]
        response =  dbmodel.totalMerchandise(store)

      #storeOrigin= "Where the store came from"
  elif "storeOrigin" in command:      
    if 2> len(data):
        err.add_row()
        err.add_row(["Missing <store>"])
        hasError = True
    else:
        store_Origin = data[1]
        for x in range(2, len(data)):
            store_Origin = store_Origin + " " + data[x]
        response = storeOrigin(store_Origin.lower())
#highPricedMerchandise= "The items that have stores over 100 dollars are"
  if "highPricedMerchandise" in command:
    if 2> len(data):
        response =  dbmodel.highPricedMerchandise(data)
    else:
      err.add_row(noArg)
      hasError = True
#itemRestriction= "The item that require the customer to be 21 or older"
    if "itemRestriction" in command:
      if 2>len(data):
        response =  dbmodel.itemRestriction(data)
      else: 
        err.add_row(noArg)
        hasError = True
#employeeRole = "The title of the employee is "
    if "employeeRole" in command:
      if 2 > len(data):
        err.add_row()
        err.add_row(["Missing <eid>"])
        hasError = True
      else:
        role = data[1]
        if len(data) > 2:
          for x in range(2, len(data)):
            role = role + " " + data[x]
        response =  dbmodel.employeeRole(role)
#merchandiseOrigin= "This merchandise came from "
 
  if "merchandiseOrigin" in command:
    if 2 > len(data):
        err.add_row()
        err.add_row(["Missing <barcode>"])
        hasError = True
    else:
        Merchandise = data[1]
        if len(data) > 2:
          for x in range(2, len(data)):
            Merchandise = Merchandise + " is from " + data[x]
        response =  dbmodel.merchandiseOrigin(barcode)

#totalSale= "The total sale of this store is " 
  if "totalSale" in command:
    if 2 > len(data):
        err.add_row()
        err.add_row(["Missing <store>"])
        hasError = True
    else:
     totalStoreSale = data[1]
    if len(data) > 2:
        for x in range(2, len(data)):
          totalStoreSale = totalStoreSale + "of this store is " + data[x]
    response = dbmodel.totalSale(store)
>>>>>>> 2c97692c79373d8d6a2ae1ad6c1db324a2bef376

