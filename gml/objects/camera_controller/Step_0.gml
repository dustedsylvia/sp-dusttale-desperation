if (zoomfactor != targetzoomfactor) {
	x = lerp(x, targetx, lerpspeed);
	y = lerp(y, targety, lerpspeed);

	zoomfactor = lerp(zoomfactor, targetzoomfactor, lerpspeed);

	viewwidth = camera_get_view_width(camera);
	viewheight = camera_get_view_width(camera);

	zoom_w = lerp(viewwidth, zoomfactor * screenwidth, lerpspeed);
	zoom_h = lerp(viewheight, zoomfactor * screenheight, lerpspeed);

	zoom_x = viewwidth / 2 * zoomfactor;
	zoom_y = viewheight / 2 * zoomfactor;

	camera_set_view_size(camera, zoom_w, zoom_h);
	camera_set_view_pos(camera, x-zoom_x, y-zoom_y);
}