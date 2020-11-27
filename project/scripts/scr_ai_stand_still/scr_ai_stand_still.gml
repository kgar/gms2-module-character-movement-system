function ai_action_stand_still(){
	movementDriver.stop();
	
	return StateProgress.Transition;
}