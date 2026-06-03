if (global.is_gm_live_enabled) {
	if (live_call()) return live_result;
}

//if (sanslegsprite == legs_blackout) {
//	for (var i = 0; i < outline_thickness+1; i++) {
//		draw_sprite_ext(head_whiteout, 0, sansheadpos[0] + xoffset-i, sansheadpos[1] + yoffset-i, 2, 2, image_angle, c_white, alpha);
//		draw_sprite_ext(head_whiteout, 0, sansheadpos[0] + xoffset, sansheadpos[1] + yoffset-i, 2, 2, image_angle, c_white, alpha);
//		draw_sprite_ext(head_whiteout, 0, sansheadpos[0] + xoffset+i, sansheadpos[1] + yoffset-i, 2, 2, image_angle, c_white, alpha);
//		draw_sprite_ext(head_whiteout, 0, sansheadpos[0] + xoffset+i, sansheadpos[1] + yoffset, 2, 2, image_angle, c_white, alpha);
//		draw_sprite_ext(head_whiteout, 0, sansheadpos[0] + xoffset+i, sansheadpos[1] + yoffset+i, 2, 2, image_angle, c_white, alpha);
//		draw_sprite_ext(head_whiteout, 0, sansheadpos[0] + xoffset, sansheadpos[1] + yoffset+i, 2, 2, image_angle, c_white, alpha);
//		draw_sprite_ext(head_whiteout, 0, sansheadpos[0] + xoffset-i, sansheadpos[1] + yoffset+i, 2, 2, image_angle, c_white, alpha);
//	}
	
//	for (var i = 0; i < outline_thickness+1; i++) {
//		draw_sprite_ext(body_whiteout, 0, sansbodypos[0] + xoffset-i, sansbodypos[1] + yoffset-i, 2, 2, image_angle, c_white, alpha);
//		draw_sprite_ext(body_whiteout, 0, sansbodypos[0] + xoffset, sansbodypos[1] + yoffset-i, 2, 2, image_angle, c_white, alpha);
//		draw_sprite_ext(body_whiteout, 0, sansbodypos[0] + xoffset+i, sansbodypos[1] + yoffset-i, 2, 2, image_angle, c_white, alpha);
//		draw_sprite_ext(body_whiteout, 0, sansbodypos[0] + xoffset+i, sansbodypos[1] + yoffset, 2, 2, image_angle, c_white, alpha);
//		draw_sprite_ext(body_whiteout, 0, sansbodypos[0] + xoffset+i, sansbodypos[1] + yoffset+i, 2, 2, image_angle, c_white, alpha);
//		draw_sprite_ext(body_whiteout, 0, sansbodypos[0] + xoffset, sansbodypos[1] + yoffset+i, 2, 2, image_angle, c_white, alpha);
//		draw_sprite_ext(body_whiteout, 0, sansbodypos[0] + xoffset-i, sansbodypos[1] + yoffset+i, 2, 2, image_angle, c_white, alpha);
//	}
	
//	for (var i = 0; i < outline_thickness+1; i++) {
//		draw_sprite_ext(legs_whiteout, 0, sanslegspos[0]-i, sanslegspos[1]-i, 2, 2, image_angle, c_white, alpha);
//		draw_sprite_ext(legs_whiteout, 0, sanslegspos[0], sanslegspos[1]-i, 2, 2, image_angle, c_white, alpha);
//		draw_sprite_ext(legs_whiteout, 0, sanslegspos[0]+i, sanslegspos[1]-i, 2, 2, image_angle, c_white, alpha);
//		draw_sprite_ext(legs_whiteout, 0, sanslegspos[0]+i, sanslegspos[1], 2, 2, image_angle, c_white, alpha);
//		draw_sprite_ext(legs_whiteout, 0, sanslegspos[0]+i, sanslegspos[1]+i, 2, 2, image_angle, c_white, alpha);
//		draw_sprite_ext(legs_whiteout, 0, sanslegspos[0], sanslegspos[1]+i, 2, 2, image_angle, c_white, alpha);
//		draw_sprite_ext(legs_whiteout, 0, sanslegspos[0]-i, sanslegspos[1]+i, 2, 2, image_angle, c_white, alpha);
//	}
	
//}

//draw_sprite_ext(sanslegsprite, 0, sanslegspos[0], sanslegspos[1], 2, 2, 0, clr, alpha);
//draw_sprite_ext(sansbodysprite, 0, sansbodypos[0] + xoffset, sansbodypos[1] + yoffset / 1.5, 2, 2, 0, clr, alpha);
//draw_sprite_ext(sansheadsprite, 0, sansheadpos[0] + xoffset, sansheadpos[1] + yoffset, 2, 2, 0, clr, alpha);

