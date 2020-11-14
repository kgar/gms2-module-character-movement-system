# Making a Movement Driver

I started extracting movement / sprite management from the player object into a driver. The goal is to be able to reuse this driver for NPCs, monsters, objects, and the player alike. In fact, I want the player to have two copies of the driver, one for walking and one for running.

Currently, it supports the sprite standing completely still when not moving, and then animating across its chosen sprite when moving. I guess it depends on the game, but idle animations may need some special consideration. Would idle animation be a part of a movement driver?