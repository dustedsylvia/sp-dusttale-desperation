if (state == 2) {
	if (clock <= 60) {
		var coords = worldtogui(instance_find(player, 0).x+(sprite_get_width(s_frisk_down)/2), instance_find(player, 0).y-25);
		draw_sprite_ext(exclaim, 0, coords[0], coords[1], 2, 2, 0, c_white, 1);
	}
	
	if (clock >= 61 and clock <= 67) {
		draw_sprite_ext(black, 0, 0, 0, 1, 1, 0, c_white, 1);
		var coords = worldtogui(instance_find(player, 0).x+(sprite_get_width(s_frisk_down)/2), instance_find(player, 0).y+15);
		draw_sprite_ext(redsoul, 0, coords[0], coords[1], 1, 1, 0, c_white, 1);
	}
	
	if (clock >= 75 and clock <= 82) {
		draw_sprite_ext(black, 0, 0, 0, 1, 1, 0, c_white, 1);
		var coords = worldtogui(instance_find(player, 0).x+(sprite_get_width(s_frisk_down)/2), instance_find(player, 0).y+15);
		draw_sprite_ext(redsoul, 0, coords[0], coords[1], 1, 1, 0, c_white, 1);
	}
	
	if (clock == 83) {
		state = 3;
		var coords = worldtogui(instance_find(player, 0).x+(sprite_get_width(s_frisk_down)/2), instance_find(player, 0).y+15);
		soulx = coords[0];
		souly = coords[1];
		var fade = instance_create_depth(0, 0, -9999, fader);
		fade.bounce = true;
		fade.fadeOverFrames = 20;
		fade.startingOpacity = 0;
		fade.targetOpacity = 1;
		fade.executeOnFirstBounce = function() {
			room_goto(room_necroptosis);
			instance_destroy(id);
		}
		fade.executeOnCompletion = function() {
			// don't actually have to do anything here
		}
		fade.mode = "fadeOut";
		audio_play_sound(battlefall, 1, false);
		global.prevroom = room;
	}
}

if (state == 3) {
	draw_sprite_ext(black, 0, 0, 0, 1, 1, 0, c_white, 1);
	soulx = lerp(soulx, 41, 0.2);
	souly = lerp(souly, 447, 0.2);
	draw_sprite_ext(redsoul, 0, soulx, souly, 1, 1, 0, c_white, 1);
}

if (drawDialog) {
	draw_sprite_ext(sans_dialog_sad, 0, 32, 320, 1, 1, 0, c_white, 1);
}