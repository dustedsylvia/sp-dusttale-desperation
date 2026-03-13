screenangle = camera_get_view_angle(view_camera[0])

if (screenangle != lerpangle) {
	screenangle = lerp(screenangle, lerpangle, lerpspeed);
}

camera_set_view_angle(view_camera[0], screenangle);