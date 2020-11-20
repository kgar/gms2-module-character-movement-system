if (ai != undefined) {
	ai._step();
}
else if (movementDriver != undefined) {
	MovementDriver_step(moveX, moveY, id);
}