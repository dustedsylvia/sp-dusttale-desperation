/// @function save_save_file(ini_filepath)
/// @description Saves information to a SP!Dusttale-style SAVE file.
/// @argument {String} ini_filepath The ini to SAVE to.
/// @return {Bool}

function save_save_file(ini_filepath) {
	ini_open(ini_filepath);
	
	// Player section
	ini_write_string("player", "name", global.player_name);
	ini_write_real("player", "lv", global.player_lv);
	ini_write_real("player", "hp", global.player_hp);
	ini_write_string("player", "weapon", global.weapon);
	ini_write_string("player", "armor", global.armor);
	ini_write_real("player", "exp", global.player_exp);
	ini_write_string("player", "inventory", json_stringify(global.inventory));
	
	// Savepoint section
	ini_write_string("savepoint", "id", global.savepoint);
	ini_write_real("savepoint", "minutes", global.minutes);
	ini_write_real("savepoint", "seconds", global.seconds);
	
	// For ini_file_exists
	ini_write_real("misc", "file_exists", 1);
	
	ini_close();
	
	player_recalc_stats();
	return true;
}