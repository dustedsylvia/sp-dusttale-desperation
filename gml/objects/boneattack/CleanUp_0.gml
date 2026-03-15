if (removeThisOnDestroy != noone) {
	sprite_delete(removeThisOnDestroy); // fix a memory leak
}