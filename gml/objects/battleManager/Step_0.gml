var arrow_left = keyboard_check_pressed(vk_left);
var arrow_right = keyboard_check_pressed(vk_right);
var arrow_up = keyboard_check_pressed(vk_up);
var arrow_down = keyboard_check_pressed(vk_down);

var key_a = keyboard_check_pressed(ord("A")) and wasd_enabled;
var key_d = keyboard_check_pressed(ord("D")) and wasd_enabled;
var key_w = keyboard_check_pressed(ord("W")) and wasd_enabled;
var key_s = keyboard_check_pressed(ord("S")) and wasd_enabled;

var left = (arrow_left or key_a);
var right = (arrow_right or key_d);
var up = (arrow_up or key_w);
var down = (arrow_down or key_s);

var key_z = keyboard_check_pressed(ord("Z"));
var key_x = keyboard_check_pressed(ord("X"));

var key_enter = keyboard_check_pressed(vk_enter);
var key_shift = keyboard_check_pressed(vk_shift);

var confirm = (key_z or key_enter);
var cancel = (key_x or key_shift);

// Recalculate some stuff
global.player_maxhp = 16 + (4 * player_lv);
player_atk = -2 + (2 * player_lv) + weapon_atk;
player_def = (player_lv - 1) / 4 + armor_def;

hpbar_x = hp_x + 31;
hpbar_w = global.player_hp * 1.2;

krbar_x = hp_x + 31;
krbar_w = global.player_hp * 1.2 + 1 + global.KR;

maxhpbar_x = hp_x + 31;
maxhpbar_w = global.player_maxhp * 1.2;

kr_x = maxhpbar_x + maxhpbar_w + 10;

hpt_x = maxhpbar_x + maxhpbar_w + 50;

st_x = maxhpbar_x + maxhpbar_w + 89;

mhpt_x = maxhpbar_x + maxhpbar_w + 113; // max hp text x
stateprev = state;

clock += 1;

if (keyboard_check(ord("Q"))) {
	krCon.ApplyKR(1);
	audio_play_sound(playerhit, 1, 0);
}

if (global.player_hp <= 0) { // LOOKS [[Like And Subscribe]] Y OU'RE NOT A [[BIG SHOT!!!]] AN YMORE.
	audio_stop_all();
	gh1999 = instance_create_depth(-100, -100, -9999, gameOverController);
	gh1999.soul_x = soulInst.x;
	gh1999.soul_y = soulInst.y;
	gh1999.textMgr = textMgr;
	textMgr.clear_all_text();
	room_goto(room_gameover);
}

if (state == "buttonselect" and arenaInst.resizing_state == "done") {
	soulInst.defaultmovement = false;
	soulInst.defaultcollisions = false;
	sel_btnb = sel_btn;
	
	if (left) {
		sel_btn -= 1;
	} else if (right) {
		sel_btn += 1;
	}
	
	if (sel_btn < 1) {
		sel_btn = 4;
	} else if (sel_btn > 4) {
		sel_btn = 1;
	}
	
	if (sel_btn != sel_btnb) {
		audio_play_sound(squeak, 1, 0);
	}
	
	fightbt_spr = fightbtn;	
	actbt_spr = actbtn;
	itembt_spr = itembtn;
	mercybt_spr = mercybtn;
	
	if (sel_btn == 1) {
		soulInst.move(41, 447);
		fightbt_spr = FIGHTs_2;		
	} else if (sel_btn == 2) {
		soulInst.move(194, 447);
		actbt_spr = ACTs_2;
	} else if (sel_btn == 3) {
		soulInst.move(354, 447);
		itembt_spr = ITEMs_2;
	} else if (sel_btn == 4) {
		soulInst.move(509, 447);
		mercybt_spr = MERCYs_2;
	}
	if (has_flavor_text == false) {
		flavor_text_index = textMgr.createText(33 + 20, top_wall_y + 25, 30, dtf, true, flavortext);
		has_flavor_text = true;
	}
	
	if (confirm) {
		confirm = false;
		key_z = false;
		key_enter = false;
		audio_play_sound(select, 1, 0);
		var texts = textMgr.get_texts();
		
		if (sel_btn == 1) {
			state = "fightmenu";
			fight_on = true;
			texts[flavor_text_index][4] = false; // deactivate
			has_flavor_text = false;
		} else if (sel_btn == 2) {
			state = "actmenu";
			act_on = true;
			sel_sub = 1;
			texts[flavor_text_index][4] = false; // deactivate
			has_flavor_text = false;
		} else if (sel_btn == 3) {
			if (array_length(items) != 0) { // If there's no items don't do anything
				state = "itemmenu";
				item_on = true;
				sel_sub = 1;
				texts[flavor_text_index][4] = false; // deactivate
				has_flavor_text = false;
			}
		} else if (sel_btn == 4) {
			state = "mercymenu";
			texts[flavor_text_index][4] = false; // deactivate
			has_flavor_text = false;
			mercy_on = true;
		}
	}
}

