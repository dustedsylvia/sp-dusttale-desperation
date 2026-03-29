startdodging = false;
dodgetimer = 121;

lerpx = x;
lerpy = y;
lerp_speed = 0.2;

outline_color = c_white;
outline_thickness = 2;

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