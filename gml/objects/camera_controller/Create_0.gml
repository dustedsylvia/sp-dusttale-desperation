lerpspeed = 0.3;

camera = view_camera[0];

screenwidth = 640;
screenheight = 480;

viewwidth = 640;
viewheight = 480;

targetx = 320;
targety = 240;

zoomfactor = 1;
targetzoomfactor = 0.5;

lerptozoom = function(zoomx, zoomy, startingzoom, endingzoom) {
	targetx = zoomx;
	targety = zoomy;
	zoomfactor = startingzoom;
	targetzoomfactor = endingzoom;
}