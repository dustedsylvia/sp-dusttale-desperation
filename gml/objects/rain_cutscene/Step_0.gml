rainclock += 1;
if (rainclock % 5 == 0) {
	instance_create_depth(irandom(640), 0, 0, raindrop);
	instance_create_depth(640, irandom(480), 0, raindrop);
}

if (rainclock == 3600) {
	game_end(0);
}

framecount += 1;
screen_save(working_directory + "frame_" + string(framecount) + ".png");