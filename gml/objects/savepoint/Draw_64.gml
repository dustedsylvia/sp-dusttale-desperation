if (state == 2 and fileExists) {
	draw_rectangle_colour(108, 118, 532, 292, c_white, c_white, c_white, c_white, false);
	draw_rectangle_colour(114, 124, 526, 286, c_black, c_black, c_black, c_black, false);
	
	draw_set_font(dtf_sans);
	if (global.prevseconds < 10) { seconds = "0" + string(global.prevseconds); } else { seconds = string(global.prevseconds); }
	
	if (nameoverride == 0) {
		draw_text_transformed(140, 140, global.player_name + "               LV " + string(global.player_lv) + "               " + string(global.prevminutes) + ":" + seconds, 2, 2, 0);
	} else {
		draw_text_transformed(140, 140, string(nameoverride) + "               LV " + string(global.player_lv) + "               " + string(global.prevminutes) + ":" + seconds, 2, 2, 0);
	}
	draw_text_transformed(140, 180, location, 2, 2, 0);
	draw_text_transformed(170, 240, "Save", 2, 2, 0);
	draw_text_transformed(350, 240, "Return", 2, 2, 0);
	
	draw_sprite(soul_spr, 0, soul_x, soul_y);
}

if (state == 2 and !fileExists) {
	draw_rectangle_colour(108, 118, 532, 292, c_white, c_white, c_white, c_white, false);
	draw_rectangle_colour(114, 124, 526, 286, c_black, c_black, c_black, c_black, false);
	
	draw_set_font(dtf_sans);
	draw_text_transformed(140, 140, "EMPTY               LV 0               0:00", 2, 2, 0);
	draw_text_transformed(140, 180, "--", 2, 2, 0);
	draw_text_transformed(170, 240, "Save", 2, 2, 0);
	draw_text_transformed(350, 240, "Return", 2, 2, 0);
	
	draw_sprite(soul_spr, 0, soul_x, soul_y);
}

if (state == 3) {
	draw_rectangle_colour(108, 118, 532, 292, c_white, c_white, c_white, c_white, false);
	draw_rectangle_colour(114, 124, 526, 286, c_black, c_black, c_black, c_black, false);
	
	draw_set_font(dtf_sans);
	if (_seconds < 10) { seconds = "0" + string(_seconds); } else { seconds = string(_seconds); }
	if (nameoverride == 0) {
		draw_text_transformed_color(140, 140, global.player_name + "               LV " + string(global.player_lv) + "               " + string(global.prevminutes) + ":" + seconds, 2, 2, 0, #FFFF00, #FFFF00, #FFFF00, #FFFF00, 1);
	} else {
		draw_text_transformed_color(140, 140, string(nameoverride) + "               LV " + string(global.player_lv) + "               " + string(global.prevminutes) + ":" + seconds, 2, 2, 0, #FFFF00, #FFFF00, #FFFF00, #FFFF00, 1);
	}
	
	draw_text_transformed_color(140, 180, location, 2, 2, 0, #FFFF00, #FFFF00, #FFFF00, #FFFF00, 1);
	draw_text_transformed_color(170, 240, "File saved.", 2, 2, 0, #FFFF00, #FFFF00, #FFFF00, #FFFF00, 1);
}