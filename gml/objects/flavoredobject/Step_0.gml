var key_z = keyboard_check_pressed(ord("Z"));
var key_enter = keyboard_check_pressed(vk_enter);
var confirm = (key_z or key_enter);

if (place_meeting(x, y, playerinteract) and confirm and state == 0 and global.can_menu == true and global.can_move == true) {
	array_copy(objectclone, 0, objecttext, 0, array_length(objecttext));
	global.can_move = false;
	textbox = instance_create_depth(0, 0, -9998, flavorer);
	textbox.text = objectclone;
	textbox.text_voicebeep = voice;
	textbox.textspd = spd;
	textbox.textfont = font;
	textbox.portraits = portraits;
	textbox.textxoffset = text_x_offset;
	textbox.asterisk_sprite = asterisksprite;
	state = 1;
	if (item != noone) {
		addItem(item);
	}
}

if (state == 1) {
	if (!instance_exists(textbox)) {
		state = 0;
		global.can_move = true;
		if (destroyOnActivation) {
			instance_destroy();
		}
	}
}