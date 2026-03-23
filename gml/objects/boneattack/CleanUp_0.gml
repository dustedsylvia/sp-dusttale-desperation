if (removeThisOnDestroy != -1) {
	sprite_delete(removeThisOnDestroy); // fix a memory leak
}

//if (surface_exists(mask_surface)) {
//	surface_free(mask_surface);
//}

//if (surface_exists(clip_surface)) {
//	surface_free(clip_surface);
//}