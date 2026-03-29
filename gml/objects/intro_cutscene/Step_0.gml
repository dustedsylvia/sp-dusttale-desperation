clock += 1;

if (clock == 30) {
	audio_play_sound(slash, 1, false);
	instance_create_depth(320-(sprite_get_width(slice_intro)/2), 240-(sprite_get_height(slice_intro)/2), -9999, devastatingslash);
}

if (clock == 100) {
	audio_play_sound(hit, 1, false);
	screenshake(60, 15, 2);
}

if (clock >= 100 and clock <= 160) {
	textalpha -= 0.0165;
}

if (clock >= 191 and clock <= 430) {
	if (irandom_range(0, 5) == 5) {
		sans_x += 2;
	}
	if (irandom_range(0, 5) == 0) {
		sans_x -= 2;
	}
	if (irandom_range(0, 5) == 5) {
		sans_y += 2;
	}
	if (irandom_range(0, 5) == 0) {
		sans_y -= 2;
	}
}

if (clock == 450) {
	audio_play_sound(silence, 1, 0);
	hand = instance_create_depth(320-(sprite_get_width(necroptosis_hand)/2), 16, -9999, duster);
	hand.dust_speed = 5;
}

if (clock == 590) {
	audio_play_sound(love, 1, 0);
}

if (clock == 679) {
	voidv3 = instance_create_depth(-130, -30, -9999, sprawl);
	audio = audio_play_sound(menu, 1, true);
}

if (clock == 900) {
	sanstext = "...";
}

if (clock == 1080) {
	sanstext = "So many timelines\nhave passed";
}

if (clock == 1260) {
	sanstext = "but all my actions\neverything i did";
}

if (clock == 1440) {
	sanstext = "";
	sanstextx = 320;
	sanstexty = 240;
	sansbasex = 320;
	sansbasey = 240;
	voidv3.fadeout = true;
}

if (clock >= 1441 and clock <= 2040) {
	if (irandom_range(0, 5) == 5) {
		sanstextx += 2;
	}
	if (irandom_range(0, 5) == 0) {
		sanstextx -= 2;
	}
	if (irandom_range(0, 5) == 5) {
		sanstexty += 2;
	}
	if (irandom_range(0, 5) == 0) {
		sanstexty -= 2;
	}
}

if (clock == 1620) {
	sanstext = "i can't justify them";
}

if (clock == 1800) {
	sanstext = "not from that timeline.";
}

if (clock == 2040) {
	sanstext = "";
	sansbasex = 475;
	sansbasey = 240;
	sanstextx = 475;
	sanstexty = 240;
}

if (clock >= 2100 and clock <= 2150) {
	sansopacity += 0.02;
}

if (clock >= 2150 and clock <= 2740) {
	if (clock % 30 == 0 and thing == true) {
		thing = false;
		sanssprite = sans_help_3;
	} else if (clock % 30 == 0 and thing == false) {
		thing = true;
		sanssprite = sans_help_4;
	}
}

if (clock == 2330) {
	sanstext = "all my fault";
}

if (clock == 2510) {
	sanstext = "but i can't give up";
}

if (clock == 2690) {
	sanstext = "";
	sanstextx = 320;
	sanstexty = 240;
	sansbasex = 320;
	sansbasey = 240;
}

if (clock >= 2690 and clock <= 2740) {
	sansopacity -= 0.02;
}

if (clock == 2920) {
	sanstext = "not until everyone gets the ending\nthey deserve";
}

if (clock == 3100) {
	sanstext = "and after they do...";
}

if (clock == 3280) {
	sanstext = "...i will rot in hell.";
}

if (clock == 3460) {
	sanstext = "...but i'll give everything\nfor this timeline.";
}

if (clock == 3640) {
	sanstext = "maybe there is hope\nafter all.";
}

if (clock == 3820) {
	sanstext = "i'll see.";
}

if (clock == 4000) {
	sanstext = "";
	audio_sound_gain(audio, 0, 2000);
}

if (clock == 4120) {
	instance_destroy(player);
	load_demo_file_info();
	save_save_file("file0.ini");
	load_save_file("file0.ini");
}