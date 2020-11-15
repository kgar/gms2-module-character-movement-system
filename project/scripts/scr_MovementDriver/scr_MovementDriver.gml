function MovementDriver(_targetId, _moveUpSprite, _moveDownSprite, _moveLeftSprite, _moveRightSprite, _startIndex, _stopIndex, _animationSpeed) constructor{
	target = _targetId;
	
	animationSpeed = _animationSpeed;
	
	moveRightSprite = _moveRightSprite;
	moveLeftSprite = _moveLeftSprite;
	moveUpSprite = _moveUpSprite;
	moveDownSprite = _moveDownSprite;

	startIndex = _startIndex;
	stopIndex = _stopIndex;

	movementState = MovementState.Standing;
	
	target.sprite_index = moveDownSprite;
	target.image_speed = 0;

	function move_up() {
		target.sprite_index = moveUpSprite;
		move();
	}

	function move_left() {
		target.sprite_index = moveLeftSprite;
		move();
	}

	function move_right() {
		target.sprite_index = moveRightSprite;
		move();
	}

	function move_down() {
		target.sprite_index = moveDownSprite;
		move();
	}

	function move() {
		if (movementState == MovementState.Moving) {
			return;
		}
		target.image_speed = animationSpeed;
		target.image_index = startIndex;
		movementState = MovementState.Moving;
	}

	function stop() {
		if (movementState == MovementState.Standing) {
			return;
		}
		target.image_speed = 0;
		target.image_index = stopIndex;
		movementState = MovementState.Standing;
	}
}

/*
  Note to self: calling place_meeting() from within the main MovementDriver struct 
  causes the VM to crash, and YYC compiler completely ignores it.
  Hence, this standalone function is not inside the MovementDriver.
*/
function MovementDriver_step(_x, _y, driver) {
	while (_x != 0 && place_meeting(id.x + _x, id.y, obj_solid)) {
		_x -= sign(_x);
		driver.stop();
	}

	while (_y != 0 && place_meeting(id.x, id.y + _y, obj_solid)) {
		_y -= sign(_y);
		driver.stop();
	}

	id.x += _x;
	id.y += _y;
}