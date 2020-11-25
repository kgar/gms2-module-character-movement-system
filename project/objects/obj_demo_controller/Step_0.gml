if (keyboard_check_pressed(vk_escape)) {
	game_end();
} else if (keyboard_check_pressed(ord("R"))) {
	game_restart();
}

if (keyboard_check_pressed(vk_enter) && keyboard_check_direct(vk_alt)) {
	window_set_fullscreen(!window_get_fullscreen());
}