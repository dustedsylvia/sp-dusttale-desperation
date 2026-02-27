if (!fadeout and image_alpha != 1) {
	image_alpha += 0.02;
} else if (fadeout) {
	image_alpha -= 0.02;
}

if (image_alpha == 0 and fadeout) {
	instance_destroy();
}