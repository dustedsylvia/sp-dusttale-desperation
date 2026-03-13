if (instance_find(player, 0) != noone) {
	show_debug_message("player x: " + string(instance_find(player, 0).x) + "\nplayer y: "+ string(instance_find(player, 0).y));
} else {
	show_debug_message("m");
}