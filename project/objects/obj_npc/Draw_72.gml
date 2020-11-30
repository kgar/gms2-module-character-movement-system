var isMoving = 
	path_index != -1 ||
	round(xprevious) != round(x) || 
	round(yprevious) != round(y);
	
if (isMoving) {
	setDirectionalAnimation(
		direction, 
		walkUpSprite, 
		walkDownSprite, 
		walkLeftSprite, 
		walkRightSprite);
}
else {
	setDirectionalAnimation(
		direction, 
		faceUpSprite, 
		faceDownSprite, 
		faceLeftSprite, 
		faceRightSprite);
}