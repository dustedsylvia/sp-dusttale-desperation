xvel = 0;
yvel = 0;
rotvel = 0;
alphavel = 0;
xscalevel = 0;
yscalevel = 0;
karma = 3;

length = sprite_get_height(sprite_index);
lerplength = length;
lerpspeed = 0.3;

lerpxspeed = xvel;

type = "white";

destroyIfNotTouchingArena = false;

image_color = #FFFFFF;

removeThisOnDestroy = -1;

initLen = true;
lengthspeed = 1;
lengthmin = 12;
lengthmax = 640;
state = 1;
lengthing = false;

centerpivoted = false;

if (!variable_global_exists("bone_mask_surface")) { global.bone_mask_surface = -1; };
if (!variable_global_exists("bone_clip_surface")) { global.bone_clip_surface = -1; };

//arena_properties = [global.arena.sprite_index, global.arena.image_index, global.arena.x, global.arena.y, global.arena.image_xscale, global.arena.image_yscale, global.arena.image_angle, global.arena.image_alpha];
//redrawMask = false;

lerpToLength = function(newLength) {
	lerplength = newLength;
}

lerpToXSpeed = function(newXSpeed) {
	lerpxspeed = newXSpeed;
}

lengthbetween = function(minimum, maximum, length_speed=1, startingState=1) {
	lengthspeed = length_speed;
	lengthmin = minimum;
	lengthmax = maximum;
	state = startingState;
	lengthing = true;
}