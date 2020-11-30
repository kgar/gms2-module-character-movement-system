var grid = global.grid;

var fredIsMoving = variable_instance_get(inst_fred, "stateMachineStep") != undefined;
if (!fredIsMoving) {
	var x_cell = floor(mouse_x / cellSize);
	var y_cell = floor(mouse_y / cellSize);
	
	var position_x = (x_cell * cellSize) + (cellSize / 2);
	var position_y = (y_cell * cellSize) + (cellSize / 2);
	
	mp_grid_path(grid, inst_fred.fredPath, inst_fred.x, inst_fred.y, position_x, position_y, false);
}

if (keyboard_check_pressed(ord("G"))) {
	showGrid = !showGrid;
}

if (mouse_check_button_pressed(mb_left) && !fredIsMoving) {	
	with (inst_fred) {
		var coords = { x: mouse_x, y: mouse_y };		
		var params = [
			{
				state: ai_action_waypoint,
				props: ai_action_waypoint_props_create(coords, fredPath, global.grid, 32, 2)
			}
		];
		seq_state_machine_create(params, false);
	}
}

if (mouse_check_button_pressed(mb_right)) {
	wall_toggle_cell(mouse_x, mouse_y);
}