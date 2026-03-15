function createGasterBlaster(startX, startY, endX, endY, facePlayer=false, _depth=depth-3, rotation=0, endrotation=0, firelen=60, xscale=1, yscale=1) {
	var blaster = instance_create_depth(startX, startY, _depth, gasterblaster);
	blaster.startx = startX;
	blaster.starty = startY;
	blaster.targetx = endX;
	blaster.targety = endY;
	blaster.image_angle = rotation;
	blaster.endangle = endrotation;
	blaster.facePlayer = facePlayer;
	blaster.firelen = firelen;
	blaster.image_xscale = xscale;
	blaster.image_yscale = yscale;
}