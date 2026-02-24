clock += 1;

if (clock >= 0 and clock <= 30) {
	image_alpha += 0.015;
}

if (place_meeting(x, y, trapped)) {
	instance_destroy();
}

if (clock >= 500 and clock <= 530) {
	image_alpha -= 0.015;
}

if (clock == 531) {
	instance_destroy();
}