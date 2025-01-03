#Invisible Item Frame for Minecraft
#Code developed by Laubfrosch49
#Copyright 2025 ©

#This file is executed every 10 ticks
schedule function invisible_item_frame:slowtick 10t

#Grant recipe
execute as @a[nbt={Inventory:[{id:"minecraft:phantom_membrane"}]}] run recipe give @s crafting:invisible_item_frame
execute as @a[nbt={Inventory:[{id:"minecraft:phantom_membrane"}]}] run recipe give @s crafting:invisible_glow_item_frame

#Make visible
execute as @a at @s unless entity @a[nbt=!{SelectedItem:{id:"minecraft:soul_torch"}},nbt=!{Inventory:[{Slot:-106b,id:"minecraft:soul_torch"}]},nbt=!{SelectedItem:{id:"minecraft:soul_lantern"}},nbt=!{Inventory:[{Slot:-106b,id:"minecraft:soul_lantern"}]}] as @e[tag=InvisibleItemFrame,nbt={Invisible:1b}, distance=..5] at @s run particle minecraft:effect ~ ~ ~ 0.2 0.2 0.2 1 10 force @a
execute as @a at @s unless entity @a[nbt=!{SelectedItem:{id:"minecraft:soul_torch"}},nbt=!{Inventory:[{Slot:-106b,id:"minecraft:soul_torch"}]},nbt=!{SelectedItem:{id:"minecraft:soul_lantern"}},nbt=!{Inventory:[{Slot:-106b,id:"minecraft:soul_lantern"}]}] as @e[tag=InvisibleItemFrame,nbt={Invisible:1b}, distance=..5] run data modify entity @s Invisible set value 0b


#Make invisible again
execute as @e[tag=InvisibleItemFrame,nbt={Invisible:0b}] at @s unless entity @a[nbt={SelectedItem:{id:"minecraft:soul_torch"}},distance=..5] unless entity @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:soul_torch"}]},distance=..5] unless entity @a[nbt={SelectedItem:{id:"minecraft:soul_lantern"}},distance=..5] unless entity @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:soul_lantern"}]},distance=..5] run data modify entity @s Invisible set value 1b