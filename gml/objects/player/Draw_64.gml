if (inmenu) {
	draw_sprite(menubox1, 0, 32, 52);
	if (array_length(global.inventory) == 0) {
		draw_sprite(menubox2, 0, 32, 168);
	} else {
		draw_sprite(menubox2, 1, 32, 168);
	}
	draw_set_font(dtf_sans);
	draw_text_transformed(46, 65, global.player_name, 2, 2, 0);
	draw_set_font(cryptoftommorow);
	draw_text(46, 100, "LV");
	draw_text(82, 100, string(global.player_lv));
	draw_text(46, 118, "HP");
	draw_text(82, 118, string(global.player_hp) + "/" + string(global.player_maxhp));
	draw_text(46, 136, "G");
	draw_text(82, 136, string(global.player_gold));
	if (menustate == 1) {
		if (menusel == 1) {
			draw_sprite(s_detailed_soul, 0, 56, 196);
		} else if (menusel == 2) {
			draw_sprite(s_detailed_soul, 0, 56, 232);
		}
	}
	
	if (menustate == 2) {
		draw_sprite(itembox, 0, 188, 52);
		draw_sprite(s_detailed_soul, 0, 208, 88);
		draw_set_font(dtf_sans);
		draw_text_transformed(232, 80, string_join_ext("\n", global.inventory), 2, 2, 0);
	}
	if (menustate == 3) {
		draw_sprite(statbox, 0, 188, 52);
		draw_set_font(dtf_sans);
		draw_text_transformed(216, 92, "\"" + global.player_name + "\"", 2, 2, 0);
		draw_text_transformed(216, 152, "LV " + string(global.player_lv), 2, 2, 0);
		draw_text_transformed(216, 184, "HP " + string(global.player_hp) + "/" + string(global.player_maxhp), 2, 2, 0);
		draw_text_transformed(216, 248, "AT " + string(global.player_atk) + "(" + string(global.weapon_atk) + ")", 2, 2, 0);
		draw_text_transformed(216, 280, "DF " + string(global.player_def) + "(" + string(global.armor_def) + ")", 2, 2, 0);
		draw_text_transformed(216, 340, "WEAPON: " + global.weapon, 2, 2, 0);
		draw_text_transformed(216, 372, "ARMOR: " + global.armor, 2, 2, 0);
		draw_text_transformed(216, 412, "GOLD: " + string(global.player_gold), 2, 2, 0);
		draw_text_transformed(384, 248, "EXP: " + string(global.player_exp), 2, 2, 0);
		draw_text_transformed(384, 280, "NEXT: " + calculateRemainingExp(), 2, 2, 0);
	}
}