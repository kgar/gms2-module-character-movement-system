# Scripting NPC Behavior - The Bumbler

Select a zone; it can be a zone of any shape.  
Given an NPC within that zone, it should cycle through these states
- Decide where to go
- Go to intended location
- (Conditional) Give up on location if collision remains constant after roughly 1 second


## Deciding Where to Go

**Condition**: State is Deciding  

**Actions to take**:  
- Compare the decision timer to current wait time
  - If decision timer is undefined, assign it a random value between 30 and 120 frames
  - If decision timer has value, and it is greater than the current wait time, then increment current wait time and exit
  - If decision timer has value, and it is less than or equal to the current wait time, transition to Calculating

**Transition actions:**  
- Set current wait time to 0
- Set decision timer to undefined
- Set state to Calculating


## Calculating Destination

**Condition**: State is Calculating  

**Actions to take**:  
- Evaluate which directions are permitted
  - A permitted direction must have at least one square of movement available
- Randomly select a direction from available directions
- Evaluate how many squares (up to three) are available in the chosen direction
  - The origin should be snapped to the nearest grid square
- Randomly select number of squares to move from available choices
- Set destination x/y, snapping to grid
- Transition

**Transition actions:**  
- Set state to Moving


## Go to intended loction

**Condition**: State is Moving  

**Actions to take**:  
- If the entities' X/Y is not the intended target X/Y, 
  - Ensure character is animating in the correct direction
  - If the character can move to the intended spot without colliding,
    - Increment the character toward the target X/Y by the intended speed
  - Else, check to see if should be waiting
    - If should be waiting, increment wait counter
    - Else, transition to Deciding
- Else transition to Deciding

**Transition actions**:  
- Set destination X/Y to undefined
- Set state to Deciding