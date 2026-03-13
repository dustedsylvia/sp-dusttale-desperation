mask.x = x;
mask.y = y;

for (var i = 0; i < outline_thickness+1; i++) {
	draw_sprite_ext(sprite_index, image_index, x-i, y-i, width / sprite_get_width(sprite_index), height / sprite_get_height(sprite_index), image_angle, outline_color, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x, y-i, width / sprite_get_width(sprite_index), height / sprite_get_height(sprite_index), image_angle, outline_color, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x+i, y-i, width / sprite_get_width(sprite_index), height / sprite_get_height(sprite_index), image_angle, outline_color, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x+i, y, width / sprite_get_width(sprite_index), height / sprite_get_height(sprite_index), image_angle, outline_color, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x+i, y+i, width / sprite_get_width(sprite_index), height / sprite_get_height(sprite_index), image_angle, outline_color, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x, y+i, width / sprite_get_width(sprite_index), height / sprite_get_height(sprite_index), image_angle, outline_color, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x-i, y+i, width / sprite_get_width(sprite_index), height / sprite_get_height(sprite_index), image_angle, outline_color, image_alpha);
}

draw_sprite_ext(sprite_index, image_index, x, y, width / sprite_get_width(sprite_index), height / sprite_get_height(sprite_index), image_angle, c_white, image_alpha);
