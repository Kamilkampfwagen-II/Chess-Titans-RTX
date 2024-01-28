# Chess Titans RTX
Constant frametime and fov patches by [Adam](https://github.com/adamplayer)

## Chess Titans RTX ASI:
An ASI mod for use with RTX Remix that lifts the need for both dxwrapper and the old launcher script:
- Applies [Adam](https://github.com/adamplayer) patches at runtime. This should resolve issues when it is done ahead of time.
- Can adjust camera fov and altitude. All credits to [Adam](https://github.com/adamplayer).
- Makes sure you can't mess up settings.
- Makes sure you can't maximize the game window which triggers a weird regression.
- Borderless fullscreen, can be disabled.
### DISCLAIMER:
*An ASI mod is a compiled DLL file. It's important to understand that you are using it at your own risk. Before letting the game load this mod, please make sure you trust the source. I encourage you to review its source code to verify its safety and functionality.*

ChatGPT

## Installation:
1. You need x86 version of Chess Titans, the installers found online will check you cpu architecture. You'll need to manually extract x86 binaries from the said installer.
2. Download the [latest release](https://github.com/Kamilkampfwagen-II/Chess-Titans-RTX/releases/latest) and extract all near the `chess.exe`.
3. Install the latest build of remix.

:information_source: Open up the `chess_titans_rtx.conf` to tweak the asi mod settings.

:warning: Disable `Volumetric Lightning` on RDNA 2 gpus. The mods below might overwrite it!

## Mods by the Community:
### @tadpole3159: https://discord.com/channels/1028444667789967381/1110245358040260668/1199087424794546256
- Remastered materials and translucent pieces

## Issues & Notes:
- :no_entry_sign: Tips (pop ups) doesn't appear to be working in fullscreen
- :white_check_mark: Hashes are stable
### Fixed
- :white_check_mark: ~~Game doesn't update frames regularly~~ fixed by [Adam](https://github.com/adamplayer), huge thanks to him :heart: