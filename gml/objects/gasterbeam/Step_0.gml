firelen -= 1;
if (firelen > 0) {
	image_xscale = lerp(image_xscale, target_xscale, 0.2);
}
if (firelen <= 0) {
	image_xscale = lerp(image_xscale, final_xscale, 0.2);
	if (image_xscale <= 0.03) {
		instance_destroy();
	}
}