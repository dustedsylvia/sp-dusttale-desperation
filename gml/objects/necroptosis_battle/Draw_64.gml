if (global.is_gm_live_enabled) {
	if (live_call()) return live_result;
}

if (coverScreen) {
	draw_sprite(black, 0, 0, 0);
}

if (draw_hangman) {
	draw_sprite_ext(hangman, 1, 320+irandom_range(-1, 1), 240+irandom_range(-1, 1), hxs, hys, irandom_range(-1, 1), c_white, 1);
}

draw_set_font(dtf);
draw_set_halign(fa_center);
draw_text_transformed_color(320, 300, drawtext, 1, 1, 0, c_red, c_red, c_red, c_red, 1);
draw_set_halign(fa_left);