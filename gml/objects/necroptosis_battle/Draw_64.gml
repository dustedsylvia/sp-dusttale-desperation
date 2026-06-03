var s = delta_time;
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