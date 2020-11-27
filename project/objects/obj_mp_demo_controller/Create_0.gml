function wall_toggle_cell(_x, _y) {
	var wall = instance_position(_x, _y, obj_wall);

	if (wall != noone) {
		instance_destroy(wall);
	} else {
		var snap_x = floor(_x / cellSize) * cellSize;
		var snap_y = floor(_y / cellSize) * cellSize;
	
		instance_create_layer(snap_x, snap_y, "Instances", obj_wall);
	}
	
	mp_grid_cells_refresh();
}

function mp_grid_cells_refresh() {
	var grid = global.grid;

	mp_grid_clear_all(grid);
	
	var gridCellSize = cellSize;
	var theGrid = grid;
	with(obj_wall) {
		var top_cell_y = floor(y / gridCellSize);
		var left_cell_x = floor(x / gridCellSize);
		var bottom_cell_y = floor((y +  bbox_bottom - bbox_top) / gridCellSize);
		var right_cell_x = floor((x + bbox_right - bbox_left) / gridCellSize);
		
		mp_grid_add_cell(theGrid, left_cell_x, top_cell_y);
		mp_grid_add_cell(theGrid, right_cell_x, top_cell_y);
		mp_grid_add_cell(theGrid, left_cell_x, bottom_cell_y);
		mp_grid_add_cell(theGrid, right_cell_x, bottom_cell_y);
	}
}