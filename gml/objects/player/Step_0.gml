// Scroll to the bottom for very important information (not scrollbait)

if (global.player_active == false) {
	global.can_move = false;
	global.can_menu = false;
	image_alpha = 0;
	global.player_active = -67;
} else if (global.player_active == true) {
	global.can_move = true;
	global.can_menu = true;
	image_alpha = 1;
	global.player_active = 67;
}

if (global.player_active == -67) {
	exit; // don't run this event, the player has been deactivated by a cutscene or sum idk
}

var leftp = keyboard_check_pressed(vk_left);
var rightp = keyboard_check_pressed(vk_right);
var upp = keyboard_check_pressed(vk_up);
var downp = keyboard_check_pressed(vk_down);

var left = keyboard_check(vk_left);
var right = keyboard_check(vk_right);
var up = keyboard_check(vk_up);
var down = keyboard_check(vk_down);

var menukey = keyboard_check_pressed(ord("C")) or keyboard_check_pressed(vk_control);
var confirm = keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_enter);
var cancel = keyboard_check_pressed(ord("X")) or keyboard_check_pressed(vk_shift);


if (!instance_exists(playerinteract)) {
	player_int = instance_create_depth(x - 1, y, -9999, playerinteract);
}

if (global.can_move == true) {
	// check collisions
	global.player_x1speed = global.player_speed;
	global.player_x2speed = global.player_speed;
	global.player_y1speed = global.player_speed;
	global.player_y2speed = global.player_speed;
	
	if (colliding(x - global.player_x1speed, y) != false) {
		global.player_x1speed = distance_to_object(colliding(x - global.player_x1speed, y));
	}
	if (colliding(x + global.player_x2speed, y) != false) {
		global.player_x2speed = distance_to_object(colliding(x + global.player_x2speed, y));
	}
	if (colliding(x, y - global.player_y1speed) != false) {
		global.player_y1speed = distance_to_object(colliding(x, y - global.player_y1speed));
	}
	if (colliding(x, y + global.player_y2speed) != false) {
		global.player_y2speed = distance_to_object(colliding(x, y + global.player_y2speed));
	}
	
	if (left) {
		x -= global.player_x1speed;
		//if (!right and !down and !up) {
		if (!right) {
			sprite_index = friskleft;
		}
	}
	if (right) {
		x += global.player_x2speed;
		//if (!left and !down and !up) {
		if (!left) {
			sprite_index = friskright;
		}
	}
	if (up) {
		y -= global.player_y1speed;
		//if (!right and !down and !left) {
		if (!down) {
			sprite_index = friskup;
		}
	}
	if (down) {
		y += global.player_y2speed;
		//if (!right and !left and !up) {
		if (!up) {
			sprite_index = friskdown;
		}
	}
}

if (menukey and global.can_menu == true) {
	global.can_move = false;
	global.can_menu = false;
	inmenu = true;
	menukey = false;
	menustate = 1;
	audio_play_sound(movemenu, 1, 0);
}

if (inmenu) {
	if (menustate == 1) {
		if (upp) {
			menusel -= 1;
			if (menusel == 0) {
				menusel = 2;
			}
			audio_play_sound(movemenu, 1, 0);
		}
		if (downp) {
			menusel += 1;
			if (menusel == 3) {
				menusel = 1;
			}
			audio_play_sound(movemenu, 1, 0);
		}
	}
	if (menukey) {
		global.can_move = true;
		global.can_menu = true;
		inmenu = false;
		menukey = false;
	}
	if (confirm) {
		if (menusel == 1) {
			audio_play_sound(select, 1, 0);
			if (array_length(global.inventory) != 0) {
				menustate = 2;
			}
		}
		if (menusel == 2) {
			menustate = 3;
			audio_play_sound(select, 1, 0);
		}
	}
	if (cancel) {
		if (menustate == 3 or menustate == 2) {
			menustate = 1;
			audio_play_sound(movemenu, 1, 0);
		} else if (menustate == 1) {
			global.can_move = true;
			global.can_menu = true;
			inmenu = false;
			menukey = false;
		}
	}
}

