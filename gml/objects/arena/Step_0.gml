if (width != lerpwidth) {
	width = lerp(width, lerpwidth, lerp_speed);
}

if (height != lerpheight) {
	height = lerp(height, lerpheight, lerp_speed);
}

if (x != lerpx) {
	x = lerp(x, lerpx, lerp_speed);
}

if (y != lerpy) {
	y = lerp(y, lerpy, lerp_speed);
}

if (image_angle != lerpangle) {
	image_angle = lerp(image_angle, lerpangle, lerp_speed);
}

int.x = x;
int.y = y;
int.image_angle = image_angle;
int.image_xscale = (width-10)/2;
int.image_yscale = (height-10)/2;

col.x = x;
col.y = y;
col.image_angle = image_angle;
col.image_xscale = width / sprite_get_width(sprite_index);
col.image_yscale = height / sprite_get_height(sprite_index);