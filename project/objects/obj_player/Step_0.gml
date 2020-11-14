var moveX = 0;
var moveY = 0;

if (keyboard_check(ord("W"))) {
	walkMovementDriver.move_up();
	moveY = -walkSpeed;
} 
else if (keyboard_check(ord("A"))) {
	walkMovementDriver.move_left();
	moveX = -walkSpeed;
}
else if (keyboard_check(ord("S"))) {
	walkMovementDriver.move_down();
	moveY = walkSpeed;
}
else if (keyboard_check(ord("D"))) {
	walkMovementDriver.move_right();
	moveX = walkSpeed;

} else {
	walkMovementDriver.stop();
}


while (moveX != 0 && place_meeting(x + moveX, y, obj_solid)) {
	moveX -= sign(moveX);
	stop();
}

while (moveY != 0 && place_meeting(x, y + moveY, obj_solid)) {
	moveY -= sign(moveY);
	stop();
}

x += moveX;
y += moveY;