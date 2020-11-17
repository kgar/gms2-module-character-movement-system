# Scripting NPC Behavior - The Waypointer

On a dedicated room layer, set some named waypoints. Have the NPC go from one waypoint to another, taking actions at each waypoint, even if the action is to face a direction for a moment, or to wait in place. The logic should be:
- Decide where to go
- Create a path to destination
- Try follow path until arrived
- Take optional action(s) at destination
- Repeat

## Decide where to go

**Condition**: State is Deciding

**Actions to take**:  
- Wait arbitrarily for a random value within a parameterized min/max range
- Fetch the next waypoint
  - Circular buffer on length of waypoints array, coalesce to 0
- Transition to next

**Transition actions**:  
- Clear wait timer
- Set state to CreatePath

## Create a path to destination

**Condition**: State is CreatePath

**Actions to take**:
- Create a path to destination using some form of path-finding, targeting the selected waypoint
- Transition to FollowPath

## Try follow path until arrived

**Condition**: State is FollowPath

**Actions to take**:
- Try to move character in the target direction, with the character animating appropriately
  - If collision detected and timer is undefined, set collision wait timer for a random value between 30-120 frames
  - If collision detected and timer exists, increment timer and exit
  - If no collision detected, move by specified speed
- If the character has arrive, transition to TakeActionAtDestination

**Transition actions**:  
- Clear any variables
- Set state to TakeActionAtDestination

## Take optional action(s) at destination

**Condition**: State is TakeActionAtDestination

**Actions to take**:  
- If the actions array is undefined or has 0 length, transition to Deciding
- If the index is undefined, set to 0
- If the current action is undefined, get current action based on index
- Run action and capture resulting state
- If resulting state is Active, exit
- If the resulting state is Complete, increment the index
- If the index is beyond the final index of the array, transition to Deciding