if (!variable_global_exists("player_initialized")) {
	global.player_initialized = true;
	
	global.can_move = true;
	global.can_menu = true;
	global.player_name = "Chara";
	global.player_lv = 1;
	global.player_exp = 0;
	global.player_maxhp = 16 + (4 * global.player_lv);
	global.player_hp = global.player_maxhp;
	global.weapon = "Stick";
	global.armor = "Bandage";
	global.inventory = [];
	global.player_gold = 0;
	
	switch global.weapon {
		case "Stick":
			global.weapon_atk = 0;
		break;
	}
	
	switch global.armor {
		case "Bandage":
			global.armor_def = 0;
		break;
	}
	
	global.player_atk = (-2 + (2 * global.player_lv)) + global.weapon_atk;
	global.player_def = ((global.player_lv - 1) / 4) + global.armor_def;
	global.player_speed = 2.5;//5; // 2.5 for 60fps
	global.player_x1speed = global.player_speed;
	global.player_x2speed = global.player_speed;
	global.player_y1speed = global.player_speed;
	global.player_y2speed = global.player_speed;
}

global.player_x = x;
global.player_y = y;

image_speed = 0;
image_xscale = 2;
image_yscale = 2;

friskleft = s_frisk_left;
friskright = s_frisk_right;
friskdown = s_frisk_down;
friskup = s_frisk_up;

solidObjects = [playercollision, savepoint];

player_int = noone;

prevx = x;
prevy = y;

movedlastframe = false;

inmenu = false;

menusel = 1;
menustate = 0;

camera = noone;
camera_x = 0;
camera_y = 0;

colliding = function(playerx=x, playery=y) {
	for (var i = 0; i < array_length(solidObjects); i++) {
		if (place_meeting(playerx, playery, solidObjects[i])) {
			return solidObjects[i];
		}
	}
	
	return false;
}