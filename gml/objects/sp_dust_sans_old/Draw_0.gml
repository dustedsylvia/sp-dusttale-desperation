if (sanslegsprite == legs_blackout) {
	for (var i = 0; i < outline_thickness+1; i++) {
		draw_sprite_ext(head_whiteout, 0, sansheadpos[0] + xoffset-i, sansheadpos[1] + yoffset-i, 2, 2, image_angle, c_white, alpha);
		draw_sprite_ext(head_whiteout, 0, sansheadpos[0] + xoffset, sansheadpos[1] + yoffset-i, 2, 2, image_angle, c_white, alpha);
		draw_sprite_ext(head_whiteout, 0, sansheadpos[0] + xoffset+i, sansheadpos[1] + yoffset-i, 2, 2, image_angle, c_white, alpha);
		draw_sprite_ext(head_whiteout, 0, sansheadpos[0] + xoffset+i, sansheadpos[1] + yoffset, 2, 2, image_angle, c_white, alpha);
		draw_sprite_ext(head_whiteout, 0, sansheadpos[0] + xoffset+i, sansheadpos[1] + yoffset+i, 2, 2, image_angle, c_white, alpha);
		draw_sprite_ext(head_whiteout, 0, sansheadpos[0] + xoffset, sansheadpos[1] + yoffset+i, 2, 2, image_angle, c_white, alpha);
		draw_sprite_ext(head_whiteout, 0, sansheadpos[0] + xoffset-i, sansheadpos[1] + yoffset+i, 2, 2, image_angle, c_white, alpha);
	}
	
	for (var i = 0; i < outline_thickness+1; i++) {
		draw_sprite_ext(body_whiteout, 0, sansbodypos[0] + xoffset-i, sansbodypos[1] + yoffset-i, 2, 2, image_angle, c_white, alpha);
		draw_sprite_ext(body_whiteout, 0, sansbodypos[0] + xoffset, sansbodypos[1] + yoffset-i, 2, 2, image_angle, c_white, alpha);
		draw_sprite_ext(body_whiteout, 0, sansbodypos[0] + xoffset+i, sansbodypos[1] + yoffset-i, 2, 2, image_angle, c_white, alpha);
		draw_sprite_ext(body_whiteout, 0, sansbodypos[0] + xoffset+i, sansbodypos[1] + yoffset, 2, 2, image_angle, c_white, alpha);
		draw_sprite_ext(body_whiteout, 0, sansbodypos[0] + xoffset+i, sansbodypos[1] + yoffset+i, 2, 2, image_angle, c_white, alpha);
		draw_sprite_ext(body_whiteout, 0, sansbodypos[0] + xoffset, sansbodypos[1] + yoffset+i, 2, 2, image_angle, c_white, alpha);
		draw_sprite_ext(body_whiteout, 0, sansbodypos[0] + xoffset-i, sansbodypos[1] + yoffset+i, 2, 2, image_angle, c_white, alpha);
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

draw_sprite_ext(sanslegsprite, 0, sanslegspos[0], sanslegspos[1], 2, 2, 0, clr, alpha);
draw_sprite_ext(sansbodysprite, 0, sansbodypos[0] + xoffset, sansbodypos[1] + yoffset / 1.5, 2, 2, 0, clr, alpha);
draw_sprite_ext(sansheadsprite, 0, sansheadpos[0] + xoffset, sansheadpos[1] + yoffset, 2, 2, 0, clr, alpha);