if (state == "fightmenu") {
	//sel_subb = sel_sub;
	
	if (fight_on) {
		// Initialize FIGHT menu
		soulInst.move(33 + 32, top_wall_y + 28);
		
		fight_1 = textMgr.createTextInstant(33 + 68, top_wall_y + 25, dtf, true, enemy_name);
		// 101, 276
		fight_on = false;
	}
	
	if (cancel) {
		cancel = false;
		key_x = false;
		var texts = textMgr.get_textsi();
		texts[fight_1][4] = false;
		state = "buttonselect";
	}
	
	if (confirm) {
		confirm = false;
		key_z = false;
		key_enter = false;
		var texts = textMgr.get_textsi();
		texts[fight_1][4] = false;
		state = "attacking";
		attackingInit = true;
		fightbt_spr = fightbtn;
		audio_play_sound(select, 1, 0);
	}
}

if (state == "actmenu") {
	sel_subb = sel_sub;
	
	if (act_on) {
		// Initialize ACT menu
		soulInst.move(33 + 32, top_wall_y + 28); // this may be inaccurate
		
		if (total_acts <= 0) {
			show_error("\n\ncongratulations.\nproud of yourself?\n\n", true);
		}
		
		if (can_check) {
			act_check = textMgr.createTextInstant(33 + 68, top_wall_y + 25, dtf, true, "Check");
		}
		
		// Multiple ACTs example
		if (total_acts >= 2) {
			act_2_label = textMgr.createTextInstant(33 + 324, top_wall_y + 25, dtf, true, "Talk");
		}
		
		if (total_acts >= 3) {
			act_3_label = textMgr.createTextInstant(33 + 68, top_wall_y + 57, dtf, true, "Apologize");
		}
		
		if (total_acts == 4) {
			act_4_label = textMgr.createTextInstant(33 + 324, top_wall_y + 57, dtf, true, "Taunt");
		}
		
		act_on = false;
	}
	
	// How the following logic works:
	// example of sel_sub value:
	// in this case sel_sub is 3
	// pretend the soul is +
	//   *Check       *Talk
	// + *Apologize   *Taunt
	// it would be 3. it goes
	// *1 *2
	// *3 *4
	// adding support for 5 and 6 acts would be easy
	// but comeon. there's no way you need 5 ACTs.
	// and i'm too lazy to write an actual good act system.
	// so maybe when i rewrite most of the code in here
	// todo: rewrite act system
	
	if (left or right) { // does the same thing in both cases anyway
		// Supports up to 4 acts.
		if (sel_sub == 1 and total_acts > 1) {
			sel_sub = 2;
		} else if (sel_sub == 2) {
			sel_sub = 1;
		} else if (sel_sub == 3 and total_acts > 3) {
			sel_sub = 4;
		} else if (sel_sub == 4) {
			sel_sub = 3;
		}
	}
	
	if (up or down) {
		if (sel_sub == 1 and total_acts > 2) {
			sel_sub = 3;
		} else if (sel_sub == 2 and total_acts > 3) {
			sel_sub = 4;
		} else if (sel_sub == 3) {
			sel_sub = 1;
		} else if (sel_sub == 4) {
			sel_sub = 2;
		}
	}
	
	if (sel_sub != sel_subb) {
		audio_play_sound(squeak, 1, 0);
		if (sel_sub == 1) {
			soulInst.move(65, 279);
		}
		if (sel_sub == 2) {
			soulInst.move(325, 279); // may be inaccurate
		}
		if (sel_sub == 3) {
			soulInst.move(65, 311); // may be inaccurate
		}
		if (sel_sub == 4) {
			soulInst.move(325, 311); // may be inaccurate
		}
	}
	
	if (cancel) {
		cancel = false;
		key_x = false;
		var texts = textMgr.get_textsi();
		if (can_check) {
			texts[act_check][4] = false;
		}
		if (total_acts >= 2) {
			texts[act_2_label][4] = false;
		}
		if (total_acts >= 3) {
			texts[act_3_label][4] = false;
		}
		if (total_acts == 4) {
			texts[act_4_label][4] = false;
		}
		state = "buttonselect";
	}
	
	if (confirm) {
		soulInst.move(-100, -100);
		confirm = false;
		key_z = false;
		key_enter = false;
		var texts = textMgr.get_textsi();
		if (can_check) {
			texts[act_check][4] = false;
		}
		if (total_acts >= 2) {
			texts[act_2_label][4] = false;
		}
		if (total_acts >= 3) {
			texts[act_3_label][4] = false;
		}
		if (total_acts == 4) {
			texts[act_4_label][4] = false;
		}
		actbt_spr = actbtn;
		audio_play_sound(select, 1, 0);
		if (sel_sub == 1) { // you can put any code here.
			state = "checking";
			check_on = true;
		}
		if (sel_sub == 2) { // you can put any code here.
			state = "actmenu2";
			act2_on = true;
		}
		if (sel_sub == 3) { // you can put any code here.
			state = "actmenu3";
			act3_on = true;
		}
		if (sel_sub == 4) { // you can put any code here.
			state = "actmenu4";
			act4_on = true;
		}
	}
}

