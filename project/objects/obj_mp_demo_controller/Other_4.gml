window_set_fullscreen(true);

showGrid = false;

cellSize = 32;
gridWidth = room_width / cellSize;
gridHeight = room_height / cellSize;

var grid = mp_grid_create(0, 0, gridWidth, gridHeight, cellSize, cellSize);
global_mp_grid_set(grid);

with (inst_fred) {
	fredPath = path_add();
	global_paths_add(fredPath);
}

fredIsMoving = false;