lerpx = x;
lerpy = y;
lerp_speed = 0.3;

base_speed = 2.5;
move_speed = 2.5;

soulmode = "red";
bluevelocity = 0;
bluegravity = 0.12;
bluedir = "down";
canjump = false;
jumping = false;
collisionclock = 0;
grounded = false;

emergencyx = 300;
emergencyy = 300;

function MoveTo(newX, newY) {
	x = newX;
	y = newY;
	lerpx = newX;
	lerpy = newY;
}

function LerpTo(lerpX, lerpY) {
	lerpx = lerpX;
	lerpy = lerpY;
}

function TurnBlue(newDirection) {
	sprite_index = bluesoul;
	bluedir = newDirection;
	bluevelocity = 0;
	soulmode = "blue";
	if (bluedir == "down") { image_index = 0; };
	if (bluedir == "left") { image_index = 1; };
	if (bluedir == "up") { image_index = 2; };
	if (bluedir == "right") { image_index = 3; };
	var e = instance_create_depth(x+8, y+8, depth-1, enhancer);
	e.sprite_index = centeredbluesoul;
	e.image_index = image_index;
	e.image_angle = image_angle;
	e.image_xscale = image_xscale;
	e.image_yscale = image_yscale;
	audio_play_sound(eyeflash, 0.5, false);
}

function SlamBlue(newDirection="keepExisting") {
	sprite_index = bluesoul;
	soulmode = "blue";
	if (newDirection != "keepExisting") { bluedir = newDirection; };
	bluevelocity = 10;
	if (bluedir == "down") { image_index = 0; };
	if (bluedir == "left") { image_index = 1; };
	if (bluedir == "up") { image_index = 2; };
	if (bluedir == "right") { image_index = 3; };
}

function TurnRed() {
	sprite_index = redsoul;
	soulmode = "red";
	var e = instance_create_depth(x+8, y+8, depth-1, enhancer);
	e.sprite_index = centeredredsoul;
	e.image_index = image_index;
	e.image_angle = image_angle;
	e.image_xscale = image_xscale;
	e.image_yscale = image_yscale;
	audio_play_sound(eyeflash, 0.5, false);
}

function OnPlatform(tstx=x, tsty=y) {
	if (soulmode == "blue") {
		var tmp = instance_create_depth(x+8, y+8, 0, dumbasssolution);
		tmp.image_index = image_index;
		idontknowhowelsetodothisok = false;
		switch (bluedir) {
			case "down":
				with (tmp) {
					if (other.bluevelocity >= 0.03 and place_meeting(x, y, platform)) {
						if (instance_place(x, y, platform).image_angle == 0) {
							other.idontknowhowelsetodothisok = true;
						}
					}
				}
			break;
		
			case "up":
				with (tmp) {
					if (other.bluevelocity >= -0.03 and place_meeting(x, y, platform)) {
						if (instance_place(x, y, platform).image_angle == 180) {
							other.idontknowhowelsetodothisok = true;
						}
					}
				}
			break;
		
			case "left":
				with (tmp) {
					if (other.bluevelocity >= -0.03 and place_meeting(x, y, platform)) {
						if (instance_place(x, y, platform).image_angle == 270) {
							other.idontknowhowelsetodothisok = true;
						}
					}
				}
			break;
		
			case "right":
				with (tmp) {
					if (other.bluevelocity >= 0.03 and place_meeting(x, y, platform)) {
						if (instance_place(x, y, platform).image_angle == 90) {
							other.idontknowhowelsetodothisok = true;
						}
					}
				}
			break;
		}
		instance_destroy(tmp);
		return idontknowhowelsetodothisok;
	} else if (soulmode == "red") {
		if (place_meeting(tstx, tsty, platform)) { return true; }
	}
}

function InWall(tstx, tsty) {
	var t = instance_create_depth(tstx, tsty, 0, wallchk);
	thing = false;
	with (t) {
		if (place_meeting(tstx, tsty, arenacollision)) {
			other.thing = true;
		}
		instance_destroy();
	}
	return thing;
}

function InArena(tstx, tsty) {
	var t = instance_create_depth(tstx, tsty, 0, wallchk);
	thing = false;
	with (t) {
		if (place_meeting(tstx, tsty, arenainteract)) {
			other.thing = true;
		}
		instance_destroy();
	}
	return thing;
}