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

if (keyboard_check(ord("X")) or keyboard_check(vk_shift)) {
	move_speed = base_speed/2;
} else {
	move_speed = base_speed;
}

if (x != lerpx) {
	x = lerp(x, lerpx, lerp_speed);
}

if (y != lerpy) {
	y = lerp(y, lerpy, lerp_speed);
}

if (global.battle_state == "enemyattack") {
	if (soulmode == "red") {
		var tmpx = x;
		var tmpy = y;
		
		if (left) {
			tmpx -= move_speed;
			if (OnPlatform(tmpx, y)) {
				tmpx += move_speed;
			}
		}
		if (right) {
			tmpx += move_speed;
			if (OnPlatform(tmpx, y)) {
				tmpx -= move_speed;
			}
		}
		if (up) {
			tmpy -= move_speed;
			if (OnPlatform(x, tmpy)) {
				tmpy += move_speed;
			}
		}
		if (down) {
			tmpy += move_speed;
			if (OnPlatform(x, tmpy)) {
				tmpy -= move_speed;
			}
		}
		
		// collisions brought to you by collisions r us
		
		if (!place_meeting(tmpx, y, arenacollision)) {
			x = tmpx;
			lerpx = x;
		} else {
			x = round(x);
			var tmpx2 = x;
			var maxIterations = 15; // there is a possibility of an infinite loop here
			do { // this patches that
				tmpx2 += 1;
				maxIterations -= 1;
			} until (place_meeting(tmpx2, y, arenacollision) or maxIterations == 0);
			if (maxIterations == 0) {
				tmpx2 -= 15;
			} else {
				tmpx2 -= 1;
			}
			if (abs(tmpx2 - x) > move_speed) { // we went the wrong direction...
				maxIterations = 15;
				do {
					tmpx2 -= 1;
					maxIterations -= 1;
				} until (place_meeting(tmpx2, y, arenacollision) or maxIterations == 0);
				if (maxIterations == 0) {
					tmpx2 += 15;
				} else {
					tmpx2 += 1;
				}
			}
			x = tmpx2;
		}
		if (!place_meeting(x, tmpy, arenacollision)) {
			y = tmpy;
			lerpy = y;
		} else {
			y = round(y);
			var tmpy2 = y;
			var maxIterations = 15;
			do {
				tmpy2 += 1;
				maxIterations -= 1;
			} until (place_meeting(x, tmpy2, arenacollision) or maxIterations == 0);
			if (maxIterations == 0) {
				tmpy2 -= 15;
			} else {
				tmpy2 -= 1;
			}
			if (abs(tmpy2 - y) > move_speed) { // we went the wrong direction...
				maxIterations = 15;
				do {
					tmpy2 -= 1;
					maxIterations -= 1;
				} until (place_meeting(x, tmpy2, arenacollision) or maxIterations == 0);
				if (maxIterations == 0) {
					tmpy2 += 15;
				} else {
					tmpy2 += 1;
				}
			}
			y = tmpy2;
		}
		
		if (y >= global.arena.y) {
			if (InWall(x, y)) {
				var backup = y;
				do {
					y -= 1;
				} until (!InWall(x, y));
				if (!InArena(x, y)) {
					y = backup;
				}
			}
		} else {
			if (InWall(x, y)) {
				var backup = y;
				do {
					y += 1;
				} until (!InWall(x, y));
				if (!InArena(x, y)) {
					y = backup;
				}
			}
		}
		
		// final check
		if (x >= global.arena.x) {
			if (InWall(x, y)) {
				var backup = x;
				do {
					x -= 1;
				} until (!InWall(x, y));
				if (!InArena(x, y)) {
					x = backup;
				}
			}
		} else {
			if (InWall(x, y)) {
				var backup = x;
				do {
					x += 1;
				} until (!InWall(x, y));
				if (!InArena(x, y)) {
					x = backup;
				}
			}
		}
		
	} else if (soulmode == "blue") {
		// in case you're wondering, there *is* code to deal with the arena being rotated.
		// it just doesn't work very well, so i've kept in the reliable version that
		// doesn't take into account arena rotates.
		// if you *really* need to rotate the arena when you're blue, you can
		// try to fix the commented out code.
		// i...wouldn't recommend it. you should probably just write some new code
		// from scratch.
		var tmpx = x;
		var tmpy = y;
		
		bluevelocity += bluegravity;
		if (bluedir == "down") {
			//if (!grounded) { y += bluevelocity; }
			y += bluevelocity;
			if (y >= global.arena.y+(global.arena.height/2)-21 or OnPlatform()) { // must be on ground
			//if (place_meeting(tmpx, y, arenacollision) or OnPlatform()) { // must be on ground
				y -= bluevelocity; // move soul back
				bluevelocity = 0; // reset velocity
				canjump = true;
				grounded = true;
			} else { // we are NOT on the ground
				canjump = false;
				grounded = false;
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
			
			//if (InWall(tmpx, tmpy)) {
			//	var backup = tmpy;
			//	do {
			//		tmpy -= 1;
			//	} until (!InWall(tmpx, tmpy));
			//	if (!InArena(tmpx, tmpy)) {
			//		tmpy = backup; // we are NOT in the arena
			//	}
			//}
		}
		
		if (bluedir == "left") {
			x -= bluevelocity;
			if (x <= global.arena.x-(global.arena.width/2)+5 or OnPlatform()) { // must be on ground
				x += bluevelocity; // move soul back
				bluevelocity = 0; // reset velocity
				canjump = true;
			} else { // we are NOT on the ground
				canjump = false;
			}
		
			if (up) {
				y -= move_speed;
				lerpy -= move_speed;
			}
			if (down) {
				y += move_speed;
				lerpy += move_speed;
			}
			if (right and canjump) {
				bluevelocity = -4.4;
				canjump = false;
				jumping = true;
			}
			if (jumping and !right) {
				bluevelocity = 0;
				jumping = false;
			}
			if (jumping and bluevelocity >= 0) {
				jumping = false;
			}
		}
		
		if (bluedir == "up") {
			y -= bluevelocity;
			if (y <= global.arena.y-(global.arena.height/2)+5 or OnPlatform()) { // must be on ground
				y += bluevelocity; // move soul back
				bluevelocity = 0; // reset velocity
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
			if (down and canjump) { // jump was js pressed
				bluevelocity = -4.4;
				canjump = false;
				jumping = true;
			}
			if (jumping and !down) {
				bluevelocity = 0;
				jumping = false;
			}
			if (jumping and bluevelocity >= 0) {
				jumping = false;
			}
		}
		
		if (bluedir == "right") {
			x += bluevelocity;
			if (x >= global.arena.x+(global.arena.width/2)-21 or OnPlatform()) { // must be on ground
				x -= bluevelocity; // move soul back
				bluevelocity = 0; // reset velocity
				canjump = true;
			} else { // we are NOT on the ground
				canjump = false;
			}
		
			if (up) {
				y -= move_speed;
				lerpy -= move_speed;
			}
			if (down) {
				y += move_speed;
				lerpy += move_speed;
			}
			if (left and canjump) {
				bluevelocity = -4.4;
				canjump = false;
				jumping = true;
			}
			if (jumping and !left) {
				bluevelocity = 0;
				jumping = false;
			}
			if (jumping and bluevelocity >= 0) {
				jumping = false;
			}
		}
		
		x = clamp(x, global.arena.x-(global.arena.width/2)+5, global.arena.x+(global.arena.width/2)-21); // 21 comes from the soul's width + the arena's border's width
		y = clamp(y, global.arena.y-(global.arena.height/2)+5, global.arena.y+(global.arena.height/2)-21);
		lerpx = x;
		lerpy = y;
		
		//if (!place_meeting(tmpx, y, arenacollision)) {
		//	x = tmpx;
		//	lerpx = x;
		//} else {
		//	x = round(x);
		//	var tmpx2 = x;
		//	var ctr = 0;
		//	do {
		//		tmpx2 += 1;
		//		ctr += 1;
		//	} until (place_meeting(tmpx2, y, arenacollision) or ctr >= 15); // Stop infinite loops
		//	tmpx2 -= 1;
		//	if (abs(tmpx2 - x) > move_speed) { // we went the wrong direction...
		//		var ctr2 = 0;
		//		do { // furry dick is so much better than regular dick
		//			tmpx2 -= 1; // like omg its so hot
		//			ctr2 += 1; // uhhgughguhg i want to be leaking from furry cum
		//		} until (place_meeting(tmpx2, y, arenacollision) or ctr2 >= 15);
		//		tmpx2 += 1; // mmmmmmph..........
		//	}
		//	x = tmpx2;
		//}
		//if (!place_meeting(x, tmpy, arenacollision)) {
		//	y = tmpy;
		//	lerpy = y;
		//} else {
		//	y = round(y);
		//	var tmpy2 = y;
		//	var ctr = 0;
		//	do {
		//		tmpy2 += 1;
		//		ctr += 1;
		//	} until (place_meeting(x, tmpy2, arenacollision) or ctr >= 15);
		//	tmpy2 -= 1;
		//	if (abs(tmpy2 - y) > move_speed) { // we went the wrong direction...
		//		var ctr2 = 0;
		//		do {
		//			tmpy2 -= 1;
		//			ctr2 += 1;
		//		} until (place_meeting(x, tmpy2, arenacollision) or ctr2 >= 15);
		//		tmpy2 += 1;
		//	}
		//	y = tmpy2;
		//}
		
		//if (!InArena(x, y)) {
		//	x = emergencyx;
		//	y = emergencyy;
		//}
	}
}

collisionclock += 1;
if (collisionclock % 2 == 0) {
	if (place_meeting(x, y, gasterbeam)) {
		global.hpbar.applykr(1);
		audio_play_sound(playerhit, 1, false);
	}
	if (place_meeting(x, y, boneattack)) {
		var collidedbone = instance_place(x, y, boneattack);
		if (collidedbone != noone) {
			if (collidedbone.type == "white" or (collidedbone.type == "blue" and (up or down or left or right)) or (collidedbone.type == "orange" and (!up and !down and !left and !right))) {
				global.hpbar.applykr(collidedbone.karma);
				collidedbone.karma = 1;
				audio_play_sound(playerhit, 1, false);
			}
		}
	}
}