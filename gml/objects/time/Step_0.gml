timer += 1;
doNotIncreaseTime = array_contains([room_menu, room_fight_ending], room);
//show_debug_message("timer:" + string(timer) + "\nincreasing: " + string(!doNotIncreaseTime));
if (timer >= 60 and !doNotIncreaseTime) { global.seconds += 1; timer = 0; };// show_debug_message("increased."); }
if (global.seconds >= 60 and !doNotIncreaseTime) { global.minutes += 1; global.seconds = 0; }
if (instance_number(player) > 1) {
	//for (i = 0; i < instance_number(player); i++) {
	//     obj = instance_find(player,i);
	//     with (obj) {
	//          show_debug_message(string_concat("Player object created from ", object_index));
	//     }
	//}
	show_error("\n\nMore than one player object exists!\n\n", true);//\nSee the logs for more information.\n\n", true);
}