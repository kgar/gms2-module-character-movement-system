# Scripting NPC Behavior - Waypoint

Given a series of ordered waypoint IDs, which are properties on obj_waypoint instances, have the NPC visit each waypoint in the order that they are specified, respecting collisions and using motion planning. Upon a collision, the NPC should re-plan their path and continue trying to get to their target waypoint.

## Approaches

### ✅ Sequential state machine with parameterized actions

This could be a sequential state machine with a series of "Go To Waypoint" actions as the items in the array. My current plans do not include a way of parameterizing the Action for various waypoints, but using a struct factory could make that possible. The function could be simply ._step() or .execute() or .invoke(). The constructor could provide a means for spcifying which waypoint. The major pro of this approach is in figuring out sequential state machines and also figuring out parameterized actions. I suspect I'll have some difficulty along the way based on past experience using struct factories.

If a struct factory approach doesn't work, I could opt to upgrade the states array to be an array of arrays with the state function and any args that go with it.

- Create sequential state machine with simple array of actions
- Upgrade NPC object to support this in addition to the previous unmanaged state machine
- Test and verify that an NPC can use it without issue alongside the bumbler AI
- Code up a simple example of motion planning in order to learn the API
- Implement the state action function "Go To Waypoint" that takes whatever parameters are needed in order to iterate upon the action. When done going to waypoint, it should return StateProgress.Transition, else return StateProgress.Continue.
  - When encountering a potential collision, recalc the path to the goal
- Apply the sequential state machine to an NPC and give them a handful of waypoints
- Ensure that all 3 NPCs, the bumbler, the waypoint NPC, and the sequential state machine test NPC, are all functioning properly in concert with one another
- Test the waypoint NPC's ability to reroute

### Single-state state machine with array of waypoint IDs

Closer to the orignal description / idea, there could be a state machine with a series of waypoints that simply cycles through them, calling out to a function to go to iterate toward the indicated waypoint. Other than learning motion planning, this approach doesn't offer as much of a learning opportunity.