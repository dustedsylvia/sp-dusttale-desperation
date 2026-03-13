x += xvel;
y += yvel;
image_alpha += alphavel;
if (image_alpha < 0 and destroyOnInvisibility) { instance_destroy(); };
if (image_alpha < 0) { image_alpha = 0; }; // cap opacity to 0-1
if (image_alpha > 1) { image_alpha = 1; };
image_xscale += xscalevel;
image_yscale += yscalevel;

for (var i = 0; i < outline_thickness+1; i++) {
	draw_sprite_stretched_ext(blackpx, image_index, x-i, y-i, width, height, outline_color, image_alpha);
	draw_sprite_stretched_ext(blackpx, image_index, x, y-i, width, height, outline_color, image_alpha);
	draw_sprite_stretched_ext(blackpx, image_index, x+i, y-i, width, height, outline_color, image_alpha);
	draw_sprite_stretched_ext(blackpx, image_index, x+i, y, width, height, outline_color, image_alpha);
	draw_sprite_stretched_ext(blackpx, image_index, x+i, y+i, width, height, outline_color, image_alpha);
	draw_sprite_stretched_ext(blackpx, image_index, x, y+i, width, height, outline_color, image_alpha);
	draw_sprite_stretched_ext(blackpx, image_index, x-i, y+i, width, height, outline_color, image_alpha);
}

draw_sprite_stretched_ext(red, 0, x, y, width, height, c_white, image_alpha);
draw_sprite_stretched_ext(green, 0, x, y, hpwidth, height, c_white, image_alpha);