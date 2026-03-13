if (!variable_global_exists("player_initialized")) {
	global.player_initialized = true;
	
	// Don't overwrite variables if they were set before
	
	if (!variable_global_exists("can_move")) { global.can_move = true; }
	if (!variable_global_exists("can_menu")) { global.can_menu = true; }
	if (!variable_global_exists("player_name")) { global.player_name = "Chara"; }
	if (!variable_global_exists("player_lv")) { global.player_lv = 1; }
	if (!variable_global_exists("player_exp")) { global.player_exp = 0; }
	if (!variable_global_exists("player_kills")) { global.player_kills = 0; }
	if (!variable_global_exists("player_maxhp")) { global.player_maxhp = 16 + (4 * global.player_lv); }
	if (!variable_global_exists("player_hp")) { global.player_hp = global.player_maxhp; }
	if (!variable_global_exists("weapon")) { global.weapon = "Stick"; }
	if (!variable_global_exists("armor")) { global.armor = "Bandage"; }
	if (!variable_global_exists("inventory")) { global.inventory = []; }
	if (!variable_global_exists("player_gold")) { global.player_gold = 0; }
}

player_recalc_stats();
	
global.player_atkbonus = 0;
global.player_x1speed = global.player_speed;
global.player_x2speed = global.player_speed;
global.player_y1speed = global.player_speed;
global.player_y2speed = global.player_speed;
global.player_active = 67;

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