try { // weirdly this causes issues so we have to use a try statement
	  // edit i was being stupid. it breaks when there's two player objects.
	  // so just don't put two player objects ffs
	player_int.x = x - 1; // otherwise the left collisions won't work right
	player_int.y = y;
} catch (e) {};

if (prevx == x and prevy == y) {
	image_speed = 0;
	image_index = 0;
} else {
	image_speed = 1;
}

prevx = x;
prevy = y;

// UT style camera follow
camera = view_get_camera(0);
camera_x = camera_get_view_x(camera);
camera_y = camera_get_view_y(camera);
camera_w = camera_get_view_width(camera);
camera_h = camera_get_view_height(camera);

if (global.resetcam == true) {
	camera_x = x - 300;
	camera_y = y - 210;
	global.resetcam = false;
}

if (camera_x >= 0 and camera_x <= room_width - camera_w and x - 300 >= 0 and x - 300 <= room_width - camera_w) {
	// 320 - (sprite_width * sprite_xscale) / 2
	// 320 - (20 * 2) / 2
	// 320 - 20
	// 300
	camera_x = x - 300;
	//show_debug_message("set camera_x to " + string(camera_x));
} else {
	//if (camera_x <= 0 or x - 300 <= 0) { show_debug_message("setting camera_x to 0 because camera_x is " + string(camera_x)); camera_x = 0; }
	//else if (camera_x >= room_width - camera_w or x - 300 >= room_width - camera_w) { show_debug_message("setting camera_x to " + string(room_width - camera_w) + " because camera_x is " + string(camera_x)); camera_x = room_width - camera_w; }
	if (camera_x <= 0 or x - 300 <= 0) { camera_x = 0; }
	else if (camera_x >= room_width - camera_w or x - 300 >= room_width - camera_w) { camera_x = room_width - camera_w; }
}

if (camera_y >= 0 and camera_y <= room_height - camera_h and y - 210 >= 0 and y - 210 <= room_height - camera_h) {
	// 240 - (sprite_height * sprite_yscale) / 2
	// 240 - (30 * 2) / 2
	// 240 - 30
	// 210
	camera_y = y - 210;
	//show_debug_message("set camera_y to " + string(camera_y))
} else {
	//if (camera_y <= 0 or y - 210 <= 0) { show_debug_message("setting camera_y to 0 because camera_y is " + string(camera_y)); camera_y = 0; }
	//else if (camera_y >= room_height - camera_h or y - 210 >= room_height - camera_h) { show_debug_message("setting camera_y to " + string(room_height - camera_h) + " because camera_y is " + string(camera_y)); camera_y = room_height - camera_h; }
	if (camera_y <= 0 or y - 210 <= 0) { camera_y = 0; }
	else if (camera_y >= room_height - camera_h or y - 210 >= room_height - camera_h) { camera_y = room_height - camera_h; }
}

camera_set_view_pos(camera, camera_x, camera_y);
//show_debug_message("Camera X is now " + string(camera_get_view_x(camera)) + " and camera Y is now " + string(camera_get_view_y(camera)));

// so the player's movement works fine. the code that picks which sprite the player
// uses is flawed. there's three versions:
// one (this is commented out on lines 49, 60, 71, and 82) seems more canon to
// undertale until you press more than two arrows at a time. then it all breaks.
// two (this is the one being used right now) works with 3+ directional inputs
// but looks strange. it looks better than the player moonwalking though imo so
// that's the one i left in.
// three (this one hasn't been written yet) saves the direction the player is
// currently moving in. when a new key is pressed, check and see if the arrow
// corresponding to that direction is still being pressed. if it is don't do
// anything. if it isn't change the sprite.

// oh also for some reason when going down and only holding that key it works
// fine but when holding other keys (ex going down left) it only does the first
// two frames of the animation?? i dont know its weird