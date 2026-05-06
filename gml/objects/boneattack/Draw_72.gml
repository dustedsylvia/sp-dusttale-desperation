if (!global.drewMaskSurfacesPhaseOne) {
	global.drewMaskSurfacesPhaseOne = true;
	
	//if (!array_equals([global.arena.sprite_index, global.arena.image_index, global.arena.x, global.arena.y, global.arena.image_xscale, global.arena.image_yscale, global.arena.image_angle, global.arena.image_alpha], arena_properties)) {
	//	redrawMask = true;
	//	arena_properties = [global.arena.sprite_index, global.arena.image_index, global.arena.x, global.arena.y, global.arena.image_xscale, global.arena.image_yscale, global.arena.image_angle, global.arena.image_alpha];
	//}
	
	//if (!surface_exists(global.bone_mask_surface) or redrawMask) {
		//redrawMask = false;
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