x += xvel;
y += yvel;
image_angle += rotvel;
image_alpha += alphavel;
if (image_alpha < 0 and destroyOnInvisibility) { instance_destroy(); };
if (image_alpha < 0) { image_alpha = 0; }; // cap opacity to 0-1
if (image_alpha > 1) { image_alpha = 1; };
image_xscale += xscalevel;
image_yscale += yscalevel;

for (var i = 0; i < outline_thickness+1; i++) {
	draw_sprite_ext(sprite_index, image_index, x-i, y-i, image_xscale, image_yscale, image_angle, outline_color, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x, y-i, image_xscale, image_yscale, image_angle, outline_color, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x+i, y-i, image_xscale, image_yscale, image_angle, outline_color, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x+i, y, image_xscale, image_yscale, image_angle, outline_color, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x+i, y+i, image_xscale, image_yscale, image_angle, outline_color, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x, y+i, image_xscale, image_yscale, image_angle, outline_color, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x-i, y+i, image_xscale, image_yscale, image_angle, outline_color, image_alpha);
}

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, color, image_alpha);