if (state == "checking") {
	if (check_on) {
		check_text_index = textMgr.createText(33 + 20, top_wall_y + 25, 30, dtf, true, check_msg);
		check_on = false;
	}
	
	if (confirm) {
		confirm = false;
		key_z = false;
		key_enter = false;
		var texts = textMgr.get_texts();
		texts[check_text_index][4] = false;
		state = "monster_dialog";
	}
}

if (state == "actmenu2") {
	if (act2_on) {
		act2_text_index = textMgr.createText(33 + 20, top_wall_y + 25, 30, dtf, true, "you got exactly what\nyou want!\n2");
		act2_on = false;
	}
	
	if (confirm) {
		confirm = false;
		key_z = false;
		key_enter = false;
		var texts = textMgr.get_texts();
		texts[act2_text_index][4] = false;
		state = "monster_dialog";
	}
}

if (state == "actmenu3") {
	if (act3_on) {
		act3_text_index = textMgr.createText(33 + 20, top_wall_y + 25, 30, dtf, true, "i got exactly who\ni wanna be\n3");
		act3_on = false;
	}
	
	if (confirm) {
		confirm = false;
		key_z = false;
		key_enter = false;
		var texts = textMgr.get_texts();
		texts[act3_text_index][4] = false;
		state = "monster_dialog";
	}
}

if (state == "actmenu4") {
	if (act4_on) {
		act4_text_index = textMgr.createText(33 + 20, top_wall_y + 25, 30, dtf, true, "i was inspired not\nto [HYPERLINK BLOCKED]\n4");
		act4_on = false;
	}
	
	if (confirm) {
		confirm = false;
		key_z = false;
		key_enter = false;
		var texts = textMgr.get_texts();
		texts[act4_text_index][4] = false;
		state = "monster_dialog";
	}
}

