var key_z = keyboard_check_pressed(ord("Z"));
var key_enter = keyboard_check_pressed(vk_enter);
var confirm = (key_z or key_enter);

if (preset == "sans") {
	preset = "none";
	voice = voicebp_sans;
	spd = 2;
	font = sansbattle;
	text_x_offset = 10; // note: this will monospace the font.
	                    // probably not the best idea, considering it's not ingame.
						// although, it doesn't actually look... too bad?
	textbox = noone;
	state = 0;
	textx = x - 18;
	texty = y - 12;
	line1y = 25;
	line2y = 45;
	line3y = 65;
}

if (state == 0) {
	textbox = instance_create_depth(0, 0, -9998, flavorer);
	// I am lowkenuienly losing my sanity coding this fucking game
	textbox.text = text;
	textbox.text_voicebeep = voice;
	textbox.textspd = spd;
	textbox.textfont = font; // welcome to jack in the box how can i help you tooday HHAHA!!!
	textbox.textxoffset = text_x_offset; // h elp
	textbox.draw_box = false;
	textbox.textbox_x = textx;
	textbox.textbox_y = texty;
	textbox.text_line1_offset_y = line1y;
	textbox.text_line2_offset_y = line2y;
	textbox.text_line3_offset_y = line3y;
	//textbox.text_rotation nope. there's no rotation
	state = 1;
}

if (state == 1) {
	if (!instance_exists(textbox)) {
		finished = true;
	}
}

if (finished) {
	instance_destroy(); // don't destroy on line 25 so that objects can check if the text is done
}