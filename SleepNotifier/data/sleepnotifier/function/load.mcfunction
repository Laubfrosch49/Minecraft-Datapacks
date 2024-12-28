#Multiplayer Sleep Notifier for Minecraft
#Code developed by Laubfrosch49
#Copyright 2025 ©

#This file is executed every reload

#Loads the datapack
scoreboard objectives add sleep trigger
scoreboard objectives add sleeping dummy
scoreboard objectives add sleepNotifier dummy

scoreboard players set #100 sleepNotifier 100

# Broadcast
tellraw @a ["",{"text":"» ","color":"gray"},{"text":"Loading ","color":"#16e0b5"},{"text":"Sleep-Notifier ","bold":true,"color":"#00FFC6"},{"text":"Datapack by ","color":"#16e0b5"},{"text":"Laubfrosch49","color":"#15db40"}]

#Run sleepnotifier:slowtick
function sleepnotifier:slowtick