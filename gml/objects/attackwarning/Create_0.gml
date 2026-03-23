xvel = 0;
yvel = 0;
rotvel = 0;
alphavel = -0.03;
xscalevel = 0;
yscalevel = 0;

playSound = true;

lerpspeed = 0.3;
lerpxspeed = xvel;

deleteAfterFrames = 30;

destroyOnInvisibility = true;

if (!variable_global_exists("bone_mask_surface")) { global.bone_mask_surface = -1; };
if (!variable_global_exists("bone_clip_surface")) { global.bone_clip_surface = -1; };

lerpToXSpeed = function(newXSpeed){
	lerpxspeed = newXSpeed;
}

// (c)opyright arena 2026-
// dont sue me btw this is a joke bc i stole the math from the arena object
// which ***I*** wrote so actually i cant get sued
// procrastination final boss: writing comments instead of code
resize = function(newWidth, newHeight) {
	image_xscale = newWidth / sprite_get_width(sprite_index);
	image_yscale = newHeight / sprite_get_height(sprite_index);
}