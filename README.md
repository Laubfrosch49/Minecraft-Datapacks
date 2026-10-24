<p align="center">
  <img src="SleepNotifier/pack.png" alt="Laubfrosch49's Datapacks" width="96">
</p>

# Laubfrosch49's Datapacks

**Small vanilla datapacks for survival multiplayer. No mods, no client installation.**

![Minecraft](https://img.shields.io/badge/Minecraft-26.3-62b47a)
![Data pack format](https://img.shields.io/badge/data%20pack%20format-121-blue)
[![License](https://img.shields.io/github/license/Laubfrosch49/Minecraft-Datapacks)](LICENSE)

[Datapacks](#datapacks) · [Installation](#installation) · [Uninstall](#uninstall) · [Releases](#releases)

---

## Datapacks

| Datapack | What it does | Docs | Download |
| --- | --- | --- | --- |
| **Sleep Notifier** | Tells everyone in chat when a player goes to bed and how many more are needed to skip the night. | [README](SleepNotifier/README.md) | [Latest release](https://github.com/Laubfrosch49/Minecraft-Datapacks/releases?q=sleepnotifier) |
| **Invisible Item Frame** | Adds crafting recipes for invisible item frames and glow item frames. Soul torches reveal them again. | [README](InvisibleItemFrame/README.md) | [Latest release](https://github.com/Laubfrosch49/Minecraft-Datapacks/releases?q=invisibleitemframe) |

Both datapacks target **Minecraft 26.3** (data pack format 121).

## Installation

1. Download the `.zip` of the datapack from its release. Do not unpack it and do not rename it.
2. Put the `.zip` into the `datapacks` folder of your world (`<world>/datapacks`). On a server this is the same folder inside the world directory.
3. Run `/reload` in the world or restart the server.

> [!IMPORTANT]
> Keep the file name exactly as it is (`SleepNotifier.zip`, `InvisibleItemFrame.zip`). The uninstall function disables the pack by that name.

## Uninstall

Every datapack registers itself in a shared uninstall tag. This removes all of them at once:

```mcfunction
/function #laubfrosch49:uninstall
```

To remove a single datapack, run its own function, for example `/function sleepnotifier:uninstall`. The datapack-specific READMEs list what each one cleans up.

## Releases

Each datapack is versioned on its own. Pushing a tag on `main` builds the zip and publishes a release automatically:

| Tag | Release |
| --- | --- |
| `sleepnotifier-v<version>` | `SleepNotifier.zip` |
| `invisibleitemframe-v<version>` | `InvisibleItemFrame.zip` |

The version from the tag is written into the pack description and the advancement text of the zip.

## License

[MIT](LICENSE). This project is not affiliated with Mojang or Microsoft.
