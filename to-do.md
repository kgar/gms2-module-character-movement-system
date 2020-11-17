# To Do
- Create some lightweight scripts for NPC random movement that leverages the movement driver to set NPC state and move them around
  - Method 1: Allowed movement zone
  - Method 2: Stage spikes and grid-guided path-finding
  - Method 3: Follow the player loosely, face same direction
    - Create multiple objects that follow in this manner
  - Method 4: Lufia-style follow the player directly behind
- ...

# Refactor
- Is there a more elegant way to handle the movement code?
- Create some global variables (or scripts) which contain the sprite association for each NPC
  - Replace manual room-based instance creation with a simple function call / global variable grab that assigns all the relevant movement / sprite values

# Stretch
- Make a little port town with roads, a few houses, stuff lying around, etc. Use this as a chance to get to know room editing in GMS 2. 
- Support player character running.
  - You can swap out the RPG Maker sprite with an existing sprite that has a run animation, if you are feeling adventurous.
  - Sprite Resource has some Suikoden sprites 😲
  - Perhaps running and walking should be in the same driver, as options on the move method?
    - This would require receiving sprites for running as well.

# Thoughts
- Maybe I'll feel better when running is also integrated into the MovementDriver, but something feels a bit off.