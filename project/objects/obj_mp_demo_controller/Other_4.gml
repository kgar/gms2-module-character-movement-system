window_set_fullscreen(true);

showGrid = false;

cellSize = 32;
gridWidth = room_width / cellSize;
gridHeight = room_height / cellSize;
grid = mp_grid_create(0, 0, gridWidth, gridHeight, cellSize, cellSize);

with (inst_fred) {
	fredPath = path_add();
}

fredIsMoving = false;