/// @function load_story_file_1(ini_filepath)
/// @description Loads information from story file 1 into the game.
/// @argument {String} ini_filepath The ini containing the SAVE data.
/// @return {Bool}

function load_story_file_1(ini_filepath, immediateLoad=true) {
	ini_open(ini_filepath);
	
	// Player section
	ini_write_string("player", "name", "Frisk");
	ini_write_real("player", "lv", 10);
	ini_write_real("player", "hp", 56);
	ini_write_string("player", "weapon", "Real Knife");
	ini_write_string("player", "armor", "The Locket");
	ini_write_real("player", "exp", 1547);
	ini_write_string("player", "inventory", json_stringify([]));
	
	// Savepoint section
	ini_write_string("savepoint", "id", "story_file_1");
	ini_write_real("savepoint", "minutes", 48);
	ini_write_real("savepoint", "seconds", 46);
	
	// For ini_file_exists
	ini_write_real("misc", "file_exists", 1);
	
	ini_close();
	
	if (immediateLoad) {
		load_save_file("file0.ini");
		player_recalc_stats();
	}
	
	return true;
}