if (sanslegsprite == legs_blackout) {
	for (var i = 0; i < outline_thickness+1; i++) {
		draw_sprite_ext(head_whiteout, 0, sansheadpos[0]-i, sansheadpos[1]-i, 2, 2, image_angle, c_white, alpha);
		draw_sprite_ext(head_whiteout, 0, sansheadpos[0], sansheadpos[1]-i, 2, 2, image_angle, c_white, alpha);
		draw_sprite_ext(head_whiteout, 0, sansheadpos[0]+i, sansheadpos[1]-i, 2, 2, image_angle, c_white, alpha);
		draw_sprite_ext(head_whiteout, 0, sansheadpos[0]+i, sansheadpos[1], 2, 2, image_angle, c_white, alpha);
		draw_sprite_ext(head_whiteout, 0, sansheadpos[0]+i, sansheadpos[1]+i, 2, 2, image_angle, c_white, alpha);
		draw_sprite_ext(head_whiteout, 0, sansheadpos[0], sansheadpos[1]+i, 2, 2, image_angle, c_white, alpha);
		draw_sprite_ext(head_whiteout, 0, sansheadpos[0]-i, sansheadpos[1]+i, 2, 2, image_angle, c_white, alpha);
	}
	
	if (sansbodysprite == body_blackout) {
		for (var i = 0; i < outline_thickness+1; i++) {
			draw_sprite_ext(body_whiteout, 0, sansbodypos[0]-i, sansbodypos[1]-i, 2, 2, image_angle, c_white, alpha);
			draw_sprite_ext(body_whiteout, 0, sansbodypos[0], sansbodypos[1]-i, 2, 2, image_angle, c_white, alpha);
			draw_sprite_ext(body_whiteout, 0, sansbodypos[0]+i, sansbodypos[1]-i, 2, 2, image_angle, c_white, alpha);
			draw_sprite_ext(body_whiteout, 0, sansbodypos[0]+i, sansbodypos[1], 2, 2, image_angle, c_white, alpha);
			draw_sprite_ext(body_whiteout, 0, sansbodypos[0]+i, sansbodypos[1]+i, 2, 2, image_angle, c_white, alpha);
			draw_sprite_ext(body_whiteout, 0, sansbodypos[0], sansbodypos[1]+i, 2, 2, image_angle, c_white, alpha);
			draw_sprite_ext(body_whiteout, 0, sansbodypos[0]-i, sansbodypos[1]+i, 2, 2, image_angle, c_white, alpha);
		}
	} else {
		for (var i = 0; i < outline_thickness+1; i++) {
			draw_sprite_ext(body_whiteout_shrug, 0, sansbodypos[0]-i, sansbodypos[1]-i, 2, 2, image_angle, c_white, alpha);
			draw_sprite_ext(body_whiteout_shrug, 0, sansbodypos[0], sansbodypos[1]-i, 2, 2, image_angle, c_white, alpha);
			draw_sprite_ext(body_whiteout_shrug, 0, sansbodypos[0]+i, sansbodypos[1]-i, 2, 2, image_angle, c_white, alpha);
			draw_sprite_ext(body_whiteout_shrug, 0, sansbodypos[0]+i, sansbodypos[1], 2, 2, image_angle, c_white, alpha);
			draw_sprite_ext(body_whiteout_shrug, 0, sansbodypos[0]+i, sansbodypos[1]+i, 2, 2, image_angle, c_white, alpha);
			draw_sprite_ext(body_whiteout_shrug, 0, sansbodypos[0], sansbodypos[1]+i, 2, 2, image_angle, c_white, alpha);
			draw_sprite_ext(body_whiteout_shrug, 0, sansbodypos[0]-i, sansbodypos[1]+i, 2, 2, image_angle, c_white, alpha);
		}
	}
	
	for (var i = 0; i < outline_thickness+1; i++) {
		draw_sprite_ext(legs_whiteout, 0, sanslegspos[0]-i, sanslegspos[1]-i, 2, 2, image_angle, c_white, alpha);
		draw_sprite_ext(legs_whiteout, 0, sanslegspos[0], sanslegspos[1]-i, 2, 2, image_angle, c_white, alpha);
		draw_sprite_ext(legs_whiteout, 0, sanslegspos[0]+i, sanslegspos[1]-i, 2, 2, image_angle, c_white, alpha);
		draw_sprite_ext(legs_whiteout, 0, sanslegspos[0]+i, sanslegspos[1], 2, 2, image_angle, c_white, alpha);
		draw_sprite_ext(legs_whiteout, 0, sanslegspos[0]+i, sanslegspos[1]+i, 2, 2, image_angle, c_white, alpha);
		draw_sprite_ext(legs_whiteout, 0, sanslegspos[0], sanslegspos[1]+i, 2, 2, image_angle, c_white, alpha);
		draw_sprite_ext(legs_whiteout, 0, sanslegspos[0]-i, sanslegspos[1]+i, 2, 2, image_angle, c_white, alpha);
	}
	
}

if (animationstyle == 2) {
	draw_sprite_ext(sansrightarmsprite, 0, sansleftarmpos[0], sansleftarmpos[1], 2, 2, sansleftarmangle, clr, alpha);
}

draw_sprite_ext(sanslegsprite, 0, sanslegspos[0], sanslegspos[1], 2, sanslegsyscale, sanslegsangle, clr, alpha);
draw_sprite_ext(sansbodysprite, 0, sansbodypos[0], sansbodypos[1], 2, 2, 0, clr, alpha);
draw_sprite_ext(sansheadsprite, 0, sansheadpos[0], sansheadpos[1], 2, 2, sansheadangle, clr, alpha);

if (animationstyle == 2) {
	draw_sprite_ext(sansleftarmsprite, 0, sansrightarmpos[0], sansrightarmpos[1], 2, 2, sansrightarmangle, clr, alpha);
}