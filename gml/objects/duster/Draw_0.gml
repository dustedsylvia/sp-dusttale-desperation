if (current_y == sprite_height) {
	instance_destroy();
}

draw_sprite_part(sprite_index, image_index, 0, current_y, sprite_width, sprite_height, x, original_y + current_y);

for (var i = 0; i < dust_speed; i += 1) {
	try {
		row = dust_animation[current_y-i];

		for (var current_x = 0; current_x < array_length(row); current_x += 1) {
			pixel = row[current_x];
			if (pixel == 0) {
				continue;
			}
			else {
				instance_create_depth(x+current_x, original_y + current_y - i, depth - 1, dustparticle);
			}
		}
	}catch(e){}
}