clock += 1;

z_pressed = keyboard_check_pressed(ord("Z"));
s_pressed = keyboard_check_pressed(ord("S"));
c_pressed = keyboard_check_pressed(ord("C"));
r_pressed = keyboard_check_pressed(ord("R"));
e_pressed = keyboard_check_pressed(ord("E"));
n_pressed = keyboard_check_pressed(ord("N"));
h_pressed = keyboard_check_pressed(ord("H"));
t_pressed = keyboard_check_pressed(ord("T"));

if (t_pressed) { // testing things
	dust = instance_create_depth(320 - (sprite_get_width(necroptosis_hand)/2), 16, -99999, duster);
	dust.dust_speed = 5;
}

if (clock == -29 and state != "starting") {
	audio_play_sound(bigreveal, 1, 0);
	instance_create_depth(-100, -100, -9999, time);
}

if (clock == 60 and state != "starting") {
	audio_play_sound(logoraise, 1, 0);
}
if (clock >= 60 and clock <= 120) {
	logo_y = lerp(logo_y, 30, 0.2);
}
if (clock == 120) {
	audio_play_sound(menu, 2, true);
	repeat (7) {
		instance_create_depth(irandom_range(0, 580), irandom_range(0, 437), 0, trapped);
	}
}

if (clock >= 120 and clock <= 180) {
	itemsopacity += 0.0165;
} 
if (clock == 181) {
	itemsopacity = 1;
}

if (clock >= 181) {
	if (state == "main") {
		if (z_pressed or s_pressed or c_pressed) {
			audio_play_sound(select, 1, 0);
		}
		if (z_pressed) {
			state = "starting";
			fade = instance_create_depth(0, 0, -9999, fader);
			fade.fadeOverFrames = 60;
			fade.image_alpha = 0;
			fade.startingOpacity = 0;
			fade.targetOpacity = 1;
			fade.mode = "fadeOut";
			fade.destroyOnFinish = false;
			clock = 0;
		}
		if (s_pressed) {
			state = "settingstransition";
		}
		if (c_pressed) {
			state = "creditstransition";
		}
	}
	if (state == "settingstransition") {
		maintexty = lerp(maintexty, -200, 0.2);
		settingstexty = lerp(settingstexty, 100, 0.2);
	
		if (settingstexty == 100 and maintexty == -200) {
			state = "settings";
		}
	}
	
	if (state == "settings") {
		if (r_pressed or e_pressed or n_pressed or h_pressed) {
			audio_play_sound(select, 1, 0);
		}
		if (r_pressed) {
			state = "maintransition_settings";
		}
		if (e_pressed) {
			if (global.mode == "Easy Mode") {
				global.mode = "Normal";
			} else {
				global.mode = "Easy Mode";
			}
		}
		if (n_pressed) {
			if (global.mode == "No Hit Mode") {
				global.mode = "Normal";
			} else {
				global.mode = "No Hit Mode";
			}
		}
		if (h_pressed) {
			if (global.mode == "No Heal Mode") {
				global.mode = "Normal";
			} else {
				global.mode = "No Heal Mode";
			}
		}
	}
	if (state == "maintransition_settings") {
		maintexty = lerp(maintexty, 200, 0.2);
		settingstexty = lerp(settingstexty, 500, 0.2);
	
		if (settingstexty == 500 and maintexty == 200) {
			state = "main";
		}
	}
	
	if (state == "maintransition_credits") {
		maintexty = lerp(maintexty, 200, 0.2);
		creditstexty = lerp(creditstexty, -200, 0.2);
	
		if (creditstexty == -200 and maintexty == 200) {
			state = "main";
		}
	}
	
	if (state == "creditstransition") {
		maintexty = lerp(maintexty, 500, 0.2);
		creditstexty = lerp(creditstexty, 200, 0.2);
	
		if (creditstexty == 200 and maintexty == 500) {
			state = "credits";
		}
	}
	
	if (state == "credits") {
		if (r_pressed) {
			state = "maintransition_credits";
			audio_play_sound(select, 1, 0);
		}
	}
}

if (state == "starting") {
	if (clock == 90) {
		audio_stop_all();
		room_goto(room_fight_ending);
	}
}

if (clock % 30 == 0 and thing == true) {
	thing = false;
	sanssprite = sans_sprite_1;
} else if (clock % 30 == 0 and thing == false) {
	thing = true;
	sanssprite = sans_sprite_2;
}

if (clock % 531 == 0 and state != "starting" and clock > 0) {
	repeat (7) {
		instance_create_depth(irandom_range(0, 524), irandom_range(0, 390), 0, trapped);
	}
}

if (clock % 900 == 0 and thing2 == true) {
	thing2 = false;
	sans_sprite_1 = sans_help_3;
	sans_sprite_2 = sans_help_4;
	sanssprite = sans_help_4;
	sansy = 150;
} else if (clock % 900 == 0 and thing2 == false) {
	thing2 = true;
	sans_sprite_1 = sans_help_1;
	sans_sprite_2 = sans_help_2;
	sanssprite = sans_help_2;
	sansy = 96;
}