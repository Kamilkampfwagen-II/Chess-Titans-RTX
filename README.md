# Chess Titans RTX
This is an RTX Remix mod for the Chess Titans

Constant frametime and fov patches by [Adam](https://github.com/adamplayer)

## Chess Titans RTX Launcher:
The launcher ensures that graphics level is set to 3, and disables the maximized property in case it was enabled in previous session.

The launcher is optional. Without the launcher, borderless window won't align properly.

# Installation:
1. You need x86 version of Chess Titans, the installers found online will check you cpu architecture. You'll need to manually extract them from the said installer.
2. Get the following files from the repo: `Chess-RTX.1337`, `d3d9.ini`, `dxvk.conf`, `launcher.conf`, `chess-rtx-launcher.ps1`, `start.bat` and put them into the main directory
https://github.com/Kamilkampfwagen-II/Chess-Titans-RTX
3. Patch the game with `Chess-RTX.1337` using __x32dbg__.
4. Install the latest builds of remix.
5. Rename the `d3d9.dll` to `bridge_d3d9.dll`.
6. Install the latest build of DxWrapper then rename `dxwrapper.dll` to `d3d9.dll`.
7. Open up the `launcher.conf` and set your preferences.
8. Launch the game using the `start.bat` script

:warning: The installer found online is for 64 bit, you need the 32 bit executable

:warning: Disable `Volumetric Lightning` on AMD gpus. The mods below might overwrite it!

# Try [Adam](https://github.com/adamplayer)'s mod: https://discord.com/channels/1028444667789967381/1110245358040260668/1153229638097702923 
- 3D scenes around the chess board. Sponza scene requires 8GB of vram. Includes the @tadpole3159's mod.

# Try @tadpole3159's mod: https://discord.com/channels/1028444667789967381/1110245358040260668/1147594078851190884
- Remastered materials and translucent pieces

# Wrappers Used:
- DxWrapper (not used for dx8 to 9 convertion)

# Issues & Notes:
- :no_entry_sign: Tips (pop ups) doesn't appear to be working in fullscreen
- :white_check_mark: Hashes are stable
# Fixed
- :white_check_mark: ~~Game doesn't update frames regularly~~ fixed by [Adam](https://github.com/adamplayer), huge thanks to him :heart: 
- :no_entry_sign: ~~Display driver crashes upon loading, opening remix menu, toggling options~~ Fixed on remix's side!
