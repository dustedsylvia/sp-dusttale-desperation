function player_recalc_stats() {
	switch (global.weapon) {
		case "Stick":
			global.weapon_atk = 0;
		break;
		
		case "Real Knife":
			global.weapon_atk = 99;
		break;
	}
	
	switch (global.armor) {
		case "Bandage":
			global.armor_def = 0;
		break;
		
		case "The Locket":
			global.armor_def = 99;
		break;
	}
	
	global.player_atk = (-2 + (2 * global.player_lv)) + global.weapon_atk;
	global.player_def = ((global.player_lv - 1) / 4) + global.armor_def;
	global.player_speed = 2.5; // 2.5 for 60fps
}