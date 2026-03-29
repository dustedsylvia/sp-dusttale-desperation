if (startdodging) {
	dodgetimer -= 1;
	startdodging = false;
}

if (dodgetimer != 121) {
	dodgetimer -= 1;
	if (dodgetimer == 119) {
		lerpx = x - 100;
	}
	if (dodgetimer == 60) {
		lerpx = x + 100;
	}
	if (dodgetimer == 0) {
		dodgetimer = 121;
	}
}

if (x != lerpx) {
	x = lerp(x, lerpx, lerp_speed);
}

if (y != lerpy) {
	y = lerp(y, lerpy, lerp_speed);
}