if (state == "itemmenu") {
	if (array_length(items) != 0) {
		sel_subb = sel_sub;
	
		if (item_on) {
			// Initialize ITEM menu
			soulInst.move(33 + 32, top_wall_y + 28);
			
			if (page == 1) {
				// add 5 to the x offset
				// take away 2 from the y offset
				if (array_length(items) >= 1) {
					item_1_label = textMgr.createTextInstant(33 + 68, top_wall_y + 25, dtf, true, items[0]);
				}
		
				if (array_length(items) >= 2) {
					item_2_label = textMgr.createTextInstant(33 + 308, top_wall_y + 25, dtf, true, items[1]);
				}
		
				if (array_length(items) >= 3) {
					item_3_label = textMgr.createTextInstant(33 + 68, top_wall_y + 57, dtf, true, items[2]);
				}
		
				if (array_length(items) >= 4) {
					item_4_label = textMgr.createTextInstant(33 + 308, top_wall_y + 57, dtf, true, items[3]);
				}
				
				page_label = textMgr.createTextInstant(33 + 356, top_wall_y + 85, dtf, true, "PAGE 1", false);
			}
			
			if (page == 2) {
				if (array_length(items) >= 5) {
					item_1_label = textMgr.createTextInstant(33 + 68, top_wall_y + 25, dtf, true, items[4]);
				}
		
				if (array_length(items) >= 6) {
					item_2_label = textMgr.createTextInstant(33 + 308, top_wall_y + 25, dtf, true, items[5]);
				}
		
				if (array_length(items) >= 7) {
					item_3_label = textMgr.createTextInstant(33 + 68, top_wall_y + 57, dtf, true, items[6]);
				}
		
				if (array_length(items) == 8) {
					item_4_label = textMgr.createTextInstant(33 + 308, top_wall_y + 57, dtf, true, items[7]);
				}
				
				page_label = textMgr.createTextInstant(33 + 356, top_wall_y + 85, dtf, true, "PAGE 2", false);
			}
			
			item_on = false;
		}
	
		// this works mostly the same as the act menu
	
		if (cancel) {
			cancel = false;
			key_x = false;
			var texts = textMgr.get_textsi();
			if (array_length(items) >= 1) {
				texts[item_1_label][4] = false;
			}
			if (array_length(items) >= 2) {
				texts[item_2_label][4] = false;
			}
			if (array_length(items) >= 3) {
				texts[item_3_label][4] = false;
			}
			if (array_length(items) >= 4) {
				texts[item_4_label][4] = false;
			}
			texts[page_label][4] = false;
			state = "buttonselect";
		}
	
		if (confirm) {
			soulInst.move(-100, -100);
			confirm = false;
			key_z = false;
			key_enter = false;
			var texts = textMgr.get_textsi();
			if (array_length(items) >= 1) {
				texts[item_1_label][4] = false;
			}
			if (array_length(items) >= 2) {
				texts[item_2_label][4] = false;
			}
			if (array_length(items) >= 3) {
				texts[item_3_label][4] = false;
			}
			if (array_length(items) >= 4) {
				texts[item_4_label][4] = false;
			}
			texts[page_label][4] = false;
			itembt_spr = itembtn;
			audio_play_sound(select, 1, 0);
			state = "consumingItem";
			if (page == 1) {
				consumingItem = items[sel_sub-1];
				array_delete(items, array_get_index(items, items[sel_sub-1]), 1);
			} else {
				//switch (sel_sub) {
				//	case (1) {
				//		consumingItem = items[4];
				//	}
				//	case (2) {
				//		consumingItem = items[5];
				//	}
				//	case (3) {
				//		consumingItem = items[6];
				//	}
				//	case (4) {
				//		consumingItem = items[7];
				//	}
				//	default {
				//		show_error("sel_sub was not set to a valid value", true);
				//	}
				//}
				consumingItem = items[sel_sub+3];
				array_delete(items, array_get_index(items, items[sel_sub+3]), 1);
			}
			show_debug_message("Set consumingItem to " + consumingItem);
			csi_on = true;
		}
		
		if (left) {
			if (page == 1) {
				if (sel_sub == 1 and array_length(items) > 5) {
					page = 2;
					sel_sub = 2;
					var texts = textMgr.get_textsi();
					if (array_length(items) >= 1) {
						texts[item_1_label][4] = false;
					}
					if (array_length(items) >= 2) {
						texts[item_2_label][4] = false;
					}
					if (array_length(items) >= 3) {
						texts[item_3_label][4] = false;
					}
					if (array_length(items) >= 4) {
						texts[item_4_label][4] = false;
					}
					texts[page_label][4] = false;
					item_on = true;
				} else if (sel_sub == 1 and array_length(items) > 4) {
					page = 2;
					audio_play_sound(squeak, 1, 0);
					var texts = textMgr.get_textsi();
					if (array_length(items) >= 1) {
						texts[item_1_label][4] = false;
					}
					if (array_length(items) >= 2) {
						texts[item_2_label][4] = false;
					}
					if (array_length(items) >= 3) {
						texts[item_3_label][4] = false;
					}
					if (array_length(items) >= 4) {
						texts[item_4_label][4] = false;
					}
					texts[page_label][4] = false;
					item_on = true;
				} else if (sel_sub == 1 and array_length(items) > 1) {
					sel_sub = 2;
				} else if (sel_sub == 2) {
					sel_sub = 1;
				} else if (sel_sub == 3 and array_length(items) > 7) {
					page = 2;
					sel_sub = 4;
					var texts = textMgr.get_textsi();
					if (array_length(items) >= 1) {
						texts[item_1_label][4] = false;
					}
					if (array_length(items) >= 2) {
						texts[item_2_label][4] = false;
					}
					if (array_length(items) >= 3) {
						texts[item_3_label][4] = false;
					}
					if (array_length(items) >= 4) {
						texts[item_4_label][4] = false;
					}
					texts[page_label][4] = false;
					item_on = true;
				} else if (sel_sub == 3 and array_length(items) > 6) {
					page = 2;
					audio_play_sound(squeak, 1, 0);
					var texts = textMgr.get_textsi();
					if (array_length(items) >= 1) {
						texts[item_1_label][4] = false;
					}
					if (array_length(items) >= 2) {
						texts[item_2_label][4] = false;
					}
					if (array_length(items) >= 3) {
						texts[item_3_label][4] = false;
					}
					if (array_length(items) >= 4) {
						texts[item_4_label][4] = false;
					}
					texts[page_label][4] = false;
					item_on = true;
				} else if (sel_sub == 3 and array_length(items) > 3) {
					sel_sub = 4;
				} else if (sel_sub == 4) {
					sel_sub = 3;
				}
			} else { // Page is TWO so we have to handle things differently
				if (sel_sub == 1) {
					page = 1;
					sel_sub = 2;
					var texts = textMgr.get_textsi();
					if (array_length(items) >= 1) {
						texts[item_1_label][4] = false;
					}
					if (array_length(items) >= 2) {
						texts[item_2_label][4] = false;
					}
					if (array_length(items) >= 3) {
						texts[item_3_label][4] = false;
					}
					if (array_length(items) >= 4) {
						texts[item_4_label][4] = false;
					}
					texts[page_label][4] = false;
					item_on = true;
				} else if (sel_sub == 2) {
					sel_sub = 1;
				} else if (sel_sub == 3) {
					page = 1;
					sel_sub = 4;
					var texts = textMgr.get_textsi();
					if (array_length(items) >= 1) {
						texts[item_1_label][4] = false;
					}
					if (array_length(items) >= 2) {
						texts[item_2_label][4] = false;
					}
					if (array_length(items) >= 3) {
						texts[item_3_label][4] = false;
					}
					if (array_length(items) >= 4) {
						texts[item_4_label][4] = false;
					}
					texts[page_label][4] = false;
					item_on = true;
				} else if (sel_sub == 4) {
					sel_sub = 3;
				}
			}
		}
		
		if (right) {
			if (page == 1) {
				if (sel_sub == 1 and array_length(items) > 1) {
					sel_sub = 2;
				} else if (sel_sub == 2 and array_length(items) > 4) {
					page = 2;
					sel_sub = 1;
					var texts = textMgr.get_textsi();
					if (array_length(items) >= 1) {
						texts[item_1_label][4] = false;
					}
					if (array_length(items) >= 2) {
						texts[item_2_label][4] = false;
					}
					if (array_length(items) >= 3) {
						texts[item_3_label][4] = false;
					}
					if (array_length(items) >= 4) {
						texts[item_4_label][4] = false;
					}
					texts[page_label][4] = false;
					item_on = true;
				} else if (sel_sub == 2) {
					sel_sub = 1;
				} else if (sel_sub == 3 and array_length(items) > 3) {
					sel_sub = 4;
				} else if (sel_sub == 4 and array_length(items) > 6) {
					page = 2;
					sel_sub = 3;
					var texts = textMgr.get_textsi();
					if (array_length(items) >= 1) {
						texts[item_1_label][4] = false;
					}
					if (array_length(items) >= 2) {
						texts[item_2_label][4] = false;
					}
					if (array_length(items) >= 3) {
						texts[item_3_label][4] = false;
					}
					if (array_length(items) >= 4) {
						texts[item_4_label][4] = false;
					}
					texts[page_label][4] = false;
					item_on = true;
				} else if (sel_sub == 4) {
					sel_sub = 3;
				} else {
					show_debug_message("Path 01: No requirement was met");
				}
			} else {
				if (sel_sub == 1 and array_length(items) > 5) {
					sel_sub = 2;
				} else if (sel_sub == 1) {
					page = 1;
					audio_play_sound(select, 1, 0);
					var texts = textMgr.get_textsi();
					if (array_length(items) >= 1) {
						texts[item_1_label][4] = false;
					}
					if (array_length(items) >= 2) {
						texts[item_2_label][4] = false;
					}
					if (array_length(items) >= 3) {
						texts[item_3_label][4] = false;
					}
					if (array_length(items) >= 4) {
						texts[item_4_label][4] = false;
					}
					texts[page_label][4] = false;
					item_on = true;
				} else if (sel_sub == 2) {
					page = 1;
					sel_sub = 1;
					var texts = textMgr.get_textsi();
					if (array_length(items) >= 1) {
						texts[item_1_label][4] = false;
					}
					if (array_length(items) >= 2) {
						texts[item_2_label][4] = false;
					}
					if (array_length(items) >= 3) {
						texts[item_3_label][4] = false;
					}
					if (array_length(items) >= 4) {
						texts[item_4_label][4] = false;
					}
					texts[page_label][4] = false;
					item_on = true;
				} else if (sel_sub == 3 and array_length(items) > 7) {
					sel_sub = 4;
				} else if (sel_sub == 3) {
					page = 1;
					audio_play_sound(select, 1, 0);
					var texts = textMgr.get_textsi();
					if (array_length(items) >= 1) {
						texts[item_1_label][4] = false;
					}
					if (array_length(items) >= 2) {
						texts[item_2_label][4] = false;
					}
					if (array_length(items) >= 3) {
						texts[item_3_label][4] = false;
					}
					if (array_length(items) >= 4) {
						texts[item_4_label][4] = false;
					}
					texts[page_label][4] = false;
					item_on = true;
				} else if (sel_sub == 4) {
					page = 1;
					sel_sub = 3;
					var texts = textMgr.get_textsi();
					if (array_length(items) >= 1) {
						texts[item_1_label][4] = false;
					}
					if (array_length(items) >= 2) {
						texts[item_2_label][4] = false;
					}
					if (array_length(items) >= 3) {
						texts[item_3_label][4] = false;
					}
					if (array_length(items) >= 4) {
						texts[item_4_label][4] = false;
					}
					texts[page_label][4] = false;
					item_on = true;
				} else {
					show_debug_message("Path 02: No requirement was met");
				}
			}
		}
	
		if (up or down) {
			if (page == 1) {
				if (sel_sub == 1 and array_length(items) > 2) {
					sel_sub = 3;
				} else if (sel_sub == 2 and array_length(items) > 3) {
					sel_sub = 4;
				} else if (sel_sub == 3) {
					sel_sub = 1;
				} else if (sel_sub == 4) {
					sel_sub = 2;
				}
			} else {
				if (sel_sub == 1 and array_length(items) > 5) {
					sel_sub = 3;
				} else if (sel_sub == 2 and array_length(items) > 7) {
					sel_sub = 4;
				} else if (sel_sub == 3) {
					sel_sub = 1;
				} else if (sel_sub == 4) {
					sel_sub = 2;
				}
			}
		}
		
		
		if (sel_sub != sel_subb) {
			audio_play_sound(squeak, 1, 0);
			show_debug_message("Changed from position " + string(sel_subb) + " to position " + string(sel_sub));
		}
		if (sel_sub == 1) {
			soulInst.move(33 + 32, top_wall_y + 28);
		}
		if (sel_sub == 2) {
			soulInst.move(33 + 280, top_wall_y + 28);
		}
		if (sel_sub == 3) {
			soulInst.move(33 + 32, top_wall_y + 60);
		}
		if (sel_sub == 4) {
			soulInst.move(33 + 280, top_wall_y + 60);
		}
	} else {
		show_error("\n\n* you don't have any items.\n* and somehow, you still ended up here.\n* ...i have honestly no idea how this happened.\n* unless, of course, you're the developer...\n* or a dirty hacker.\n* yeah, get outta here.\n\n", true);
	}
}

