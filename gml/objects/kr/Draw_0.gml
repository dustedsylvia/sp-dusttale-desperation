if (x != lerpx) {
	x = lerp(x, lerpx, lerp_speed);
}

if (y != lerpy) {
	y = lerp(y, lerpy, lerp_speed);
}

for (var i = 0; i < outline_thickness+1; i++) {
	draw_sprite_ext(sprite_index, image_index, x-i, y-i, image_xscale, image_yscale, image_angle, outline_color, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x, y-i, image_xscale, image_yscale, image_angle, outline_color, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x+i, y-i, image_xscale, image_yscale, image_angle, outline_color, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x+i, y, image_xscale, image_yscale, image_angle, outline_color, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x+i, y+i, image_xscale, image_yscale, image_angle, outline_color, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x, y+i, image_xscale, image_yscale, image_angle, outline_color, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x-i, y+i, image_xscale, image_yscale, image_angle, outline_color, image_alpha);
}

draw_self();