<p align="center">
  <img src="pack.png" alt="Sleep Notifier" width="96">
</p>

# Sleep Notifier

**Everyone knows who is in bed and how many players are still missing.**

![Minecraft](https://img.shields.io/badge/Minecraft-26.3-62b47a)
![Data pack format](https://img.shields.io/badge/data%20pack%20format-121-blue)
[![Release](https://img.shields.io/github/v/release/Laubfrosch49/Minecraft-Datapacks?filter=sleepnotifier-v*&label=release)](https://github.com/Laubfrosch49/Minecraft-Datapacks/releases?q=sleepnotifier)
[![License](https://img.shields.io/github/license/Laubfrosch49/Minecraft-Datapacks)](../LICENSE)

[Features](#features) · [How it works](#how-it-works) · [Installation](#installation) · [Commands](#commands) · [Configuration](#configuration) · [FAQ](#faq)

[Back to all datapacks](../README.md)

---

On multiplayer servers the `playersSleepingPercentage` rule lets a share of the players skip the night, but vanilla never tells anyone how many are still needed. Sleep Notifier announces every bed interaction in chat and counts the missing players for you.

> [!NOTE]
> This is a plain datapack. It runs on the server (or in a single-player world) and nobody needs to install anything on their client.

## Features

- **Bed announcements:** Chat message when a player falls asleep, including how many more players are needed.
- **Dream tracking:** A message when someone leaves the bed again, and whether enough players are still asleep.
- **Good morning message:** Sent when the night was skipped. A different variant tells you when a thunderstorm passed in the meantime.
- **Follows the game rule:** The needed player count is calculated from the current sleeping percentage and always rounded up, with a minimum of one player.
- **Info command:** `/trigger sleep` shows the current percentage, the needed number of players and who is asleep. No operator rights needed.
- **Own advancement tab:** Shows the datapack and its version under *Laubfrosch49's Datapacks > Utility Datapacks*.

## How it works

The datapack checks every 10 ticks (0.5 s) how many players are in the Overworld and how many of them are in bed. The needed number is `players * percentage / 100`, rounded up.

| Event | Message in chat |
| --- | --- |
| A player falls asleep, more are needed | `<player> is now asleep. N more players are needed!` |
| A player falls asleep, exactly one more is needed | `<player> is now asleep. 1 more player is needed!` |
| A player falls asleep, enough are in bed | `<player> is now asleep. Sweet Dreams!` |
| A player leaves the bed, more are needed again | `<player> has finished dreaming. N more players are needed again!` |
| A player leaves the bed, still enough asleep | `<player> has finished dreaming. There are still enough players sleeping!` |
| The night is skipped | `Good morning!` |
| The night is skipped, a thunderstorm ended | `Good morning, the thunderstorm has passed in the meantime!` |

Only players in the Overworld are counted.

> [!NOTE]
> If the sleeping percentage asks for more players than are online (for example above 100 %), the player who tries to sleep gets a private message that sleeping through the night is impossible.

## Installation

Requires **Minecraft 26.3** (data pack format 121).

1. Download `SleepNotifier.zip` from the [latest release](https://github.com/Laubfrosch49/Minecraft-Datapacks/releases?q=sleepnotifier).
2. Put the zip into `<world>/datapacks`.
3. Run `/reload` or restart the server.

> [!IMPORTANT]
> Do not rename the zip. The uninstall function disables the pack as `file/SleepNotifier`.

## Commands

| Command | Description |
| --- | --- |
| `/trigger sleep` | Shows the sleeping percentage, the needed player count, how many players are asleep and their names. |
| `/function sleepnotifier:uninstall` | Removes the datapack (operators only). |
| `/function #laubfrosch49:uninstall` | Removes all of Laubfrosch49's datapacks (operators only). |

The info output contains a clickable **[Edit SleepingPercentage]** button. It puts `/gamerule minecraft:players_sleeping_percentage` into the chat box. Changing the game rule itself needs operator rights.

## Configuration

There is no config file. The datapack reads the vanilla game rule:

| Game rule | Default | Meaning |
| --- | --- | --- |
| `minecraft:players_sleeping_percentage` | `100` | Share of players that has to sleep to skip the night. |

```mcfunction
/gamerule minecraft:players_sleeping_percentage 50
```

The numbers update within half a second.

### Scoreboard objectives

| Objective | Type | Purpose |
| --- | --- | --- |
| `sleep` | trigger | Used by `/trigger sleep`. |
| `sleeping` | dummy | Marks players that are currently in bed. |
| `sleepNotifier` | dummy | Holds the calculated values (player count, needed count, and so on). |

## Uninstall

```mcfunction
/function sleepnotifier:uninstall
```

This removes the `sleepNotifier` and `sleep` objectives, cancels the scheduled check and disables the datapack.

## FAQ

**Does it change how sleeping works?**
No. It only reads the game state and prints messages. Skipping the night is still done by vanilla.

**Why does it say the beds are cursed?**
The sleeping percentage needs more players than are online. Lower the game rule.

**Players in the Nether or End do not show up in the count.**
Correct. The datapack only counts players in the Overworld.

**Can I turn the messages off for myself?**
Not individually. Disable the datapack with `/datapack disable "file/SleepNotifier"`.

## License

[MIT](../LICENSE). This project is not affiliated with Mojang or Microsoft.