if (state == "consumingItem") {
	if (csi_on) {
		// This is where you need to handle items.
		page = 1;
		sel_sub = 1;
		soulInst.move(-100, -100);
		switch (consumingItem) {
			case "Pie":
				global.player_hp = global.player_maxhp - global.KR;
				item_flavor_text = "You ate the Butterscotch Pie.\nYour HP was maxed out.";
			break;
			
			case "I.Noodles":
				if (global.player_hp + 90 > global.player_maxhp) {
					global.player_hp = global.player_maxhp - global.KR;
					item_flavor_text = "They're better dry.\nYour HP was maxed out.";
				} else {
					global.player_hp += 90;
					item_flavor_text = "They're better dry.\nYou recovered 90 HP!";
				}
			break;
			
			case "Steak":
				if (global.player_hp + 60 > global.player_maxhp) {
					global.player_hp = global.player_maxhp - global.KR;
					item_flavor_text = "You ate the Face Steak.\nYour HP was maxed out.";
				} else {
					global.player_hp += 60;
					item_flavor_text = "You ate the Face Steak.\nYou recovered 60 HP!";
				}
			break;
			
			case "SnowPiece":
				if (global.player_hp + 45 > global.player_maxhp) {
					global.player_hp = global.player_maxhp - global.KR;
					item_flavor_text = "You ate the Snowman Piece.\nYour HP was maxed out.";
				} else {
					global.player_hp += 45;
					item_flavor_text = "You ate the Snowman Piece.\nYou recovered 45 HP!";
				}
			break;
			
			case "L. Hero":
				if (global.player_hp + 40 > global.player_maxhp) {
					global.player_hp = global.player_maxhp - global.KR;
					item_flavor_text = "You eat the Legendary Hero.\nATTACK increased by 4!\nYour HP was maxed out.";
				} else {
					global.player_hp += 40;
					item_flavor_text = "You eat the Legendary Hero.\nATTACK increased by 4!\nYou recovered 40 HP!";
				}
				weapon_atk += 4; // Example of special ITEM effects
				// We use weapon_atk instead of player_atk because player_atk is recalculated every frame
			break;
			
			default:
				global.player_hp += choice(0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100);
				// this won't work with KR but like whatever
				item_flavor_text = "You consumed the Undefined...?\nYou recovered...some of your HP.";
		}
		show_debug_message(item_flavor_text);
		csi_text_index = textMgr.createText(33 + 20, top_wall_y + 25, 30, dtf, true, item_flavor_text);
		csi_on = false;
	}
	
	if (confirm) {
		confirm = false;
		key_z = false;
		key_enter = false;
		var texts = textMgr.get_texts();
		texts[csi_text_index][4] = false;
		state = "monster_dialog";
	}
}

