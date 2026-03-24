/// @function load_save_file_info(ini_filepath)
/// @description Loads information from a SP!Dusttale-style SAVE file.
/// @argument {String} ini_filepath The ini containing the SAVE data.
/// @return {Bool}

function load_save_file_info(ini_filepath) {
	//if (!ini_file_exists(ini_filepath)) { return false; };
	if (!ini_file_exists(ini_filepath)) { load_demo_file_info(); };
	
	ini_open(ini_filepath);
	
	// Player section
	global.player_name = ini_read_string("player", "name", "error_nodata");
	global.player_lv = ini_read_real("player", "lv", -1997);
	global.player_exp = ini_read_real("player", "exp", -1997);
	global.player_maxhp = 16 + (4 * global.player_lv);
	global.player_hp = ini_read_real("player", "hp", -1997);
	global.weapon = ini_read_string("player", "weapon", "error_nodata");
	global.armor = ini_read_string("player", "armor", "error_nodata");
	global.inventory = json_parse(ini_read_string("player", "inventory", []));
	
	// Savepoint section
	global.savepoint = ini_read_string("savepoint", "id", "error_nodata");
	global.minutes = ini_read_real("savepoint", "minutes", -1997);
	global.seconds = ini_read_real("savepoint", "seconds", -1997);
	
	global.prevminutes = global.minutes;
	global.prevseconds = global.seconds;
	
	ini_close();
	
	if (array_contains([global.player_name, global.weapon, global.armor, global.savepoint], "error_nodata")) {
		show_error("yo twin your save file fucked up frfr (string value)", true);
	}
	if (array_contains([global.player_lv, global.player_hp, global.minutes, global.seconds], -1997)) {
		show_error("yo twin your save file fucked up frfr (integer value)", true);
	}
	
	player_recalc_stats();
	return true;
}
