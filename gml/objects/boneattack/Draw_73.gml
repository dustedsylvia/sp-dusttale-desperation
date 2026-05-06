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