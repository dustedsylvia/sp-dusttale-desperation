button_type = "fight";
setup = false;
enabled = 0;
setstateto = 0;
returnstate = 0;
outline_thickness = 2;
outline_color = c_black;
dontkeepbuttonshighlighted = true;

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