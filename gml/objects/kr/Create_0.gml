outline_thickness = 2;
outline_color = c_black;

lerpx = x;
lerpy = y;
lerp_speed = 0.3;

function MoveTo(newX, newY) {
	x = newX;
	y = newY;
	lerpx = newX;
	lerpy = newY;
}

function LerpTo(lerpX, lerpY) {
	lerpx = lerpX;
	lerpy = lerpY;
}