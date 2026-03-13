width = 575;
height = 140;
lerpwidth = 575;
lerpheight = 140;
lerpx = x;
lerpy = y;
lerpangle = image_angle;
lerp_speed = 0.3;
outline_thickness = 2;
outline_color = c_black;
int = instance_create_depth(x+5, y+5, depth-99, arenainteract);
col = instance_create_depth(x, y, depth-99, arenacollision);
mask = instance_create_depth(x, y, depth-2, arenamask);

function MoveTo(newX, newY) {
	x = newX;
	y = newY;
	lerpx = newX;
	lerpy = newY;
}

function LerpTo(newX, newY) {
	lerpx = newX;
	lerpy = newY;
}

function LerpToSize(lerpWidth, lerpHeight) {
	lerpwidth = lerpWidth;
	lerpheight = lerpHeight;
}

function SetAngle(newAngle) {
	lerpangle = newAngle;
	image_angle = newAngle;
}

function LerpToAngle(newAngle) {
	lerpangle = newAngle;
}