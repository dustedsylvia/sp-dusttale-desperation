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

if (clock == 679) {
	draw_set_font(dtf_sans);
	
}

if (clock >= 680 and clock <= 8000) {
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_text_transformed_colour(sanstextx, sanstexty, sanstext, 2, 2, 0, c_red, c_red, c_red, c_red, 1);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}

if (clock >= 2150 and clock <= 2740) {
	draw_sprite_ext(sanssprite, 0, -30, 30, 3, 3, 0, c_white, sansopacity);
}

sans_x = 320;
sans_y = 240;

sanstextx = sansbasex;
sanstexty = sansbasey;