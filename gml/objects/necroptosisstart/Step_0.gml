global.can_move = false;
global.can_menu = false;

if (debug) {
	audio_stop_all();
	global.prevroom = room;
	room_goto(room_necroptosis);
	instance_destroy(id);
	global.player_lv = 10;
	player_recalc_stats();
	global.player_hp = 56;
	global.weapon = "Real Knife";
	global.armor = "The Locket";
	global.weapon_atk = 99;
	global.armor_def = 99;
	exit;
}

if (init) {
	global.player_lv = 10;
	player_recalc_stats();
	global.player_hp = 56;
	global.weapon = "Real Knife";
	global.armor = "The Locket";
	global.weapon_atk = 99;
	global.armor_def = 99;
	init = false;
}

if (state == 0) {
	if (place_meeting(x, y, playerinteract)) {
		global.can_move = false;
		global.can_menu = false;
		state = 1;
	}
}

if (state == 1) {
	clock += 1;
	
	if (clock == 60) {
		global.playercutscenemoveup = true;
	}
	
	if (clock == 120) {
		global.playercutscenemoveup = false;
	}
	
	if (clock == 180) {
		textbox = instance_create_depth(0, 0, -9999, flavorer);
		textbox.text = ["* placeholder"];
		textbox.text_voicebeep = voicebp_sans;
		textbox.textspd = 2;
		textbox.textfont = comicsans;
		textbox.textxoffset = 16;
		textbox.asterisk_sprite = sansasterisk;
		//textbox.portraits = [sans_dialog_sad];
		//textbox.textbox_y = 15;
		drawDialog = true;
	}
	
	if (clock >= 180 and instance_find(flavorer, 0) == noone) {
		clock = 0;
		state = 2;
		drawDialog = false;
	}
}

if (state == 2) {
	clock += 1;
	
	if (clock == 1) {
		audio_stop_all();
		audio_play_sound(exclaimsnd, 1, false);
	}
	
	if (clock == 61) {
		audio_play_sound(noise, 1, false);
	}
	
	if (clock == 68) {
		audio_play_sound(noise, 1, false);
	}
	
	if (clock == 75) {
		audio_play_sound(noise, 1, false);
	}
}