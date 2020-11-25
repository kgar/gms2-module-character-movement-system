var view = view_camera[0];
roomWidth = room_width;
roomHeight = room_height;
guiWidth = camera_get_view_width(view);
guiHeight = camera_get_view_height(view);

if (instance_exists(following)) {
	var newX = following.x - guiWidth / 2;
	var newY = following.y - guiHeight / 2;
	camera_set_view_pos(view, newX, newY);
}

show_debug_overlay(true);