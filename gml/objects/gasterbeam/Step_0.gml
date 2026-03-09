firelen -= 1;
if (firelen > 0) {
	image_xscale = lerp(image_xscale, 1, 0.2);
}
if (firelen <= 0) {
	image_xscale = lerp(image_xscale, 0, 0.2);
	if (image_xscale <= 0.03) {
		instance_destroy();
	}
}