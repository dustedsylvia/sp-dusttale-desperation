timer += 0.5;

if (timer == 20 and state == 1) {
	state = 2;
	audio_play_sound(break1, 1, 0);
}

if (timer == 60) {
	state = 3;
	audio_play_sound(break2, 1, 0);
}

if (timer == 108) {
	state = 4;
	audio_play_sound(gameovermusic, 1, 0);
}

if (timer == 158) {
	state = 5;
	gameoveropacity = 1;
	gameoverflavorer = instance_create_depth(0, 0, depth-3, flavorer);
	gameoverflavorer.textbox_x = 125;
	gameoverflavorer.textbox_y = 300;
	gameoverflavorer.text_voicebeep = voicebp_asgore;
	gameoverflavorer.text = gameovertext;
	gameoverflavorer.draw_box = false;
}

if (state == 5) { // this is when the text is being drawn
	if (!instance_exists(gameoverflavorer) and (keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_enter))) {
		state = 6;
		timer = 0;
	}
}

if (timer == 29 and state >= 6) {
	var fade = instance_create_depth(0, 0, -9999, fader);
	fade.bounce = true;
	fade.fadeOverFrames = 20;
	fade.startingOpacity = 0;
	fade.targetOpacity = 1;
	fade.executeOnFirstBounce = function() {
		load_save_file("file0.ini");
		instance_destroy(gameovercontroller);
		audio_stop_all();
	}
	fade.executeOnCompletion = function() {
		global.in_battle = false;
		global.can_move = true;
		global.can_menu = true;
	}
	fade.mode = "fadeOut";
}