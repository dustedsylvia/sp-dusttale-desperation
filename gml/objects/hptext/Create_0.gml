font = mnc;
text = string_repeat("0", max(0, 2 - string_length(string(global.player_hp + global.KR)))) + string(global.player_hp + global.KR) + " / " + string(global.player_maxhp);color = c_white;
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