state = 0;

objecttext = ["* In this object's creation code,\nadd `objecttext = ['your text']\nso that text appears."];

destroyOnActivation = false;

item = noone;

objectclone = [];

if (global.can_menu == false or global.can_move == false) {
	instance_destroy(); // nope
	show_debug_message("flavored object did not create textbox because player either is in menu or cannot move");
}