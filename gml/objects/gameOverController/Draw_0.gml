if (state == 1) { // Need to draw the unbroken SOUL
	draw_sprite(redsoul, 1, soul_x, soul_y);
}

if (state == 2) { // Broken SOUL
	draw_sprite(brokensoul, 1, soul_x - 2, soul_y);
	// soul_x - 2 because brokensoul is 20x16 while normal is 16x16
	// so we have to deal with the offset
}

if (state == 3) { // Create shards
	for (var i = 0; i < 5; i++) {
		instance_create_depth(soul_x, soul_y, -9999, soul_shard);
	}
}

if (state == 4) { // first game over thing
	gameOverOpacity += 0.02;
	draw_sprite_ext(gameover, 1, 114, 36, 1, 1, 0, c_white, gameOverOpacity);
}

if (state == 5) {
	draw_sprite_ext(gameover, 1, 114, 36, 1, 1, 0, c_white, 1);
}

if (state == 6) {
	draw_sprite_ext(gameover, 1, 114, 36, 1, 1, 0, c_white, 1);
}

if (state == 7) { // second game over thing
	gameOverOpacity -= 0.03;
	draw_sprite_ext(gameover, 1, 114, 36, 1, 1, 0, c_white, gameOverOpacity);
}
