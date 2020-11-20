// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_BumblerNpcAi(_object, _x1, _y1, _x2, _y2) constructor {

	object = _object
	zoneX1 = _x1;
	zoneY1 = _y1;
	zoneX2 = _x2;
	zoneY2 = _y2;

	enum BumblerStates {
		Wait,
		Move
	}

	timer = undefined;
	waitTime = undefined;

	function WaitState() {
		// Init
		if (timer == undefined) {
			object.movementDriver.stop();
			timer = 0;
			waitTime = irandom_range(1, 5) * room_speed;
			return;
		}
		
		// Take Action
		timer++;
		
		// Transition
		if (timer >= waitTime) {
			state = BumblerStates.Move;
			timer = undefined;
			waitTime = undefined;
		}
	}
	
	destX = undefined;
	destY = undefined;
	dir = undefined;
	
	function MoveState() {
		// Init
		if (destX == undefined || destY == undefined) {
			var distance = 32 * irandom_range(1, 3);
			dir = irandom_range(0,3) * 90;
			var moveX = lengthdir_x(distance, dir);			
			var moveY = lengthdir_y(distance, dir);
			
			// TODO: Make this a little more refined?
			destX = object.x + moveX;
			destY = object.y + moveY;
			return;
		}
		
		// Take Action
		// determine relative move
		var moveX = 0;
		var moveY = 0;
		
		switch dir
		{
			case 0: // Right
				moveY = object.y;
				moveX = min(zoneX2, object.x + 2);
				object.movementDriver.move_right();
				break;
			case 90: // Up
				moveX = object.x;
				moveY = max(zoneY1, object.y - 2);
				object.movementDriver.move_up();
				break;
			case 180: // Left
				moveY = object.y;
				moveX = max(zoneX1, object.x - 2);
				object.movementDriver.move_left();
				break;
			case 270: // Down
				moveX = object.x;
				moveY = min(zoneY2, object.y + 2);
				object.movementDriver.move_down();
				break;
			default:
				throw "Invalid Bumbler direction!";
		}
		
		var objectXBeforeMove = object.x;
		var objectYBeforeMove = object.y;
		var relativeMoveX = moveX - object.x;
		var relativeMoveY = moveY - object.y;
		MovementDriver_step(relativeMoveX, relativeMoveY, object);
		
		
		// Transition
		if (objectXBeforeMove == object.x && objectYBeforeMove == object.y) {
			state = BumblerStates.Wait;
			destX = undefined;
			destY = undefined;
			dir = undefined;
		}
	}

	states[BumblerStates.Wait] = WaitState;
	states[BumblerStates.Move] = MoveState;
	state = irandom_range(BumblerStates.Wait, BumblerStates.Move);

	function _step() {
		script_execute(states[state])
	}
}