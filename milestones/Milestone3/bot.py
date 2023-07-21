
# bot.py
# This file is intended to be a "getting started" code example for students.
# The code in this file is fully functional.
# Students are free to edit the code in the milestone 3 folder.
# Students are NOT allowed to distribute this code without the express permission of the class instructor
# IMPORTANT: How to set your secret environment variables? read README guidelines.

# imports
import os
import discord
import database as db
<<<<<<< HEAD
from discord.ext import commands
from dotenv import load_dotenv
=======
import dbmodel 

>>>>>>> 2c97692c79373d8d6a2ae1ad6c1db324a2bef376
# environment variables
token = os.environ['DISCORD_TOKEN']
server = os.environ['DISCORD_GUILD']


# database connection
# secret keys related to your database must be updated. Otherwise, it won't work
db_conn = db.connect()

# bot events
client = discord.Client(intents=discord.Intents.default())


@client.event
async def on_ready():
  """
    This method triggers with the bot connects to the server
    Note that the sample implementation here only prints the
    welcome message on the IDE console, not on Discord
    :return: VOID
    """
  print("{} has joined the server".format(client.user.name))


@client.event
async def on_message(message):
  """
    This method triggers when a user sends a message in any of your Discord server channels
    :param message: the message from the user. Note that this message is passed automatically by the Discord API
    :return: VOID
    """
  response = None  # will save the response from the bot
  if message.author == client.user:
    return  # the message was sent by the bot
  if message.type is discord.MessageType.new_member:
    response = "Welcome {}".format(
      message.author)  # a new member joined the server. Welcome him.
  else:
    # A message was send by the user.
    msg = message.content.lower()
    if "milestone3" in msg:
      response = "I am alive. Signed: 'your bot'"
  if response:
    # bot sends response to the Discord API and the response is show
    # on the channel from your Discord server that triggered this method.
    embed = discord.Embed(description=response)
    await message.channel.send(embed=embed)


try:
  # start the bot and keep the above methods listening for new events
  client.run(token)
except:
  print(
    "Bot is offline because your secret environment variables are not set. Head to the left panel, "
    +
    "find the lock icon, and set your environment variables. For more details, read the README file in your "
    + "milestone 3 repository")

<<<<<<< HEAD
bot = commands.Bot(command_prefix= '/')


  
    #totalMerchandise= "The highest selling merchandise a single store sells"
    #storeOrigin= "The store came from"
    #highPricedMerchandise= "The items that have stores over 100 dollars are"
    #itemRestriction= "The item that require the customer to be 21 or older"
    #employeeRole = "The title of the employee is "
    #merchandiseOrigin= "This merchandise came from "
    #totalSale= "The total sale of this store is " 

@bot.command()
    #highSale= "The highest gross sale for a merchandise"
async def highSale(item):
    highSale = item[0]
    for x in item:
            if x>max:
                max = x
    return max
    
    item = [128.00,50.20,60.30]
    print("The highest gross sale for a merchandise is ", item)

@bot.command()
  #highCustomer= "The customer that spent the most"
async def highCustomer(store):
    

=======
>>>>>>> 2c97692c79373d8d6a2ae1ad6c1db324a2bef376
