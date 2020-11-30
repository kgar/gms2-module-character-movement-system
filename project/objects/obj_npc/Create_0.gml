movementDriver = undefined;
walkSpeed = 1;

faceLeftSprite = spr_fghtr2_face_left;
faceRightSprite = spr_fghtr2_face_right;
faceUpSprite = spr_fghtr2_face_up;
faceDownSprite = spr_fghtr2_face_down;

walkLeftSprite = spr_fghtr2_walk_left;
walkRightSprite = spr_fghtr2_walk_right;
walkUpSprite = spr_fghtr2_walk_up;
walkDownSprite = spr_fghtr2_walk_down;

isMoving = false;

image_speed = 1;

function setDirectionalAnimation(direction, up, down, left, right) {
	if (direction >= 306 || direction <= 45) {
		sprite_index = right;
	}
	else if (direction >= 46 && direction <= 135) {
		sprite_index = up;
	}
	else if (direction >= 136 && direction <= 225) {
		sprite_index = left;
	}
	else if (direction >= 226 && direction <= 305) {
		sprite_index = down;
	}
}