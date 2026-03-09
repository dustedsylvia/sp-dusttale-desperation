clock += 1;

if (clock == 1) {
	image_alpha = startingOpacity;
}
// there's no point.
// there's no point.
// there's no point.
// there's no point.
// there's no point.
// you called for help
// nobody came
// obviously
// no point
// help
// sorry
// heh
// end
// end
// end
// no point
// sorry
// no point
// end
// 
if (mode == "fadeIn") {
	if (needsInit) {
		image_alpha = startingOpacity;
		offset = 1 / fadeOverFrames;
		needsInit = false; 
	}

	if (targetOpacity != image_alpha) {
		image_alpha -= offset;
	}
	if (bounce and clock >= fadeOverFrames) {
		needsInit = true;
		var t = targetOpacity;
		targetOpacity = startingOpacity;
		startingOpacity = t;
		clock = 0;
		mode = "fadeOut";
		bounce = false;
		executeOnFirstBounce();
		exit;
	}
	if (clock >= fadeOverFrames) {
		executeOnCompletion();
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
	if (bounce and clock >= fadeOverFrames) {
		needsInit = true;
		var t = targetOpacity;
		targetOpacity = startingOpacity;
		startingOpacity = t;
		clock = 0;
		mode = "fadeIn";
		bounce = false;
		executeOnFirstBounce();
		exit;
	}
	if (clock >= fadeOverFrames) {
		executeOnCompletion();
	}
	if (clock >= fadeOverFrames and destroyOnFinish) {
		instance_destroy();
	}
}