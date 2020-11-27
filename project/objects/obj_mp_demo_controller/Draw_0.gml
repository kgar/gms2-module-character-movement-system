var grid = global.grid;

if (showGrid) {
	draw_set_alpha(0.3);
	mp_grid_draw(grid);
	draw_set_alpha(1);
}

draw_path(inst_fred.fredPath, inst_fred.x, inst_fred.y, true);