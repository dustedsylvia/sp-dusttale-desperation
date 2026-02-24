var key_z = keyboard_check_pressed(ord("Z"));
var key_enter = keyboard_check_pressed(vk_enter);
var confirm = (key_z or key_enter);

if (place_meeting(x, y, playerinteract) and state == 0) {
	global.can_move = false;
	state = 1;
	instance_create_depth(0, 0, -9999, fader);
}

if (state == 1) {
	if (clock > 0) {
		clock -= 1;
	} else {
		room_goto(targetroom);
		//var p = instance_create_depth(targetx, targety, -9998, player);
		var p = instance_find(player, 0);
		p.x = targetx;
		p.y = targety;
		state = 2;
		clock = 15;
	}
}

if (state == 2) {
	if (clock > 0) {
		clock -= 1;
	} else {
		instance_destroy();
		global.can_move = true;
	}
}