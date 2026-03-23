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
if (!surface_exists(global.bone_mask_surface)) {
	redrawMask = false;
    global.bone_mask_surface = surface_create(room_width, room_height);
    surface_set_target(global.bone_mask_surface);
    draw_clear(c_black);
    gpu_set_blendmode(bm_subtract);
    draw_sprite_ext(global.arena.sprite_index, global.arena.image_index, global.arena.x, global.arena.y, global.arena.image_xscale, global.arena.image_yscale, global.arena.image_angle, #FFFFFF, 1);
    gpu_set_blendmode(bm_normal);
    surface_reset_target();
	show_debug_message("Made new surface at " + string(current_time));
}

//if (redrawMask) {
//	redrawMask = false;
//	surface_set_target(global.bone_mask_surface);
//    draw_clear(c_black);
//    gpu_set_blendmode(bm_subtract);
//    draw_sprite_ext(global.arena.sprite_index, global.arena.image_index, global.arena.x, global.arena.y, global.arena.width / sprite_get_width(global.arena.sprite_index), global.arena.height / sprite_get_height(global.arena.sprite_index), global.arena.image_angle, #FFFFFF, global.arena.image_alpha);
//    gpu_set_blendmode(bm_normal);
//    surface_reset_target();
//	show_debug_message("Redrew surface at " + string(current_time));
//}

if (!surface_exists(global.bone_clip_surface)) {
    global.bone_clip_surface = surface_create(room_width, room_height);
}

// start drawing:
surface_set_target(global.bone_clip_surface);
draw_clear_alpha(c_black, 0);
// draw things relative to clip-surface:
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_color, image_alpha);
// cut out the mask-surface from it:
gpu_set_blendmode(bm_subtract);
draw_surface(global.bone_mask_surface, 0, 0);
gpu_set_blendmode(bm_normal);
// finish and draw the clip-surface itself:
surface_reset_target();
draw_surface(global.bone_clip_surface, 0, 0);

// * i just realized that it's a MIRACLE this code works properly
// * each bone object REDRAWS the bone clip surface.
// * and yet...
// * somehow it works.
// * i actually have no idea how.
// * i'm not gonna challenge it.