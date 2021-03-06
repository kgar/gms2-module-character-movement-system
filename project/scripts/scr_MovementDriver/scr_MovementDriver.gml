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

	function face_up() {
		target.sprite_index = moveUpSprite;
		stop();
	}
	
	function face_down() {
		target.sprite_index = moveDownSprite;
		stop();
	}
	
	function face_left() {
		target.sprite_index = moveLeftSprite;
		stop();
	}
	
	function face_right() {
		target.sprite_index = moveRightSprite;
		stop();
	}

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
function MovementDriver_step(_x, _y, _target) {
		
	//// Hold onto these alternative movement blocks in case I run into issues with the while() loop version
	//if (_x != 0 && place_meeting(id.x + _x, id.y, obj_solid)) {
	//	repeat(abs(_x)) {
	//		if (!place_meeting(id.x + _x, id.y, obj_solid)) {
	//			id.x += sign(_x);
	//		}
	//		else {
	//			break;
	//		}
	//	}
	//	_x = 0;
	//	driver.stop();
	//}
	
	//if (_y != 0 && place_meeting(id.x, id.y + _y, obj_solid)) {
	//	repeat(abs(_y)) {
	//		if (!place_meeting(id.x, id.y + _y, obj_solid)) {
	//			id.y += sign(_y);
	//		}
	//		else {
	//			break;
	//		}
	//	}
	//	_y = 0;
	//	driver.stop();
	//}
	
	while (_x != 0 && place_meeting(_target.x + _x, _target.y, obj_solid)) {
		_x -= sign(_x);
		_target.movementDriver.stop();
	}
	
	while (_y != 0 && place_meeting(_target.x, _target.y + _y, obj_solid)) {
		_y -= sign(_y);
		_target.movementDriver.stop();
	}

	_target.x += _x;
	_target.y += _y;
}