#Invisible Item Frame for Minecraft
#Code developed by Laubfrosch49
#Copyright 2025 ©

#This file is executed every reload

# Broadcast
tellraw @a ["",{"text":"» ","color":"gray"},{"text":"Loading ","color":"#16e0b5"},{"text":"Invisible-Item-Frame ","bold":true,"color":"#00FFC6"},{"text":"Datapack by ","color":"#16e0b5"},{"text":"Laubfrosch49","color":"#15db40"}]
tellraw @a ["",{"text":"» ","color":"gray"},{"text":"2","color":"#f35050","bold": true},{"text":" new Crafting-Recipes loaded: ","color":"#f35050"},{"text":"Invisible ","color":"#FFC246"},{"translate":"item.minecraft.item_frame","color":"#FFC246"},{"text":", ","color":"#16e0b5"},{"text":"Invisible ","color":"#FFC246"},{"translate":"item.minecraft.glow_item_frame","color":"#FFC246"}]

# Starting Slowtick
function invisible_item_frame:slowtick