if (state == "mercymenu") {
	// you can do some special stuff here if you want to
	// for example, in Last Breath Renewed, aka the most unbalanced fangame ever,
	// sans shatters your flee button.
	// as i'm writing this i'm realizing there is no flee button to begin with smh
	
	if (mercy_on) {
		spare_label = textMgr.createTextInstant(33 + 68, top_wall_y + 25, dtf, true, "Spare");
		soulInst.move(33 + 32, top_wall_y + 28); // may be inaccurate
		mercy_on = false;
	}
	
	if (confirm) {
		show_debug_message("spared");
		confirm = false;
		key_z = false;
		key_enter = false;
		mercybt_spr = mercybtn;
		audio_play_sound(select, 1, 0);
		var texts = textMgr.get_textsi();
		texts[spare_label][4] = false;
		state = "monster_dialog";
	}
	
	if (cancel) {
		cancel = false;
		key_x = false;
		var texts = textMgr.get_textsi();
		texts[spare_label][4] = false;
		state = "buttonselect";
	}
}

if (state == "attacking") {
	if (attackingInit) {
		soulInst.move(-100, -100);
		
		fromSide = irandom(1);
		
		if (fromSide == 0) {
			slicer_x = right_wall_x + 5;
			slicer_y = top_wall_y + 6;
		} else if (fromSide == 1) {
			slicer_x = 33 - 5;
			slicer_y = top_wall_y + 6;
		}
		
		attackingInit = false;
	}
	
	if (fromSide == 0) { // Coming from right
		slicer_x -= sspeed;
	} else if (fromSide == 1) { // from left
		slicer_x += sspeed;
	}
	
	if ((slicer_x >= right_wall_x + 5 and fromSide == 1) or (slicer_x <= 33 - sprite_get_width(atk_slicer) and fromSide == 0)) {
		sspeed = 0;
		sliced = true;
		distance_from_center = 999;
		damage = -1; // MISS
		timer_1_c = true;
	}
	
	if (confirm and not sliced) {
		sspeed = 0;
		slicing = true;
		sliced = true;
		distance_from_center = point_distance(slicer_x, 0, 320, 0); // Dangerous! This will use the CENTER OF THE SCREEN
		// so if you've moved the target this will be inaccurate
		// note: this doesnt use the center of the reticle because neither does undertale (i think?)
		
		if (distance_from_center <= 12) {
		    damage = round((player_atk - enemy_def + random(2)) * 2.2);
		} else if (distance_from_center > 12) {
		    damage = round((player_atk - enemy_def + random(2)) * ((562 - distance_from_center)/562) * 2);
		}
		
		audio_play_sound(slash, 1, 0);
		animIndex = 0;
		dodging = true;
	}
}

