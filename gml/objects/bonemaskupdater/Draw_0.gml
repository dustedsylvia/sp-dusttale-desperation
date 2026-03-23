// make sure this things depth is higher than the arena's depth
// ...or just put this code in all the events you can. (not recommended)

if (surface_exists(global.bone_mask_surface) and (x != global.arena.int.x or y != global.arena.int.y or image_xscale != global.arena.int.image_xscale or image_yscale != global.arena.int.image_yscale or image_angle != global.arena.int.image_angle)) {
	surface_set_target(global.bone_mask_surface);
	draw_clear(c_black);
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(bonemask, global.arena.int.image_index, global.arena.int.x, global.arena.int.y, (global.arena.width-10)/2, (global.arena.height-10)/2, global.arena.int.image_angle, #FFFFFF, 1);
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
	//show_debug_message("Redrew surface at " + string(current_time));
}