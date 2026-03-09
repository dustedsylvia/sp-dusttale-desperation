/// @function load_save_file_info()
/// @description Loads an empty SAVE file.

function load_empty_file_info() {
	// Player section
	global.player_name = "Chara";
	global.player_lv = 1;
	global.player_maxhp = 20;
	global.player_hp = 20;
	global.weapon = "Stick";
	global.armor = "Bandage";
	
	// Savepoint section
	global.savepoint = "--";
	global.minutes = 0;
	global.seconds = 0;
	
	global.prevminutes = global.minutes;
	global.prevseconds = global.seconds;
	
	player_recalc_stats();
}
