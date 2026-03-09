draw_clear_alpha(c_black, 1); // clear screen

draw_sprite_ext(fightbt_spr, 1, fbt_x, fbt_y, 1, 1, 0, c_white, 1);
draw_sprite_ext(actbt_spr, 1, abt_x, abt_y, 1, 1, 0, c_white, 1);
draw_sprite_ext(itembt_spr, 1, ibt_x, ibt_y, 1, 1, 0, c_white, 1);
draw_sprite_ext(mercybt_spr, 1, mbt_x, mbt_y, 1, 1, 0, c_white, 1);

draw_set_font(mnc);
draw_set_color(c_white);

draw_text(name_x, name_y, player_name);
draw_text(lv_x, lv_y, "LV " + string(player_lv));

draw_sprite_ext(hpletters, 1, hp_x, hp_y, 1, 1, 0, c_white, 1);

draw_rectangle_colour(maxhpbar_x, maxhpbar_y, maxhpbar_x + maxhpbar_w - 1, maxhpbar_y + maxhpbar_h - 1, #c00000, #c00000, #c00000, #c00000, false);
if (kr_enabled) {
	draw_rectangle_colour(krbar_x, krbar_y, krbar_x + krbar_w - 1, krbar_y + krbar_h - 1, #ff00ff, #ff00ff, #ff00ff, #ff00ff, false);
}
draw_rectangle_colour(hpbar_x, hpbar_y, hpbar_x + hpbar_w - 1, hpbar_y + hpbar_h - 1, c_yellow, c_yellow, c_yellow, c_yellow, false);

// From https://forum.gamemaker.io/index.php?threads/formatting-numbers-with-preceding-zeros-i-e-00001-instead-of-1.76153/
var displayedhp = global.player_hp + global.KR;
hpcolor = c_white;
if (global.KR > 0) {
	hpcolor = #ff00ff;
}
var hpstring = string(round(displayedhp));
var maxhpstring = string(round(global.player_maxhp));
hpstring = string_repeat("0", max(0, 2 - string_length(hpstring))) + hpstring;
maxhpstring = string_repeat("0", max(0, 2 - string_length(maxhpstring))) + maxhpstring;

if (kr_enabled) {
	draw_sprite_ext(krletters, 1, round(kr_x), round(kr_y), 1, 1, 0, c_white, 1);	

	draw_text_colour(round(hpt_x), round(hpt_y), hpstring, hpcolor, hpcolor, hpcolor, hpcolor, 1);
	draw_text_colour(round(st_x), round(st_y), "/", hpcolor, hpcolor, hpcolor, hpcolor, 1);
	draw_text_colour(round(mhpt_x), round(mhpt_y), maxhpstring, hpcolor, hpcolor, hpcolor, hpcolor, 1);
} else {
	 // Todo: Fix non-karma retribution coords later
	draw_text(round(hpt_x), round(hpt_y), hpstring);
	draw_text(round(st_x), round(st_y), "/");
	draw_text(round(mhpt_x), round(mhpt_y), maxhpstring);
}


if (phase == 1) {
	// This code from NXTALE (Objects\Battle\Characters\Sans\obj_sansb_body\Draw)
	if (movemode == 3) {
		sin_controller += 1;
		y_offset = (sin((sin_controller / 18)) * 2);
	}
	if (movemode == 2) {
		sin_controller += 1;
		y_offset = (sin((sin_controller / 15)) * 4);
	}
	if (movemode == 1) {
		sin_controller += 1;
		y_offset = sin((sin_controller / 3));
		x_offset = cos((sin_controller / 6));
	}
	if (movemode == 0) {
		sin_controller = 0;
		y_offset = 0;
		x_offset = 0;
	}
	// end nxtale code
	
	draw_sprite_ext(legs_normal, 0, legs_x, legs_y, 2, 2, 0, c_white, 1);
	draw_sprite_ext(body_normal, 0, body_x + x_offset, body_y + (y_offset / 1.5), 2, 2, 0, c_white, 1);
	draw_sprite_ext(head_normal, 0, head_x + x_offset, head_y + y_offset, 2, 2, 0, c_white, 1);
}

if (state == "attacking") {
	draw_sprite_ext(atk_judger, 1, 47, 264, 1, 1, 0, c_white, 1);
	if (timer_1_c) {
		timer_1 += 1;
	}
	
	if (slicing) {
		slicer_f = draw_slice(307, 100, slicer_f);
		atk_slicer_f = draw_target(slicer_x, slicer_y, atk_slicer_f);
	} else {
		draw_sprite_ext(atk_slicer, 0, slicer_x, slicer_y, 1, 1, 0, c_white, 1);
	}
	
	if (atk_slicer_f == 7) {
		timer_1_c = true;
	}
	if (timer_1 == 5) {
		// Scripted damage example
		if (damage == -1) {
			// do NOT change this. this is when you miss the bar completely and damage HAS to be assigned -1!
		} else if (turn == 0) {
			damage = 0; // I don't think it's possible for the engine to calculate a damage value of 0.
			            // so you could only increase turn when this is 0 because that means sans dodged
						// or blocked or something
		} else {
			damage = 2048;
			audio_play_sound(hit_snd, 1, 0);
		}
		if (damage > 0) { // don't heal the enemy
			enemy_hp -= damage;
		}
		damageTextIndex = textMgr.createDamageText(320, 50, true, string(damage), c_red, 1, true, true);
	}
	
	if (timer_1 == 34) { // This scales based on attack strength! (50-59 frames)
		                 // Shrinking always takes 13 frames
						 // Idk wth i was thinking its after 34 frames?? i think???
						 // im very confused
						 // TODO: find out wth happened here because SOMETHINGS not right
						 // im pretty sure lots of things scale based on attack strength
	}
	
	if (timer_1 == 46) {
		turn += 1;
		attackingInit = true;
		fromSide = NaN;
		sliced = false;
		slicing = false;
		timer_1_c = false;
		timer_1 = 0;
		atk_slicer_f = 0;
		slicer_f = 0;
		sspeed = 10;
		state = "monster_dialog";
		textMgr.get_textsd()[damageTextIndex][4] = false;
	}
}

if (state == "monster_dialog") {
	if (_needsSetup == true) { // resize arena
		if (turn == 1) {
			mdialog[0] = "i am sans"; // Dialog must be set here or it causes bugs
			mdialog[1] = "sans the skeleton";
			mdialog[2] = "and here is some\nvery very long\ndialog\nnyeh heh heh!!!!!";

			arenaInst.resize(365, 130);
		} if (turn == 2) {
			mdialog[0] = "that did NOT hit me.";
			
			arenaInst.resize(365, 130);
		} else {
			mdialog = ["turn: " + string(turn)];
			
			arenaInst.resize(365, 130);
		}
		_needsSetup = false;
	}
	
	if (array_length(mdialog) != 0) {
		draw_sprite_ext(dialog_bubble, 0, dialog_bubble_x, dialog_bubble_y, 1, 1, 0, c_white, 1);
		//draw_set_color(c_black);
		//draw_set_font(sans_battle);
		//draw_text_ext(dialog_bubble_x + 34, dialog_bubble_y + 15, mdialog[0], 20, 100000);
	
		//draw_set_font(mnc);
		//draw_set_color(c_white);
	}
}

if (state == "monsterattack") {
	if (needsSetup == true) { // resize arena
		if (turn == 1) {
			attack_timer = 7 * 1000000; // has to be in microseconds
			soulmode = 0;
		} else {
			attack_timer = 7 * 1000000;
			soulmode = 0;
		}
		needsSetup = false;
	}
	
	// Here's where you can program your attacks!!
	if (turn % 2 == 0) {
		if (clock % 17 == 0) {
			createBoneAttack(1, 185, 110, 10, 0);
			createBoneAttack(639, 308, 110, -10, 0);
		}
	} else {
		if (clock % 20 == 0) {
			createBoneAttack(1, 308, 110, 10, 0);
			createBoneAttack(639, 185, 110, -10, 0);
		}
	}
	
	attack_timer -= delta_time;
	
	if (attack_timer <= 0) {
		if (alwaysResetArena) {
			arenaInst.resize(565, 130, "height");
			soulInst.move(-100, -100);
		}
		state = "buttonselect";
		_needsSetup = true;
		needsSetup = true;
		attacks = [];
	}
}

damagedThisFrame = false;
for (var i = 0; i < array_length(attacks); i++) {
	bone = attacks[i];
	if (bone[5] != false) { // bone is active!
		// first we need to draw the top bone tip
		draw_sprite(bonetip, 1, bone[0], bone[1]);
		// then we have to draw the middle of the bone
		draw_rectangle(bone[0] + 2, bone[1] + 6, bone[0] + 7, bone[1] + bone[2] + 5, false);
		// finally draw the bottom bone tip
		draw_sprite_ext(bonetip, 1, bone[0] + 10, bone[1] + 12 + bone[2], 1, 1, 180, c_white, 1);
		// and the bone should be drawn correctly!
		// keyword: should		
		
		// debugging collisions
		//draw_set_alpha(0.5);
		//draw_rectangle_colour(bone[0], bone[1], bone[0] + 10, bone[1] + 12 + bone[2], #ff00ff, #ff00ff, #ff00ff, #ff00ff, false);
		//draw_rectangle_colour(soul_x, soul_y, soul_x + sprite_get_width(SOULs), soul_y + sprite_get_height(SOULs), #00ffff, #00ffff, #00ffff, #00ffff, false);
		//draw_set_alpha(1);
		
		// next we have to see if the bone is colliding with the player
		if (simple_box_collision(bone[0], bone[0] + 10, bone[1], bone[1] + 12 + bone[2], soulInst.x, soulInst.x + sprite_get_width(redsoul), soulInst.y, soulInst.y + sprite_get_height(redsoul)) and !damagedThisFrame) {
			damagedThisFrame = true;
			krCon.ApplyKR(bone[6]);
			if (bone[6] > 1) {
				bone[6] = 1;
			}
			audio_play_sound(playerhit, 1, 0);
			//show_debug_message("Collision detected: " + string(delta_time));
		}
		
		// finally move the bone
		bone[0] += bone[3]; // add xspeed to x
		bone[1] += bone[4]; // add yspeed to y
		// We do this after the first draw so that it starts at the correct X and Y.
	}
}


// See "Lossless Recording" under Notes for details on what this does.
if (global.recording == true) {
    draw_set_font(dtf);
    draw_set_color(c_white);
    draw_text_transformed((room_width - 220), 10, "Feeling of being watched...", 0.5, 0.5, 0);
}