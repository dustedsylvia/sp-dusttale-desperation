deleteAfterFrames -= 1;

x += xvel;
y += yvel;
image_angle += rotvel;
image_alpha += alphavel;
if (image_alpha < 0 and destroyOnInvisibility) { instance_destroy(); };
if (image_alpha < 0) { image_alpha = 0; }; // cap opacity to 0-1
if (image_alpha > 1) { image_alpha = 1; };
image_xscale += xscalevel;
image_yscale += yscalevel;

if (xvel != lerpxspeed) {
	xvel = lerp(xvel, lerpxspeed, lerpspeed);
}

if (playSound) {
	audio_play_sound(exclaimsnd, 1, false);
	playSound = false;
}

if (deleteAfterFrames <= 0) {
	instance_destroy();
}