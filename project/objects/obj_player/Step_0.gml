var moveX = 0;
var moveY = 0;

if (keyboard_check(ord("W"))) {
	movementDriver.move_up();
	moveY = -walkSpeed;
} 
else if (keyboard_check(ord("A"))) {
	movementDriver.move_left();
	moveX = -walkSpeed;
}
else if (keyboard_check(ord("S"))) {
	movementDriver.move_down();
	moveY = walkSpeed;
}
else if (keyboard_check(ord("D"))) {
	movementDriver.move_right();
	moveX = walkSpeed;

} else {
	movementDriver.stop();
}

MovementDriver_step(moveX, moveY, id);