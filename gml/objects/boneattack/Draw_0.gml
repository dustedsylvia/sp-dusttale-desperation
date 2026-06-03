var s = delta_time;

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

if (delta_time - s >= global.lag_spike_threshold_time) {
	show_debug_message($"Lagspike detected!");
	show_debug_message($"Details:");
	show_debug_message($"Spike time: \"{delta_time - s}\"");
	show_debug_message($"_GMFUNCTION_: \"{_GMFUNCTION_}\"");
	show_debug_message($"Object: \"{object_get_name(object_index)}\"");
	show_debug_message($"Event: \"{event_type}:{event_number}\"");
	show_debug_message($"Callstack:");
	show_debug_message($"   0: \"{debug_get_callstack()[0]}\"");
	show_debug_message($"   1: \"{debug_get_callstack()[1]}\"");
	show_debug_message($"End details.");
}