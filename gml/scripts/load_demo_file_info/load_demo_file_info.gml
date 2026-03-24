/// @function load_demo_file_info()
/// @description Loads the SAVE file from the SP!Dusttale demo into the global variables.

function load_demo_file_info() {
	// Player section
	global.player_name = "Chara";
	global.player_lv = 10;
	global.player_maxhp = 56;
	global.player_hp = 56;
	global.player_exp = 1586;
	global.weapon = "Real Knife";
	global.armor = "The Locket";
	global.inventory = [];
	
	// Savepoint section
	global.savepoint = "Throne Entrance";
	global.minutes = 47;
	global.seconds = 23;
	
	global.prevminutes = global.minutes;
	global.prevseconds = global.seconds;
	
	player_recalc_stats();
	
	save_save_file("file0.ini");
}
