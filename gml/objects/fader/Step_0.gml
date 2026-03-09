clock += 1;

if (clock == 1) {
	image_alpha = startingOpacity;
}

// look in fader_debug for code comments n debug statements.
// heh.
// hahA.
// HAHAHAHAHHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHHAHAAHAHAHAHAHAHA

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