enum AI_BumblerState {
	Wait,
	Move
}

function ai_bumbler_apply(_zoneX1, _zoneY1, _zoneX2, _zoneY2) {
	zoneX1 = coalesce(_zoneX1, 0);
	zoneY1 = coalesce(_zoneY1, 0);
	zoneX2 = coalesce(_zoneX2, room_width);
	zoneY2 = coalesce(_zoneY2, room_height);
	walkSpeed = walkSpeed > 0 ? walkSpeed : 0.5;
	
	states = [];
	states[AI_BumblerState.Wait] = ai_bumbler_wait;
	states[AI_BumblerState.Move] = ai_bumbler_move;
	state = irandom_range(AI_BumblerState.Wait, AI_BumblerState.Move);
}

function ai_bumbler_wait() {
	// Init
	if (variable_instance_get(id, "timer") == undefined) {
		movementDriver.stop();
		timer = 0;
		waitTime = irandom_range(1, 5) * room_speed;
		return;
	}
		
	// Take Action
	timer++;
		
	// Transition
	if (timer >= waitTime) {
		state = AI_BumblerState.Move;
		timer = undefined;
		waitTime = undefined;
	}
}

function ai_bumbler_move() {
	// Init
	if (variable_instance_get(id, "destX") == undefined || variable_instance_get(id, "destY") == undefined) {
		var distance = 32 * irandom_range(1, 3);
		dir = irandom_range(0,3) * 90;
		var moveX = lengthdir_x(distance, dir);			
		var moveY = lengthdir_y(distance, dir);
			
		// TODO: Make this a little more refined?
		destX = x + moveX;
		destY = y + moveY;
		return;
	}
		
	// Take Action
	// determine relative move
	var moveX = 0;
	var moveY = 0;
		
	switch dir
	{
		case 0: // Right
			moveY = y;
			moveX = min(zoneX2, x + walkSpeed);
			movementDriver.move_right();
			break;
		case 90: // Up
			moveX = x;
			moveY = max(zoneY1, y - walkSpeed);
			movementDriver.move_up();
			break;
		case 180: // Left
			moveY = y;
			moveX = max(zoneX1, x - walkSpeed);
			movementDriver.move_left();
			break;
		case 270: // Down
			moveX = x;
			moveY = min(zoneY2, y + walkSpeed);
			movementDriver.move_down();
			break;
		default:
			throw "Invalid Bumbler direction!";
	}
		
	var objectXBeforeMove = x;
	var objectYBeforeMove = y;
	var relativeMoveX = moveX - x;
	var relativeMoveY = moveY - y;
	MovementDriver_step(relativeMoveX, relativeMoveY, id);
		
	// Transition
	if (objectXBeforeMove == x && objectYBeforeMove == y) {
		state = AI_BumblerState.Wait;
		destX = undefined;
		destY = undefined;
		dir = undefined;
	}
}