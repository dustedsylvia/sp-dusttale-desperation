function createGasterBlaster(startX, startY, endX, endY, facePlayer=false, _depth=depth-3, rotation=0, endrotation=0) {
	var blaster = instance_create_depth(startX, startY, _depth, gasterblaster);
	blaster.startx = startX;
	blaster.starty = startY;
	blaster.targetx = endX;
	blaster.targety = endY;
	blaster.image_angle = rotation;
	blaster.endangle = endrotation;
	blaster.facePlayer = facePlayer;
}