var arrow_left = keyboard_check(vk_left);
var arrow_right = keyboard_check(vk_right);
var arrow_up = keyboard_check(vk_up);
var arrow_down = keyboard_check(vk_down);

var key_a = keyboard_check(ord("A")) and global.wasd_enabled;
var key_d = keyboard_check(ord("D")) and global.wasd_enabled;
var key_w = keyboard_check(ord("W")) and global.wasd_enabled;
var key_s = keyboard_check(ord("S")) and global.wasd_enabled;

var left = (arrow_left or key_a);
var right = (arrow_right or key_d);
var up = (arrow_up or key_w);
var down = (arrow_down or key_s);

if (x != lerpx) {
	x = lerp(x, lerpx, lerp_speed);
}

if (y != lerpy) {
	y = lerp(y, lerpy, lerp_speed);
}

if (global.battle_state == "enemyattack") {
	if (soulmode == "red") {
		if (left) {
			x -= move_speed;
			lerpx -= move_speed;
		}
		if (right) {
			x += move_speed;
			lerpx += move_speed;
		}
		if (up) {
			y -= move_speed;
			lerpy -= move_speed;
		}
		if (down) {
			y += move_speed;
			lerpy += move_speed;
		}
	
		x = clamp(x, global.arena.x+5, global.arena.x+global.arena.width-21);
		y = clamp(y, global.arena.y+5, global.arena.y+global.arena.height-21);
		lerpx = x;
		lerpy = y;
	} else if (soulmode == "blue") {
		bluevelocity += bluegravity;
		if (bluedir == "down") { y += bluevelocity; };
		if (bluedir == "left") { x -= bluevelocity; };
		if (bluedir == "up") { y -= bluevelocity; };
		if (bluedir == "right") { x += bluevelocity; };
		//if (clamp(y, 0, global.arena.y+global.arena.height-21) != y) { // we must be on the ground
		if (y >= global.arena.y+global.arena.height-21) {
			bluevelocity = 0; // reset velocity
			y -= bluevelocity; // move soul back
			canjump = true;
		} else { // we are NOT on the ground
			canjump = false;
		}
		
		if (left) {
			x -= move_speed;
			lerpx -= move_speed;
		}
		if (right) {
			x += move_speed;
			lerpx += move_speed;
		}
		if (up and canjump) { // jump was js pressed
			bluevelocity = -4.4;
			canjump = false;
			jumping = true;
		}
		if (jumping and !up) {
			bluevelocity = 0;
			jumping = false;
		}
		if (jumping and bluevelocity >= 0) {
			jumping = false;
		}
		x = clamp(x, global.arena.x+5, global.arena.x+global.arena.width-21);
		y = clamp(y, global.arena.y+5, global.arena.y+global.arena.height-21);
		lerpx = x;
		lerpy = y;
	}
}

collisionclock += 1;
if (collisionclock % 2 == 0) {
	if (place_meeting(x, y, gasterbeam)) {
		global.hpbar.applykr(1);
	}
}