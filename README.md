# Survivants Prototype

Minimal Godot 4 project sketch for the "Survivants" roguelite deckbuilder.

## Contents
- `scenes/Main.tscn` – starting scene
- `scripts/Main.gd` – demonstrates resource production and survivor recruitment
- `scripts/Card.gd`, `scripts/Building.gd`, `scripts/Survivor.gd`, `scripts/RunManager.gd` – placeholder resources for core systems

## Running
To launch the project directly:

- On Linux/macOS run `./start.sh`
- On Windows run `start.bat`

Both scripts expect `godot4` to be available in your `PATH`. You can also open the folder in the Godot editor or run `godot4 --path .` manually.

The `resources/` folder contains early examples of cards, buildings, and a survivor to begin expanding the game's content.

### Current Features

- Unlock buildings in a fixed order and generate food or materials each turn.
- Spend materials to upgrade buildings for better production.
- Recruit random survivors by spending food.
