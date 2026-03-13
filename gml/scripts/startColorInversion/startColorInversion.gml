function startColorInversion() {
	with (invertColors) {
		instance_destroy(); // don't double-invert colors, but you shouldn't be calling this twice anyway
	}
	instance_create_depth(0, 0, 0, invertColors); // x, y, and depth don't matter
}