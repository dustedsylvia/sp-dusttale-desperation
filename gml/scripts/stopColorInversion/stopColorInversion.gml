function stopColorInversion() {
	with (invertColors) {
		instance_destroy(); // don't double-invert colors, but you shouldn't be calling this twice anyway
	}
}