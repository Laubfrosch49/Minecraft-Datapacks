#Multiplayer Sleep Notifier for Minecraft
#Code developed by Laubfrosch49
#Copyright 2025 ©

#This file is executed every 10 ticks
schedule function sleepnotifier:slowtick 10t

#Get playersSleepingPercentage from the gamerule 
execute store result score sleep% sleepNotifier run gamerule playersSleepingPercentage

#Get Player Info
execute in minecraft:overworld store result score playerCount sleepNotifier if entity @a[distance=0..]
execute store result score isSleeping sleepNotifier if entity @a[scores={sleeping=0..}]

execute as @a at @s if score @s sleeping matches 1 if predicate sleepnotifier:not_sleeping run scoreboard players remove isSleeping sleepNotifier 1

#Calculate sleepCount
scoreboard players operation sleepCount sleepNotifier = sleep% sleepNotifier
scoreboard players operation sleepCount sleepNotifier *= playerCount sleepNotifier
scoreboard players operation #sleepNotifierR% sleepNotifier = sleepCount sleepNotifier
scoreboard players operation sleepCount sleepNotifier /= #100 sleepNotifier
scoreboard players operation #sleepNotifierR% sleepNotifier %= #100 sleepNotifier
execute if score #sleepNotifierR% sleepNotifier matches 1.. run scoreboard players add sleepCount sleepNotifier 1
execute if score sleepCount sleepNotifier matches 0 run scoreboard players add sleepCount sleepNotifier 1

#Calculate Missing Players
scoreboard players operation missingCount sleepNotifier = sleepCount sleepNotifier
scoreboard players operation missingCount sleepNotifier -= isSleeping sleepNotifier

#Thunder Check
execute if score isSleeping sleepNotifier matches 0.. if predicate sleepnotifier:thundering run scoreboard players set isThundering sleepNotifier 1
execute if score isSleeping sleepNotifier matches 0.. unless predicate sleepnotifier:thundering run scoreboard players set isThundering sleepNotifier 0

#Announce Bed Interactions
execute if score sleepCount sleepNotifier > playerCount sleepNotifier as @a at @s if score @s sleeping matches 0 unless score @s sleeping matches 2.. run tellraw @s ["",{"text":"[SleepNotifier] ","color":"#00FFC6"},{"selector":"@s"},{"text":", the beds have been cursed, it is impossible to fall asleep.","color":"#915BFF"}]

execute unless score sleepCount sleepNotifier > playerCount sleepNotifier as @a at @s if score @s sleeping matches 0 if score missingCount sleepNotifier matches 2.. unless score @s sleeping matches 2.. run tellraw @a ["",{"text":"[SleepNotifier] ","color":"#00FFC6"},{"selector":"@s"},{"text":" is now asleep. ","color":"blue"},{"score":{"name":"missingCount","objective":"sleepNotifier"},"bold":true,"color":"#f01468"},{"text":" more players are needed!","color":"#915BFF"}]
execute unless score sleepCount sleepNotifier > playerCount sleepNotifier as @a at @s if score @s sleeping matches 0 if score missingCount sleepNotifier matches 1 unless score @s sleeping matches 2.. run tellraw @a ["",{"text":"[SleepNotifier] ","color":"#00FFC6"},{"selector":"@s"},{"text":" is now asleep. ","color":"blue"},{"score":{"name":"missingCount","objective":"sleepNotifier"},"bold":true,"color":"#f01468"},{"text":" more player is needed!","color":"#915BFF"}]
execute unless score sleepCount sleepNotifier > playerCount sleepNotifier as @a at @s if score @s sleeping matches 0 if score missingCount sleepNotifier matches ..0 unless score @s sleeping matches 2.. run tellraw @a ["",{"text":"[SleepNotifier] ","color":"#00FFC6"},{"selector":"@s"},{"text":" is now asleep.","color":"blue"},{"text":" Sweet Dreams!","color":"#915BFF"}]

execute unless score sleepCount sleepNotifier > playerCount sleepNotifier as @a at @s if score @s sleeping matches 1 if predicate sleepnotifier:not_sleeping if score missingCount sleepNotifier matches 2.. run tellraw @a ["",{"text":"[SleepNotifier] ","color":"#00FFC6"},{"selector":"@s"},{"text":" has finished dreaming. ","color":"blue"},{"score":{"name":"missingCount","objective":"sleepNotifier"},"bold":true,"color":"#f01468"},{"text":" more players are needed again!","color":"#915BFF"}]
execute unless score sleepCount sleepNotifier > playerCount sleepNotifier as @a at @s if score @s sleeping matches 1 if predicate sleepnotifier:not_sleeping if score missingCount sleepNotifier matches 1 run tellraw @a ["",{"text":"[SleepNotifier] ","color":"#00FFC6"},{"selector":"@s"},{"text":" has finished dreaming. ","color":"blue"},{"score":{"name":"missingCount","objective":"sleepNotifier"},"bold":true,"color":"#f01468"},{"text":" more player is needed again!","color":"#915BFF"}]
execute unless score sleepCount sleepNotifier > playerCount sleepNotifier as @a at @s if score @s sleeping matches 1 if predicate sleepnotifier:not_sleeping if score missingCount sleepNotifier matches ..0 run tellraw @a ["",{"text":"[SleepNotifier] ","color":"#00FFC6"},{"selector":"@s"},{"text":" has finished dreaming. ","color":"blue"},{"text":"There are still enough players sleeping!","color":"#915BFF"}]

execute as @a[scores={sleeping=0..}] if predicate sleepnotifier:not_sleeping run scoreboard players reset @s sleeping
execute as @a[scores={sleeping=0}] run scoreboard players set @s sleeping 1

#Trigger
scoreboard players enable @a sleep
execute as @a if score @s sleep matches 1.. run function sleepnotifier:tellraw.trigger
scoreboard players reset @a[scores={sleep=1..}] sleep