if (state == "monster_dialog") {
	soulInst.move(floor((arenaInst.x + (sprite_get_width(arenaInst.sprite_index) * arenaInst.image_xscale))) - floor(sprite_get_width(soulInst.image_index) / 2), floor((arenaInst.y + (sprite_get_height(arenaInst.sprite_index) * arenaInst.image_yscale))) - floor(sprite_get_height(soulInst.image_index) / 2));
	if (array_length(mdialog) != 0) {
		if (dialogInit == false) {
			dialogIndex = textMgr.createPagedText(dialog_bubble_x + 34, dialog_bubble_y + 15, 30, sans_battle, true, mdialog, c_black, false, 10, 20);
			dialogInit = true;
		}
		
		if (textMgr.getPageIndex(dialogIndex) == array_length(mdialog) - 1 and (keyboard_check_pressed(ord("Z")) or keyboard_check_pressed(vk_enter))) {
			state = "monsterattack";
			textsp = textMgr.get_textsp();
			textsp[dialogIndex][4] = false;
		}
	} else {
		state = "monsterattack";
	}
}

if (dodging and animIndex <= array_length(dodgeAnim) - 1) {
	legs_x += dodgeAnim[animIndex];
	body_x += dodgeAnim[animIndex];
	head_x += dodgeAnim[animIndex];
	animIndex += 1;
}

if (state == "monsterattack") {
	soulInst.defaultmovement = true;
	soulInst.defaultcollisions = true;
	if (turn == 1) {
		
	} else if (turn == 2) {
		
	} else {
		
	}
}

// See "Lossless Recording" under Notes for details on what this does.

if (!directory_exists("frames")) {
    directory_create("frames");
}

if (global.recording == true) {
    filename = (("frames/frame_" + string(global.frame_count)) + ".png");
    screen_save(filename);
    global.frame_count += 1;
}