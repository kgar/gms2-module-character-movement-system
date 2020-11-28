function ai_action_waypoint(props){
	// Init
	if (!props.started) {
		// Map grid path
		var x_cell = props.waypoint.x div props.cellSize;
		var y_cell = props.waypoint.y div props.cellSize;
	
		var position_x = (x_cell * props.cellSize) + (props.cellSize / 2);
		var position_y = (y_cell * props.cellSize) + (props.cellSize / 2);
	
		mp_grid_path(props.grid, props.path, id.x, id.y, position_x, position_y, false);
		path_start(props.path, props.speed, path_action_stop, true);
		
		props.started = true;
		
		return StateProgress.Continue;
	}
	
	// Increment
	// TODO: handle collisions
	// TODO: reroute? did the target move?
	
	// Transition
	if (path_position == 1) {
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