global.grid = undefined;
global.paths = [];

function global_mp_grid_set(grid) {
	global_mp_grid_clean_up();
	global.grid = grid;
}

function global_mp_grid_clean_up() {
	if (global.grid != undefined) {
		mp_grid_destroy(global.grid);
	}
}

function global_paths_add(path) {
	array_push(global.paths, path);
}

function global_paths_clean_up() {
	var path = array_pop(global.paths);
	
	while (path != undefined) {
		path_delete(path);		
		path = array_pop(global.paths);
	}
}

function mp_manager_clean_up() {
	global_mp_grid_clean_up();
	global_paths_clean_up();
}