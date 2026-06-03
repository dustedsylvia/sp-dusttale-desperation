timer += 1;
doNotIncreaseTime = array_contains([room_menu, room_fight_ending], room);
//show_debug_message("timer:" + string(timer) + "\nincreasing: " + string(!doNotIncreaseTime));
if (timer >= 60 and !doNotIncreaseTime) { global.seconds += 1; timer = 0; };// show_debug_message("increased."); }
if (global.seconds >= 60 and !doNotIncreaseTime) { global.minutes += 1; global.seconds = 0; }
if (instance_number(player) > 1) {
	show_error("\n\nMore than one player object exists!\n\n", true);//\nSee the logs for more information.\n\n", true);
}

if (instance_number(player) == 0) {
	//show_debug_message("No player object exists!");//\nSee the logs for more information.\n\n", true);
}

if (timer % 30 == 0) {
	gc_collect(); // just in case some weird shi going on
}
if (global.memoryLeakHelperDetector == true) {
	if (timer % 60 == 0) {
		var sprites = 0;
		var surfaces = 0;
		var buffers = 0;
		var ds_lists = 0;
		var ds_other = 0;
	
		for (var i = 0; i <= 15000; i++) {
			if (sprite_exists(i)) { sprites += 1; };
			if (surface_exists(i)) { surfaces += 1; };
			if (buffer_exists(i)) { buffers += 1; };
			if (ds_exists(i, ds_type_list)) { ds_lists += 1; };
			if (ds_exists(i, ds_type_map)) { ds_other += 1; };
			if (ds_exists(i, ds_type_stack)) { ds_other += 1; };
			if (ds_exists(i, ds_type_grid)) { ds_other += 1; };
			if (ds_exists(i, ds_type_queue)) { ds_other += 1; };
			if (ds_exists(i, ds_type_priority)) { ds_other += 1; };
		}
	
		show_message($"== Debug information ==\nSprite count: {string(sprites)}\nSurface count: {string(surfaces)}\nBuffer count: {string(buffers)}\nds_list count: {string(ds_lists)}\nds_other count: {string(ds_other)}");
	}
}