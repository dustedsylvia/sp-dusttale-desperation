if (clock >= 100 and clock <= 160) {
	draw_set_font(damagef);
	draw_text_colour(-30, -30, alotofdamage, c_red, c_red, c_red, c_red, textalpha);
}

if (clock >= 191 and clock <= 300) {
	draw_sprite(sans_death_intro, 0, sans_x, sans_y);
}

if (clock >= 321 and clock <= 430) {
	draw_sprite(sans_death_intro, 1, sans_x, sans_y);
}

if (clock == 1309) {//679) {
	draw_set_font(dtf_sans);
	draw_set_halign(fa_center);
}

if (clock >= 680 and clock <= 1670) {
	draw_text_transformed_colour(320, 20, sanstext, 2, 2, 0, c_white, c_white, c_white, c_white, sanstextalpha)
}

sans_x = 320;
sans_y = 240;