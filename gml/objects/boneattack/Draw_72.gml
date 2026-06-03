var s = delta_time;

if (!global.drewMaskSurfacesPhaseOne) {
	global.drewMaskSurfacesPhaseOne = true;
	
	//if (!array_equals([global.arena.sprite_index, global.arena.image_index, global.arena.x, global.arena.y, global.arena.image_xscale, global.arena.image_yscale, global.arena.image_angle, global.arena.image_alpha], arena_properties)) {
	//	redrawMask = true;
	//	arena_properties = [global.arena.sprite_index, global.arena.image_index, global.arena.x, global.arena.y, global.arena.image_xscale, global.arena.image_yscale, global.arena.image_angle, global.arena.image_alpha];
	//}
	
	//if (!surface_exists(global.bone_mask_surface) or redrawMask) {
		//redrawMask = false;
	if (surface_exists(global.bone_mask_surface)) {
		surface_free(global.bone_mask_surface);
	}
	
	if (surface_exists(global.bone_clip_surface)) {
		surface_free(global.bone_clip_surface);
	}
	
	global.bone_mask_surface = surface_create(room_width, room_height);
	surface_set_target(global.bone_mask_surface);
	draw_clear(c_black);
	//gpu_set_blendmode(bm_subtract);
	//draw_sprite_ext(global.arena.sprite_index, global.arena.image_index, global.arena.x, global.arena.y, global.arena.image_xscale, global.arena.image_yscale, global.arena.image_angle, #FFFFFF, 1);
	//gpu_set_blendmode(bm_normal);
	surface_reset_target();
	//show_debug_message("Made new surface at " + string(current_time));
	//}
	
	if (!surface_exists(global.bone_clip_surface)) {
		global.bone_clip_surface = surface_create(room_width, room_height);
	}
	
	surface_set_target(global.bone_clip_surface);
	gpu_set_blendmode(bm_subtract);
	draw_surface(global.bone_mask_surface, 0, 0);
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
	
	//show_debug_message("Redrew surfaces phase one at frame " + string(current_time));
}

// oh lord have mercy

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