// note: no rotation when using this method ;-;
// if you REALLY need to rotate the hpbar, make a custom sprite
// that has the dimensions you need and use draw_sprite_ext().
// that functionality isn't added because i'm not a psychopath who's going
// to create 60 hpbar sprites.
if (global.kr_enabled == false) {
	draw_sprite_stretched_ext(hpbar_sprite, 0, x, y, global.player_maxhp * 1.2, 21, #c00000, image_alpha);
	draw_sprite_stretched_ext(hpbar_sprite, 0, x, y, global.player_hp * 1.2, 21, #ffff00, image_alpha);
	draw_sprite_stretched_ext(hpbar_overlay, 0, x, y, global.player_maxhp * 1.2, 21, c_white, image_alpha);
} else if (global.kr_enabled == true) {
	if (global.player_hp > 4) {
		draw_sprite_stretched_ext(hpbar_sprite, 0, x, y, global.player_maxhp * 1.2, 21, #c00000, image_alpha);
		draw_sprite_stretched_ext(hpbar_sprite, 0, x, y, global.player_hp * 1.2 - 1 + global.KR, 21, #ff00ff, image_alpha);
		draw_sprite_stretched_ext(hpbar_sprite, 0, x, y, global.player_hp * 1.2 - 2, 21, #ffff00, image_alpha);
		draw_sprite_stretched_ext(hpbar_overlay, 0, x, y, global.player_maxhp * 1.2, 21, c_white, image_alpha);
	} else {
		draw_sprite_stretched_ext(hpbar_sprite, 0, x, y, global.player_maxhp * 1.2, 21, #c00000, image_alpha);
		draw_sprite_stretched_ext(hpbar_sprite, 0, x, y, global.player_hp * 1.2 - 1 + global.KR, 21, #ff00ff, image_alpha);
		draw_sprite_stretched_ext(hpbar_sprite, 0, x, y, 2, 21, #ffff00, image_alpha);
		draw_sprite_stretched_ext(hpbar_overlay, 0, x, y, global.player_maxhp * 1.2, 21, c_white, image_alpha);
	}
} 