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