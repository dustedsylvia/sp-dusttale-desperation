timer += 1;
doNotIncreaseTime = array_contains([room_menu, room_fight_ending], room);
//show_debug_message("timer:" + string(timer) + "\nincreasing: " + string(!doNotIncreaseTime));
if (timer >= 60 and !doNotIncreaseTime) { global.seconds += 1; timer = 0; };// show_debug_message("increased."); }
if (global.seconds >= 60 and !doNotIncreaseTime) { global.minutes += 1; global.seconds = 0; }
if (instance_number(player) > 1) {
	show_error("\n\nMore than one player object exists!\n\n", true);//\nSee the logs for more information.\n\n", true);
}

if (instance_number(player) == 0) {
	show_debug_message("No player object exists!");//\nSee the logs for more information.\n\n", true);
}

