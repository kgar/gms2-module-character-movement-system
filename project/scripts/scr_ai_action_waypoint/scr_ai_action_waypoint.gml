function ai_action_waypoint(props){
	// Init
	if (!props.started) {
		// Map grid path
		var x_cell = props.waypoint.x div props.cellSize;
		var y_cell = props.waypoint.y div props.cellSize;
	
		var position_x = round((x_cell * props.cellSize) + (props.cellSize / 2));
		var position_y = round((y_cell * props.cellSize) + (props.cellSize / 2));
	
		mp_grid_path(props.grid, props.path, id.x, id.y, position_x, position_y, false);
		path_start(props.path, props.speed, path_action_stop, true);
		
		props.started = true;
		
		isMoving = true;
		
		return StateProgress.Continue;
	}
	
	// Increment
	var collisionImminent = collision_circle(
		x + lengthdir_x(props.speed, direction), 
		y + lengthdir_y(props.speed, direction), 
		props.cellSize / 2 - 2, 
		obj_solid, 
		false, 
		true);
		
	if (collisionImminent) {
		path_position = path_positionprevious;
		isMoving = false;
		path_end();
		
	}
	else if (isMoving == false) {
		// restart/reroute the path.
		props.started = false;
	}
	
	// Transition
	if (path_position == 1) {
		id.isMoving = false;
		return StateProgress.Transition;
	}
	
	return StateProgress.Continue;
}

function ai_action_waypoint_props_create(_waypoint, _path, _grid, _cellSize, _speed) {
	return {
		path: _path,
		waypoint: _waypoint,
		grid: _grid,
		cellSize: _cellSize,
		speed: _speed,
		started: false
	};
}