# Making a Movement Driver

I started extracting movement / sprite management from the player object into a driver. The goal is to be able to reuse this driver for NPCs, monsters, objects, and the player alike. In fact, I want the player to have two copies of the driver, one for walking and one for running.

Currently, it supports the sprite standing completely still when not moving, and then animating across its chosen sprite when moving. I guess it depends on the game, but idle animations may need some special consideration. 

## Idle animation?

Would idle animation be a part of a movement driver?

Option 1: Yes. 
For the main character, idle animation would be several frames, for things like breathing.
For more random things like blinking, there would need to be some separate process handling that.

Current thought about Option 1: Not really the best use of the driver. It sorta pollutes it.

Option 2: No.
The main character's idle animation would be specially coded in the player object or somewhere similar.
It would kick in if the player were stopped.

Current thought about option 2: 👍

## Actual X/Y adjustments and collision detection in driver?

I'm trying to move as much as I can into the driver so that it can be reused. With that said, should the actual X/Y movement be extracted into there?

Option 1: Yes

Moving X/Y movement and collision detection into the driver is likely a good choice. Further, I could add options like "through" boolean, which would allow for forcing an entity to pass through and ignore collision detection.

This type of setup could still be leveraged by a cutscene object, because the cutscene would control how far the object is moving during each step. The movement driver would simply respect collision detection and sprite choices.

Current thought about Option 1: I'd like to try this approach out.

Option 2: No

