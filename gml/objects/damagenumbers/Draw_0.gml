x += xvel;
y += yvel;
image_angle += rotvel;
image_alpha += alphavel;
if (image_alpha < 0 and destroyOnInvisibility) { instance_destroy(); };
if (image_alpha < 0) { image_alpha = 0; }; // cap opacity to 0-1
if (image_alpha > 1) { image_alpha = 1; };
image_xscale += xscalevel;
image_yscale += yscalevel;

var t = draw_get_font();
draw_set_font(font);
draw_set_halign(fa_center);

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
draw_set_halign(fa_left);