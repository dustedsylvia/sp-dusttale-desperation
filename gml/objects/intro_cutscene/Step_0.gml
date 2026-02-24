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
	sanstext = "i died.";
}

if (clock == 889) {
	sanstext = "\nagain.";
}

if (clock == 1099) {
	sanstext = "\n\nbut why do i feel so free now...?";
}

if (clock == 1309) {
	sanstext = "\n\n\ni just hope one thing.";
}

if (clock == 1519) {
	sanstext = "\n\n\n\nthat this will be the last reset.";
}

if (clock >= 680 and clock <= 710) {
	sanstextalpha += 0.033;
}

if (clock >= 800 and clock <= 830) {
	sanstextalpha -= 0.033;
}

if (clock >= 890 and clock <= 920) {
	sanstextalpha += 0.033;
}

if (clock >= 1010 and clock <= 1040) {
	sanstextalpha -= 0.033;
}

if (clock >= 1100 and clock <= 1130) {
	sanstextalpha += 0.033;
}

if (clock >= 1220 and clock <= 1250) {
	sanstextalpha -= 0.033;
}

if (clock >= 1310 and clock <= 1340) {
	sanstextalpha += 0.033;
}

if (clock >= 1430 and clock <= 1460) {
	sanstextalpha -= 0.033;
}

if (clock >= 1520 and clock <= 1550) {
	sanstextalpha += 0.033;
}

if (clock >= 1640 and clock <= 1670) {
	sanstextalpha -= 0.033;
}