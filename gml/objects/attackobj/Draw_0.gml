if (image_index == 6) {
	instance_destroy();
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