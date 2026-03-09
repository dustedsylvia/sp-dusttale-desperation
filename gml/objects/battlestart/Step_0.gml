if (state == 0) {
	if (place_meeting(x, y, playerinteract)) {
		global.can_move = false;
		global.can_menu = false;
		state = 1;
	}
}

if (state == 1) {
	clock += 1;
	
	if (clock == 1) {
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