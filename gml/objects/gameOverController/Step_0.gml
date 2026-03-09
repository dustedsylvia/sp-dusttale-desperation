timer += 1;

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
	audio_play_sound(gameOverMusic, 1, 0);
}

if (timer == 158) {
	state = 5;
	gameOverOpacity = 1;
	show_debug_message(textMgr);
	if (instance_exists(textManager)) {
		show_debug_message("A textManager instance exists!!!");
	} else {
		show_debug_message("Any textManager instance does not exist??");
	}
	if (instance_exists(textMgr)) {
		gameOverTextIndex = textMgr.createPagedText(160, 328, 15, dtf, true, gameOverText, c_white, false, 20, 36, false, asgoretalk);
	} else {
		show_error("textMgr does not contain a valid reference to an instance", true);
	}
}

if (state == 5) { // this is when the text is being drawn
	if ((textMgr.getPageIndex(gameOverTextIndex) == array_length(gameOverText) - 1) and (keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_enter))) {
		state = 6;
		textMgr.get_textsp()[gameOverTextIndex][4] = false;
	}
} else if (state == 6 and (keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_enter))) {
	state = 7;
	timer = 0;
}

if (timer == 29 and state >= 7) {
	katamari = instance_create_depth(0, 0, -9999, fader);
	katamari.fadeOverFrames = 12;
	room_goto(battle);
	audio_stop_all(); // You might not want to do this
	instance_destroy(textMgr); // um
	instance_destroy();
}