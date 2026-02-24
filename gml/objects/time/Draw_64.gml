if (global.mode != "Normal") {
	draw_set_font(mnc);
	draw_text(5, 5, global.mode);
}

if (global.drawsidebars) {
	draw_sprite_stretched(black_pixel, 0, -1000, 0, 1000, 1000);
	draw_sprite_stretched(black_pixel, 0, 640, 0, 1000, 1000);
}