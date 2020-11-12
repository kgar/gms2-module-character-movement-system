var moveX = 0;
var moveY = 0;

if (keyboard_check(ord("W"))) {
	walk_up();
	moveY = -walkSpeed;
} 
else if (keyboard_check(ord("A"))) {
	walk_left();
	moveX = -walkSpeed;
}
else if (keyboard_check(ord("S"))) {
	walk_down();
	moveY = walkSpeed;
}
else if (keyboard_check(ord("D"))) {
	walk_right();
	moveX = walkSpeed;

} else {
	stop();
}

x += moveX;
y += moveY;