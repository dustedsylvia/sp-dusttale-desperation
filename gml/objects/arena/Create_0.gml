width = 575;
height = 140;
lerpwidth = 575;
lerpheight = 140;
lerpx = x;
lerpy = y;
lerp_speed = 0.3;
outline_thickness = 2;
outline_color = c_black;

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