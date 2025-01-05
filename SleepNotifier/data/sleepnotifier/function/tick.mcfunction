#Multiplayer Sleep Notifier for Minecraft
#Code developed by Laubfrosch49
#Copyright 2025 ©

#This file is executed every tick (1/20s)

#Check for players asleep
execute as @a unless score @s sleeping matches 0.. if predicate sleepnotifier:start_sleeping run scoreboard players set @s sleeping 0

#Announce next day
execute if score isSleeping sleepNotifier matches 1.. if predicate sleepnotifier:morning_time if score missingCount sleepNotifier matches ..0 if score isThundering sleepNotifier matches 0 run tellraw @a ["",{"text":"[SleepNotifier] ","color":"#00FFC6"},{"text":"Good morning!","color":"#f0ad27"},{"text":" ☀","color":"#ffde00"}]
execute if score isSleeping sleepNotifier matches 1.. if predicate sleepnotifier:morning_time if score missingCount sleepNotifier matches ..0 if score isThundering sleepNotifier matches 1 run tellraw @a ["",{"text":"[SleepNotifier] ","color":"#00FFC6"},{"text":"Good morning, ","color":"#f0ad27"},{"text":"the thunderstorm has passed in the meantime!","color":"#608ccf"},{"text":" ☁","color":"gray"}]

#Reset if next day
execute if score isSleeping sleepNotifier matches 1.. if predicate sleepnotifier:morning_time if score missingCount sleepNotifier matches ..0 run scoreboard players set isSleeping sleepNotifier 0
execute as @a if score @s sleeping matches 0.. if predicate sleepnotifier:morning_time if score missingCount sleepNotifier matches ..0 run scoreboard players reset @s sleeping




