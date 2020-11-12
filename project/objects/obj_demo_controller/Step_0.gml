if (keyboard_check_pressed(vk_escape)) {
	game_end();
} else if (keyboard_check_pressed(ord("R"))) {
	game_restart();
}