clock += 1;

if (clock == 1) {
	image_alpha = startingOpacity;
}

if (mode == "fadeIn") {
	if (needsInit) {
		image_alpha = startingOpacity;
		offset = 1 / fadeOverFrames;
		needsInit = false;
	}

	if (targetOpacity != image_alpha) {
		image_alpha -= offset;
	}

	if (clock >= fadeOverFrames and destroyOnFinish) {
		instance_destroy();
	}
}

if (mode == "fadeOut") {
	if (needsInit) {
		image_alpha = startingOpacity;
		offset = 1 / fadeOverFrames;
		needsInit = false;
	}

	if (targetOpacity != image_alpha) {
		image_alpha += offset;
	}

	if (clock >= fadeOverFrames and destroyOnFinish) {
		instance_destroy();
	}
}