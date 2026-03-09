/// @function load_save_file(ini_filepath)
/// @description Loads a SP!Dusttale-style SAVE file.
/// @argument {String} ini_filepath The ini containing the SAVE data.
/// @return {Bool}

function load_save_file(ini_filepath) {
	load = load_save_file_info(ini_filepath);
	global.resetcam = true;
	
	// At this point, you should have all the data needed to load a Savepoint.
	
	switch (global.savepoint) {
		case "big test room":
			instance_create_depth(377, 257, -9998, player);
			room_goto(room_bigtest);
		break;
		
		case "story_file_1":
			instance_create_depth(-100, -100, -9998, player);
			global.can_menu = false;
			global.can_move = false;
			room_goto(room_fight_ending);
		break;
		
		case "Throne Entrance":
			instance_create_depth(928, 256, -9998, player);
			global.resetcam = true;
			show_debug_message("supposedly created player");
			room_goto(room_throne_entrance);
		break;
	}
}