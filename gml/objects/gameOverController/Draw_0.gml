if (state == 1) {
	draw_sprite(redsoul, 1, soulx, souly);
}

if (state == 2) { // Broken SOUL
	draw_sprite(brokensoul, 1, soulx - 2, souly);
	// soul_x - 2 because brokensoul is 20x16 while normal is 16x16
	// so we have to deal with the offset
}

if (state == 3) { // Create shards
	for (var i = 0; i < 5; i++) {
		instance_create_depth(soulx, souly, depth-5, soul_shard);
	}
}

if (state == 4) { // first game over thing
	gameoveropacity += 0.02;
	draw_sprite_ext(gameover, 1, 114, 36, 1, 1, 0, c_white, gameoveropacity);
}

if (state == 5) {
	draw_sprite_ext(gameover, 1, 114, 36, 1, 1, 0, c_white, 1);
}

if (state == 6) {
	draw_sprite_ext(gameover, 1, 114, 36, 1, 1, 0, c_white, 1);
}

if (state == 7) { // second game over thing
	gameoveropacity -= 0.03;
	draw_sprite_ext(gameover, 1, 114, 36, 1, 1, 0, c_white, gameoveropacity);
}
