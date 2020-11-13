if (!freeze && instance_exists(following)) {
	var view = view_camera[0];
	var camX = camera_get_view_x(view);
	var camY = camera_get_view_y(view);
	var followingX = following.x - guiWidth/2;
	var followingY = following.y - guiHeight/2;
	
	var newX = lerp(camX, followingX, 0.1);
	var newY = lerp(camY, followingY, 0.1);
	
	// Check for Room Edge
	newX = clamp(newX, 0, roomWidth - guiWidth);
	newY = clamp(newY, 0, roomHeight - guiHeight);
	
	camera_set_view_pos(view, newX, newY);
}