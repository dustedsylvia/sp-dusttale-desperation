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

sansheadpos = [x + 22, y];
sansbodypos = [x, y + 44];
sansarmpos = [x + 90, y + 50];
sanslegspos = [x + 12, y + 94];

sintimer += 1;
costimer += 1;

//xoffset = sin(sintimer);
yoffset = cos(costimer / 10);
rotoffset = sin(sintimer / 7);
