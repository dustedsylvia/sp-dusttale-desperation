if (global.is_gm_live_enabled) {
	if (live_call()) return live_result;
}

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
	
	if (animationstyle == 0) { // Oldest animations
		sansheadpos = [x, y];
		sansbodypos = [x, y + 39];
		sanslegspos = [x, y + 106];

		sintimer += 1;
		costimer += 1;

		yoffset = cos(costimer / 10);
		rotoffset = sin(sintimer / 7);
	}
	
	if (animationstyle == 1) {
		parabola_controller += parabola_speed;
		
		if (parabola_controller > 1.97203) {
			parabola_controller = -1.97203;
			//parabola_speed = parabola_speed * -1;
		}// if (parabola_controller < -1.97203) {
			//parabola_controller = -1.97203;
		//	parabola_speed = parabola_speed * -1;
		//}
		
		parabola_controller += parabola_speed;
		
		sintimer += 1;
		
		//sansheadpos = [x + 3 + lerp(-1, 1, -1*(parabola(-0.9, 0, 3.5, parabola_controller)) / 3.94406), y + parabola(-0.9, 0, 3.5, parabola_controller)];
		//sansbodypos = [x + 3 + lerp(-1, 1, -1*(parabola(-0.9, 0, 3.5, parabola_controller)) / 3.94406), y + 39 + parabola(-0.9, 0, 3.5, parabola_controller) * 0.5];
		sansheadpos = [x + sin(sintimer / 15), y + parabola(-0.9, 0, 3.5, parabola_controller)];
		sansbodypos = [x + sin(sintimer / 15), y + 39 + parabola(-0.9, 0, 3.5, parabola_controller) * 0.5];
		sanslegspos = [x, y + 150];
		
		sanslegsyscale = lerp(2.1, 2.3, -1*(parabola(-0.9, 0, 3.5, parabola_controller)) / 3.94406);
		//sanslegsangle = sin(sintimer / 15) / 2;
		sansheadangle = sin(sintimer / 15) / 2;
		sanslegsangle = 0;
		//sintimer += 1;
		//costimer += 1;

		//yoffset = cos(costimer / 10);
		//rotoffset = sin(sintimer / 7);
	}
	
	if (animationstyle == 2) {
		sintimer += 1;
		
		sansheadpos = [x + sin(sintimer / 8), y + sin(sintimer / 5)];
		sansbodypos = [x + sin(sintimer / 8), y + 39 + sin(sintimer / 6)];
		sanslegspos = [x, y + 150];
		sansleftarmpos = [x - 40, y + 56 + sin(sintimer / 6)];
		sansrightarmpos = [x + 30, y + 56 + sin(sintimer / 6)];
		
		sanslegsyscale = 2 + sin(sintimer / 6) / 10;
		//sanslegsangle = sin(sintimer / 15) / 2;
		sansheadangle = sin(sintimer / 5);
		sanslegsangle = 0;
		
		sansleftarmangle = lerp(-1, 1, sin(sintimer / 10));
		sansrightarmangle = lerp(-1, 1, sin(sintimer / 10));
	}
} else {
	alpha = 0.5;
}