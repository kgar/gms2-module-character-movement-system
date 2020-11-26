if (!fredIsMoving) {
	var x_cell = floor(mouse_x / cellSize);
	var y_cell = floor(mouse_y / cellSize);
	
	var position_x = (x_cell * cellSize) + (cellSize / 2);
	var position_y = (y_cell * cellSize) + (cellSize / 2);
	
	mp_grid_path(grid, inst_fred.fredPath, inst_fred.x, inst_fred.y, position_x, position_y, false);	
}
else {
	var fredDir = inst_fred.direction;
	switch (fredDir) {
		case 0: // Right
			inst_fred.movementDriver.move_right();
			break;
		case 90: // Up
			inst_fred.movementDriver.move_up();
			break;
		case 180: // Left
			inst_fred.movementDriver.move_left();
			break;
		case 270: // Down
			inst_fred.movementDriver.move_down();
			break;
		default: // Snap to closest
			break;
	}
	
}

if (keyboard_check_pressed(ord("G"))) {
	showGrid = !showGrid;
}

if (mouse_check_button_pressed(mb_left) && !fredIsMoving) {
	fredIsMoving = true;
	
	with (inst_fred) {
		path_start(fredPath, 2, path_action_stop, true);
	}
}

if (inst_fred.path_position == 1) {
	fredIsMoving = false;
	inst_fred.movementDriver.stop();
}

if (mouse_check_button_pressed(mb_right)) {
	wall_toggle_cell(mouse_x, mouse_y);
}