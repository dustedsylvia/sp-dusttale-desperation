if (!spare) {
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
	sansbodypos = [x + 2, y + 39];
	sanslegspos = [x + 19, y + 106];

	sintimer += 1;
	costimer += 1;

	yoffset = cos(costimer / 10);
	rotoffset = sin(sintimer / 7);
} else {
	alpha = 0.5;
}