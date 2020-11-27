# To Do
- Implement motion planning demo room
  - Rework the responsibilities of the grid and paths
    - A room controller should have the grid
      - Clean up grid on Room End
    - Instances should each have their own paths as needed
      - Clean up path on Clean Up
  - For any NPC who is walking a path, add eventing for detecting a collision with obj_solid and set current path position to previous
  - Upgrade collision management to include some optional handlers for a collision
    - Default: Wait for obstacle to move
    - Wait for a random period of time and then reroute
    - Reroute immediately
    - Wait for a random period and then enable pass-through 
  - Using a sequential state machine, ensure 
    - the NPC reroutes when encountering a collision
    - the NPC does not overlap with a collision place
  - Determine what will happen if the NPC is placed off-grid at first
  - Put the obj_player on the screen and try to break the path-finding code
- Return to the main demo room with that new knowledge!
- Implement "Go to Waypoint" AI action
- Implement a sequential NPC script consisting of waiting around, going to various waypoints, facing directions, etc.
- Implement Passerby AI
- Implement AI to Follow the player loosely, face same direction
  - Create multiple objects that follow in this manner
- Implement Lufia-style AI to follow the player directly behind
- ...

# Refine
- Tweak the bumbler ai scripts
  - Move less quickly
  - Move less distance overall
  - Increase the minimum wait-around time
  - Create script for generating zones from x/y values relative to an object
    - Init another NPC with a zone created in this way
  - Figure out why one of the NPCs is animating seemingly way faster when walking up


# Refactor
- There is a `direction` instance variable built right in. Update the movement code to rely on this field.
  - Determine sprite orientation based on direction range
    - Right: 306-45
    - Up: 46-135
    - Left: 136-225
    - Down: 226-305 
- Remove default state machine of stand_still and have all default NPCs face down on creation.
- Reduce the variable surface area used by any scripts that set instance variables on the fly.
  - Consider using a struct per state
  - Consider prepending the struct name with the particular script set, such as ai_bumbler_WalkParams, ai_bumbler_MoveParams
- Is there a more elegant way to handle the movement code?
- Create some global variables (or scripts) which contain the sprite association for each NPC
  - Replace manual room-based instance creation with a simple function call / global variable grab that assigns all the relevant movement / sprite values
- MovementDriver as a struct factory is probably a mistake, given the experience with place_meeting and with how much easier direct script calls are. Given that there is some kind of mixin capability with regular scripts, consider a similar approach. 

# Stretch
- Make a little port town with roads, a few houses, stuff lying around, etc. Use this as a chance to get to know room editing in GMS 2. 
- Support player character running.
  - You can swap out the RPG Maker sprite with an existing sprite that has a run animation, if you are feeling adventurous.
  - Sprite Resource has some Suikoden sprites 😲
  - Perhaps running and walking should be in the same driver, as options on the move method?
    - This would require receiving sprites for running as well.

# Thoughts
- Maybe I'll feel better when running is also integrated into the MovementDriver, but something feels a bit off.