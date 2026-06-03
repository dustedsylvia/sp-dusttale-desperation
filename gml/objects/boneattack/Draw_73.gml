var s = delta_time;

if (!global.drewMaskSurfacesPhaseTwo) {
	global.drewMaskSurfacesPhaseTwo = true;	
	surface_set_target(global.bone_clip_surface);
	gpu_set_blendmode(bm_subtract);
	draw_surface(global.bone_mask_surface, 0, 0);
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
	// finish and draw the clip-surface itself:
	draw_surface(global.bone_clip_surface, 0, 0);
	
	//show_debug_message("Redrew surfaces phase 2 at frame " + string(current_time));
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