width = 575;
height = 140;
lerpwidth = 575;
lerpheight = 140;
lerpx = x;
lerpy = y;
lerpangle = image_angle;
lerp_speed = 0.3;
outline_thickness = 2;
outline_color = c_black;
int = instance_create_depth(x+5, y+5, depth-1, arenainteract);
col = instance_create_depth(x, y, depth-99, arenacollision);
//mask = instance_create_depth(x, y, depth-2, arenamask);

shakingang = true;
startang = image_angle;
shakeintensity = 20;
angclock = 0;

function MoveTo(newX, newY) {
	oldx = x;
	oldy = y;
	x = newX;
	y = newY;
	lerpx = newX;
	lerpy = newY;
	
	isNowCollidingWithSoul = false;
	with (col) {
		if (place_meeting(x, y, soul)) {
			other.isNowCollidingWithSoul = true;
		}
	}
	
	if (isNowCollidingWithSoul) {
		global.soul.x += newX - oldx;
		global.soul.y += newY - oldy;
		show_debug_message("Fixed soul position");
	}
}

function LerpTo(newX, newY) {
	lerpx = newX;
	lerpy = newY;
}

function LerpToSize(lerpWidth, lerpHeight) {
	lerpwidth = lerpWidth;
	lerpheight = lerpHeight;
}

function SetAngle(newAngle) {
	lerpangle = newAngle;
	image_angle = newAngle;
}

function LerpToAngle(newAngle) {
	lerpangle = newAngle;
}

function shakeang(startangle=image_angle, intensity=5) {
	shakingang = true;
	startang = startangle;
	image_angle = startangle;
	shakeintensity = intensity;
	angclock = 0;
	audio_play_sound(slam, 0.5, false);
}