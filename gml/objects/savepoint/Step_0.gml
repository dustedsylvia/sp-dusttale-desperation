var arrow_left = keyboard_check_pressed(vk_left);
var arrow_right = keyboard_check_pressed(vk_right);
var key_a = keyboard_check_pressed(ord("A"));
var key_d = keyboard_check_pressed(ord("D"));
var moved = (arrow_left or key_a or arrow_right or key_d);

var key_z = keyboard_check_pressed(ord("Z"));
var key_enter = keyboard_check_pressed(vk_enter);
var confirm = (key_z or key_enter);

// There's a problem with the collisions. It will NEVER move you to collide
// with the collidable objects. Which I guess is intended. But it means
// that savepoint will have to see if the player is within a certain
// radius every frame instead of doing the easy thing and just
// checking the collisions.
//if (confirm and state == 0) {
if (place_meeting(x, y, playerinteract) and confirm and state == 0) {
	global.can_move = false;
	textbox = instance_create_depth(0, 0, -9998, flavorer);
	textbox.text = ["* The sight of the unchanged\nflavor text fills you\n[color:#FF0000]with DETERMINATION[color:#FFFFFF]."];
	state = 1;
	_minutes = 0;
	_seconds = 0;
	audio_play_sound(heal, 1, 0);
	global.player_hp = global.player_maxhp;
}

if (state == 1) {
	if (!instance_exists(flavorer)) {
		state = 2;
		selected_option = 1;
	}
}

if (moved and state == 2) {
	if (selected_option == 1) {
		//show_error("changed", true);
		selected_option = 2;
	} else if (selected_option == 2) {
		selected_option = 1;
	}
}

if (selected_option == 1) {
	soul_x = 142;
	soul_y = 246;
} else if (selected_option == 2) {
	soul_x = 322;
	soul_y = 246;
	returntext = "Return";
}

if (confirm and state == 3) {
	state = 0;
	global.can_move = true;
}

if (confirm and state == 2 and selected_option == 1) {
	state = 3;
	global.savepoint = location;
	global.player_hp = global.player_maxhp;
	_seconds = global.seconds;
	_minutes = global.minutes;
	global.prevseconds = global.seconds;
	global.prevminutes = global.minutes;
	save_save_file("file0.ini");
	audio_play_sound(sn_save, 1, 0);
}
if (confirm and state == 2 and selected_option == 2) {
	state = 0;
	global.can_move = true;
}
