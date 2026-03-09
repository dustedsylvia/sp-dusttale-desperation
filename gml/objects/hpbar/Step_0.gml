if (global.kr_enabled == true) {
	clock += 1;

	// i wrote this KR system for a 30fps battle engine. so, the simple solution is to
	// run it every other frame.
	// ...
	// stop looking at me that way!!!!!

	if (clock % 2 == 0) {
		if (global.KR > 40) {
			global.KR = 40;
		}

		if (global.KR > 0 and global.player_hp >= 1) {
			global.KR_clock += 1;
			if (previoushp == global.player_hp) {
				global.KR_bonus = 0;
		
				if (global.INV >= 45) { 
		            global.KR_bonus = choose(0,1);
				}
		
		        if (global.INV >= 60) { 
		            global.KR_bonus = choose(0,1,1);
				}
		
		        if (global.INV >= 75) {
		            global.KR_bonus = 1;
				}
		
				if (global.KR_clock >= 1 + global.KR_bonus and global.KR >= 40) {
					global.KR_clock = 0;
					global.KR -= 1;
				}
		
				if (global.KR_clock >= 2 + global.KR_bonus * 2 and global.KR >= 30) {
					global.KR_clock = 0;
					global.KR -= 1;
				}
		
				if (global.KR_clock >= 5 + global.KR_bonus * 3 and global.KR >= 20) {
					global.KR_clock = 0;
					global.KR -= 1;
				}
		
				if (global.KR_clock >= 15 + global.KR_bonus * 5 and global.KR >= 10) {
					global.KR_clock = 0;
					global.KR -= 1;
				}
		
				if (global.KR_clock >= 30 + global.KR_bonus * 10) {
					global.KR_clock = 0;
					global.KR -= 1;
				}
			}
			previoushp = global.player_hp;
		}
	}
}