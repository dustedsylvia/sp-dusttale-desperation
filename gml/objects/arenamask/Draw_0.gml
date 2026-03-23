// alright time to FIX some PROBLEMS!!!!!! :fml:

surface_set_target(surface);

draw_clear_alpha(c_black,0);

// hey wait this math makes no sense YOU THINK I DONT KNOW THAT??? YOU THINK IM NOT LOWKENUIENLY GOING
// INSANE TRYING TO CODE THIS FUCKING MASK???? BECAUSE I AM!!!!!!!!! SO IT WORKS AND THAT IS PLENTY GOOD
// ENOUGH FOR ME. HOLY SHIT. THIS TOOK FAR FAR TOO LONG
// i would explain how this works but i have NO fucking idea.

gpu_set_blendmode_ext(bm_one, bm_zero);
draw_sprite_ext(arena_mask_sprite, 0, x, y, (1000+global.arena.width-14)/1000, (1000+global.arena.height-14)/1000, global.arena.image_angle, c_white, 1);
surface_reset_target();
gpu_set_blendmode(bm_normal);

draw_surface(surface, 0, 0);