clock += 1;

if (clock == 1) {
	image_alpha = startingOpacity;
	show_debug_message(string_concat("startingOpacity: ", startingOpacity, ". targetOpacity: ", targetOpacity, ". image_alpha: ", image_alpha, "."));
	show_debug_message("reset image_alpha.");
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
		show_debug_message(string_concat("image_alpha: ", image_alpha, ". offset: ", offset, "."));
	}

	if (targetOpacity != image_alpha) {
		image_alpha -= offset;
		show_debug_message("removed some from image_alpha.");
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
		show_debug_message("bounced from fadeIn to fadeOut!");
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
		show_debug_message("added some to image_alpha.");
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
		show_debug_message("bounced from fadeOut to fadeIn!");
		exit;
	}
	if (clock >= fadeOverFrames) {
		executeOnCompletion();
	}
	if (clock >= fadeOverFrames and destroyOnFinish) {
		instance_destroy();
	}
}