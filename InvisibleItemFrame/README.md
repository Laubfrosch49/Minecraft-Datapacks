<p align="center">
  <img src="pack.png" alt="Invisible Item Frame" width="96">
</p>

# Invisible Item Frame

**Craft invisible item frames and glow item frames. Reveal them with a soul torch.**

![Minecraft](https://img.shields.io/badge/Minecraft-26.3-62b47a)
![Data pack format](https://img.shields.io/badge/data%20pack%20format-121-blue)
[![Release](https://img.shields.io/github/v/release/Laubfrosch49/Minecraft-Datapacks?filter=invisibleitemframe-v*&label=release)](https://github.com/Laubfrosch49/Minecraft-Datapacks/releases?q=invisibleitemframe)
[![License](https://img.shields.io/github/license/Laubfrosch49/Minecraft-Datapacks)](../LICENSE)

[Features](#features) · [Crafting](#crafting) · [Installation](#installation) · [Revealing frames](#revealing-frames) · [FAQ](#faq)

[Back to all datapacks](../README.md)

---

Place items on walls, in shelves or on displays without the frame around them. Invisible item frames hide the frame itself and only show the item inside.

> [!NOTE]
> This is a plain datapack. It runs on the server (or in a single-player world) and nobody needs to install anything on their client.

## Features

- **Two new recipes:** Invisible item frame and invisible glow item frame.
- **Easy ingredients:** A normal frame plus a phantom membrane.
- **Marked items:** The crafted frames have an enchantment glint and a short description in their tooltip.
- **Reveal them again:** Hold a soul torch or a soul lantern, and invisible frames nearby become visible.
- **Automatic recipe unlock:** The recipes show up in the recipe book once you carry a phantom membrane.

## Crafting

Both recipes are shapeless. Put the two ingredients anywhere in the crafting grid.

| Result | Ingredients |
| --- | --- |
| Invisible Item Frame | Item Frame + Phantom Membrane |
| Invisible Glow Item Frame | Glow Item Frame + Phantom Membrane |

The crafted item looks like a normal frame with an enchantment glint. It becomes invisible when you place it. If you break it, you get a regular frame back that is visible again.

## Revealing frames

Every 10 ticks (0.5 s) the datapack checks all players:

| Situation | Result |
| --- | --- |
| A player holds a **soul torch** or **soul lantern** in the main or off hand | Invisible frames within **5 blocks** of that player become visible and show a particle effect. |
| No such player is within 5 blocks of a revealed frame | The frame turns invisible again. |

This works for every frame placed with the recipes above, so a few blocks of light are enough to find frames you lost track of.

## Installation

Requires **Minecraft 26.3** (data pack format 121).

1. Download `InvisibleItemFrame.zip` from the [latest release](https://github.com/Laubfrosch49/Minecraft-Datapacks/releases?q=invisibleitemframe).
2. Put the zip into `<world>/datapacks`.
3. Run `/reload` or restart the server.

> [!IMPORTANT]
> Do not rename the zip. The uninstall function disables the pack as `file/InvisibleItemFrame`.

The datapack prints a short message in chat when it loads.

## Commands

The datapack adds no commands for players.

| Command | Description |
| --- | --- |
| `/function invisible_item_frame:uninstall` | Disables the datapack (operators only). |
| `/function #laubfrosch49:uninstall` | Removes all of Laubfrosch49's datapacks (operators only). |

## Uninstall

```mcfunction
/function invisible_item_frame:uninstall
```

This disables the datapack, so the recipes disappear. Frames that are already placed keep their current state. Invisible frames can then no longer be revealed, so reveal and break them first if you want them back.

## FAQ

**How do I find an invisible frame I forgot about?**
Hold a soul torch or soul lantern close to where you think it is.

**Do other players see the frames too?**
Yes. Frames are revealed for everybody within 5 blocks of a player holding a soul torch or soul lantern.

**Does a normal item frame become invisible?**
No. Only frames crafted with the recipes above are affected.

## License

[MIT](../LICENSE). This project is not affiliated with Mojang or Microsoft.
