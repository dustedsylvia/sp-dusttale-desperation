text = "LV " + string(global.player_lv);

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