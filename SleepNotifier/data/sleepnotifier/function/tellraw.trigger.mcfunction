#Multiplayer Sleep Notifier for Minecraft
#Code developed by Laubfrosch49
#Copyright 2025 ©

tellraw @s [{"text":"Multiplayer Sleep-Notifier Info","bold":true,"color":"#00FFC6"},"\n","\n",{"text":"At the moment, ","color":"#16e0b5","bold":false},{"score":{"name":"sleep%","objective":"sleepNotifier"},"bold":false,"color":"#df9205"},{"text":"%","bold":false,"color":"#df9205"},{"text":" of all players in the Overworld have to sleep in order to sleep through the night.","color":"#16e0b5","bold":false}]

execute unless score sleepCount sleepNotifier > playerCount sleepNotifier run tellraw @s [{"text":"According to the current player situation this would be ","color":"#16e0b5"},{"score":{"name":"sleepCount","objective":"sleepNotifier"},"bold":false,"color":"#df9205"},{"text":" player(s).","color":"#16e0b5"}]
execute if score sleepCount sleepNotifier > playerCount sleepNotifier run tellraw @s {"text":"Sleeping through the night is therefore not possible!","color":"#ff5563"}

execute unless score sleepCount sleepNotifier > playerCount sleepNotifier unless score isSleeping sleepNotifier matches 1.. run tellraw @s ["\n",{"text":"Currently ","color":"#16e0b5"},{"text":"nobody","color":"#f01468"},{"text":" is sleeping.","color":"#16e0b5"}]
execute unless score sleepCount sleepNotifier > playerCount sleepNotifier if score isSleeping sleepNotifier matches 1.. run tellraw @s ["\n",{"text":"Currently ","color":"#16e0b5"},{"score":{"name":"isSleeping","objective":"sleepNotifier"},"color":"#f01468"},{"text":"/","color":"#f01468"},{"score":{"name":"sleepCount","objective":"sleepNotifier"},"color":"#f01468"},{"text":" player(s) are asleep:","color":"#16e0b5"},"\n",{"text":"» ","color":"gray"},{"selector":"@a[scores={sleeping=1..}]","color":"#f01468"}]


execute if score @s sleep matches 1.. run tellraw @s ["\n",{"text":"[Edit SleepingPercentage]","color":"#14b18f","clickEvent":{"action":"suggest_command","value":"/gamerule playersSleepingPercentage"}}]