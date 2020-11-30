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