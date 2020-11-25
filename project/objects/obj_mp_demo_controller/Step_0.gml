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
	fredIsMoving = true;
	
	with (inst_fred) {
		path_start(fredPath, 4, path_action_stop, true);
	}
}

if (inst_fred.path_position == 1) {
	fredIsMoving = false;
}
