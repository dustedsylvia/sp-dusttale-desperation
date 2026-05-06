// THANKS TO https://yal.cc/gamemaker-draw-clip/ FOR THIS!!!!!!!!!!!!!!!!!!!
// i genuinely want to kiss the writer of that article on the lips

// ok well maybe not but like

//if (!array_equals([global.arena.sprite_index, global.arena.image_index, global.arena.x, global.arena.y, global.arena.image_xscale, global.arena.image_yscale, global.arena.image_angle, global.arena.image_alpha], arena_properties)) {
//	redrawMask = true;
//	arena_properties = [global.arena.sprite_index, global.arena.image_index, global.arena.x, global.arena.y, global.arena.image_xscale, global.arena.image_yscale, global.arena.image_angle, global.arena.image_alpha];
//} else {
//	show_debug_message("didnt make new surface"); // undertale to dust reference
//}

//if (!surface_exists(mask_surface)) {

global.drewMaskSurfacesPhaseOne = false;
global.drewMaskSurfacesPhaseTwo = false;
global.clearedClipSurface = false;

if (maskToArena) {
	surface_set_target(global.bone_clip_surface);

	if (!global.clearedClipSurface) { // wait, shouldn't this happen at the start of the frame...?
		global.clearedClipSurface = true;
		//draw_clear_alpha(c_black, 0);	
	}

	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_color, image_alpha);
	surface_reset_target();
} else {
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_color, image_alpha);
}