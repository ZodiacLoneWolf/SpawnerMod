# SpawnerMod V1.5 🛠️📦

[![Mod Status](https://img.shields.io/badge/status-active-brightgreen)](https://github.com/ZodiacLoneWolf/SpawnerMod)
[![UE4SS Version](https://img.shields.io/badge/UE4SS-experimental-blue)](https://github.com/UE4SS/UE4SS)

## Description

**SpawnerMod** for *Drive Beyond Horizons* provides a simple **in-game spawn menu** that allows you to quickly add items directly into your world using an interactive UI.  
Version **1.5** introduces several functional improvements and usability fixes.

## Requirements

- ✅ **UE4SS** (Latest Experimental Build)  
  [Get it here](https://github.com/UE4SS/UE4SS)

## Installation

1. Ensure **UE4SS Experimental** is installed in your game directory.
2. Place `main.lua` into: <YourGameDirectory>/DriveBeyondHorizons/Binaries/Win64/Mods/SpawnerMod/Scripts/
3. Open `Mods.txt` located at: <YourGameDirectory>/DriveBeyondHorizons/Binaries/Win64/Mods/Mods.txt
4. Add the following line to **Mods.txt**: SpawnerMod : 1
5. Save the file and launch the game.

## How to Use
1. Once fully loaded into the game press the DELETE key to open the SpawnerMenu. 

- Note 1: If you spawn an item, it will automatically close. This is it's native/intended function.
- Note 2: If you only open the menu but do not spawn an item nor click the "Close" UI button proceed to step 2. Else, move to step 3.

2. Press DELETE again to close the SpawnerMenu provided you have not self-closed it by spawning an item or pressed the "close" button on the UI.

3. If the SpawnerMenu self-closed because you spawned an item or triggered the "Close" UI button...
 -  Press the END key, followed by a left click to restore your controls and hide the cursor.
 -  Note 1: This triggers a clean-up on the backend. Needed as we cannot hook it's native close operation at this time.

## Known Issues

- **World Leak on Exit Game**  
    *Exiting the game causes a **UE crash** due to an unresolved **World leak**.  
 This cannot be resolved currently due to UE4SS and engine limitations.
- **DELETE Key Non-Responsive Sometimes**  
    *Occasionally requires pressing **DELETE twice** after spawning to reopen the menu.  
 This does not affect functionality but is caused by sequence timing.
- **Spawner Always Closes After Spawning One Item**  
    * _This is **intentional** by design._  
 No current workaround exists without risking further instability.
- **Missing Items in Menu**  
    *Only includes items **provided by the game's built-in debug spawner**.  
 Manual spawn commands may work for missing items, but they are not supported in this release.
- **Debug Menu Not Included**  
    *The **parent debug menu** will not be released unless **official developer approval** is granted.  
 This decision is based on maintaining game and community health.

## 🛠️ Fixes in V1.5

- Mouse cursor **now locks properly** when using the menu (no need to open the console).
- **Widget instances** are now correctly **tracked and destroyed**, preventing lockout loops.
- Restores player control more reliably by **working around blocked engine functionality**.

## Credits

- Developed by **Zodiac**



