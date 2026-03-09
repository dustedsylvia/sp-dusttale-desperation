text = string_repeat("0", max(0, 2 - string_length(string(global.player_hp + global.KR)))) + string(global.player_hp + global.KR) + " / " + string(global.player_maxhp);

if (global.KR > 0) {
	color = #ff00ff;
} else {
	color = #ffffff;
}

var t = draw_get_font();
draw_set_font(font);

for (var i = 0; i < outline_thickness+1; i++) {
	draw_text_transformed_colour(x-i, y, text, image_xscale, image_yscale, image_angle, outline_color, outline_color, outline_color, outline_color, image_alpha);
	draw_text_transformed_colour(x-i, y-i, text, image_xscale, image_yscale, image_angle, outline_color, outline_color, outline_color, outline_color, image_alpha);
	draw_text_transformed_colour(x, y-i, text, image_xscale, image_yscale, image_angle, outline_color, outline_color, outline_color, outline_color, image_alpha);
	draw_text_transformed_colour(x+i, y-i, text, image_xscale, image_yscale, image_angle, outline_color, outline_color, outline_color, outline_color, image_alpha);
	draw_text_transformed_colour(x+i, y, text, image_xscale, image_yscale, image_angle, outline_color, outline_color, outline_color, outline_color, image_alpha);
	draw_text_transformed_colour(x+i, y+i, text, image_xscale, image_yscale, image_angle, outline_color, outline_color, outline_color, outline_color, image_alpha);
	draw_text_transformed_colour(x, y+i, text, image_xscale, image_yscale, image_angle, outline_color, outline_color, outline_color, outline_color, image_alpha);
	draw_text_transformed_colour(x-i, y+i, text, image_xscale, image_yscale, image_angle, outline_color, outline_color, outline_color, outline_color, image_alpha);
}

draw_text_transformed_colour(x, y, text, image_xscale, image_yscale, image_angle, color, color, color, color, image_alpha);

draw_set_font(t);