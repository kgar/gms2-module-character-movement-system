enum MovementState {
	Standing,
	Walking
}

standingIndex = 0;
walkSpeed = 2;
walkAnimationSpeed = 2;
movementState = MovementState.Standing;
walkRightSprite = spr_fighter_walk_right;
walkLeftSprite = spr_fighter_walk_left;
walkUpSprite = spr_fighter_walk_up;
walkDownSprite = spr_fighter_walk_down;

sprite_index = walkDownSprite;
image_speed = 0;

function walk_up() {
	sprite_index = walkUpSprite;
	walk();
}

function walk_left() {
	sprite_index = walkLeftSprite;
	walk();
}

function walk_right() {
	sprite_index = walkRightSprite;
	walk();
}

function walk_down() {
	sprite_index = walkDownSprite;
	walk();
}

function walk() {
	image_speed = walkAnimationSpeed;
	movementState = MovementState.Walking;
}

function stop() {
	image_speed = 0;
	image_index = standingIndex;
	movementState = MovementState.Standing;
}