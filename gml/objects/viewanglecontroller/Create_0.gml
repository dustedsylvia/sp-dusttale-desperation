lerpangle = 0;
lerpspeed = 0.3;

SetAngle = function(ang) {
	camera_set_view_angle(view_camera[0], ang);
	lerpangle = ang;
}

LerpToAngle = function(ang) {
	lerpangle = ang;
}