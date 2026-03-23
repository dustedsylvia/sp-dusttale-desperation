var arrow_left = keyboard_check_pressed(vk_left);
var arrow_right = keyboard_check_pressed(vk_right);
var arrow_up = keyboard_check_pressed(vk_up);
var arrow_down = keyboard_check_pressed(vk_down);

var key_a = keyboard_check_pressed(ord("A")) and global.wasd_enabled;
var key_d = keyboard_check_pressed(ord("D")) and global.wasd_enabled;
var key_w = keyboard_check_pressed(ord("W")) and global.wasd_enabled;
var key_s = keyboard_check_pressed(ord("S")) and global.wasd_enabled;

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

if (global.player_hp <= 0) {
	room_goto(room_gameover);
}

if (setup_kr) {
	// NOTE: THE LOCATION OF THIS IS ONLY UPDATED ONCE!!!
	global.kr_obj = instance_create_depth(global.hpbar.x+global.player_maxhp*1.2+10, 406, depth-5, kr);
	global.hp_text.x = global.hpbar.x+global.player_maxhp*1.2+50;
	setup_kr = false;
}

if (playbgm) {
	playbgm = false;
	audioid = audio_play_sound(STPWYFSIAEU, 2, false);
}

if (global.battle_state == "actionselect") {
	if (left) {
		global.selected -= 1;
	} else if (right) {
		global.selected += 1;
	}
	
	if (global.selected < 1) {
		global.selected = 4;
	} else if (global.selected > 4) {
		global.selected = 1;
	}
	
	if (global.selected != prevselected) {
		audio_play_sound(squeak, 1, false);
		updateSoulLocation = true;
	}
	
	prevselected = global.selected;
	
	if (updateSoulLocation) {
		if (global.selected == 1) {
			global.soul.MoveTo(41, 447);
		} else if (global.selected == 2) {
			global.soul.MoveTo(194, 447);
		} else if (global.selected == 3) {
			global.soul.MoveTo(354, 447);
		} else if (global.selected == 4) {
			global.soul.MoveTo(509, 447);
		}
		updateSoulLocation = false;
	}
	
	if (confirm) {
		confirm = false;
		audio_play_sound(select, 1, false);
		if (global.selected == 1) {
			global.battle_state = "fightmenu";
			global.soul.LerpTo(65, 279);
			if (global.canspare == false) {
				global.arena_text.UpdateText(["[instant]* [noadvance]" + global.enemy_name]);
			} else {
				global.arena_text.UpdateText(["[instant]* [noadvance][asteriskcolor1:#FFFF00][color:#FFFF00]" + global.enemy_name]);
			}
			global.arena_text.MoveTo(73, 248);
		} else if (global.selected == 2) {
			global.battle_state = "actmenu";
			global.soul.LerpTo(65, 279);
			if (global.canspare == false) {
				global.arena_text.UpdateText(["[instant]* [noadvance]" + global.enemy_name]);
			} else {
				global.arena_text.UpdateText(["[instant]* [noadvance][asteriskcolor1:#FFFF00][color:#FFFF00]" + global.enemy_name]);
			}
			global.arena_text.MoveTo(73, 248);
		} else if (global.selected == 3 and array_length(global.inventory) != 0) {
			global.battle_state = "itemmenu";
			global.soul.LerpTo(65, 279);
			itemindex = 0;
			global.arena_text.UpdateText(getItemText());
			global.arena_text.MoveTo(73, 248);
		} else if (global.selected == 4) {
			global.battle_state = "mercymenu";
			global.soul.LerpTo(65, 279);
			global.arena_text.UpdateText(["[instant]* [noadvance]Spare\n* [noadvance]Flee"]);
			global.arena_text.MoveTo(73, 248);
			global.selected_submenu = 1;
		}
	}
}

if (global.battle_state == "fightmenu") {
	if (cancel) {
		global.soul.LerpTo(41, 447);
		global.battle_state = "actionselect";
		var t = [];
		array_copy(t, 0, global.currenttext, 0, array_length(global.currenttext));
		global.arena_text.UpdateText(t);
		global.arena_text.MoveTo(25, 248);
	}
	
	if (confirm) {
		confirm = false;
		audio_play_sound(select, 1, false);
		global.battle_state = "friskattack";
		global.soul.MoveTo(-999, -999);
		global.arena_text.UpdateText(["[noadvance]"]);
		global.arena_text.MoveTo(-999, -999);
		global.attacker = instance_create_depth(320, 264, depth-6, focuser);
		global.attackfocusbar = instance_create_depth(618, 258, depth-7, focusbar);
		global.attackfocusbar.xvel = -7;
		attacked = false;
	}
}

if (global.battle_state == "friskattack") {
	if (global.attackfocusbar.x <= 26 and attacked == false) {
		attacked = true;
		global.attackfocusbar.xvel = 0;
		global.attackfocusbar.alphavel = -0.04;
		global.attackfocusbar.xscalevel = -0.04;
		global.dmganim = instance_create_depth(320, 50, depth-5, misstext);
		global.dmganim.alphavel = -0.04;
		global.dealtdamage = 0;
		global.battleclock = 120;
	}
	if (confirm and attacked == false) {
		attacked = true;
		audio_play_sound(slash, 1, false);
		global.attackfocusbar.xvel = 0;
		global.attackfocusbar.alphavel = -0.04;
		global.attackfocusbar.xscalevel = -0.04;
		global.attackfocusbar.image_speed = 1;
		global.sliceanim = instance_create_depth(320, 100, depth-6, attackobj);
		global.sliceanim.image_xscale = (562 - abs(global.attackfocusbar.x - 320))/562;
		global.sliceanim.image_yscale = (562 - abs(global.attackfocusbar.x - 320))/562;
		
		// damage calculation
		if (global.alwaysmiss == false) {
			if (abs(global.attackfocusbar.x - 320) <= 12) {
			    global.dealtdamage = round(((global.player_atk + global.player_atkbonus) - global.enemy_def + random(2)) * 2.2);
			} else {
			    global.dealtdamage = round(((global.player_atk + global.player_atkbonus) - global.enemy_def + random(2)) * ((562 - abs(global.attackfocusbar.x - 320))/562) * 2);
			}
			global.dmganim = instance_create_depth(320, 75, depth-5, damagenumbers);
			global.dmganim.text = string(global.dealtdamage);
			global.dmganim.yvel = -1.5;
			global.dmganim.alphavel = -0.02;
			audio_play_sound(hit, 1, false);
			
			global.enemy_hp -= global.dealtdamage;
			global.enemyhpbar = instance_create_depth(250, 75, depth-5, enemyhpbar);
			global.enemyhpbar.alphavel = -0.02;
			
			if (global.enemy_hp <= 0) {
				global.battle_state = "sparing"; // sparing lmfaos
				initDialog = true;
				global.soul.MoveTo(-999, -999);
				global.arena_text.MoveTo(25, 248);
				var d = instance_create_depth(global.sans_obj.x, global.sans_obj.y, global.sans_obj.depth, duster);
				d.dust_animation = global.testsansdustanimation; // hey CHANGE THIS
				d.sprite_index = testsanssprite;
				instance_destroy(global.sans_obj);
				global.arena_text.UpdateText(["* [noadvance]YOU WON!\n* Gained " + string(global.expreward) + " EXP and " + string(global.gldreward) + "G."]);
				global.player_gold += global.gldreward;
				global.player_exp += global.expreward;
				global.player_kills += 1;
				instance_destroy(global.attacker);
			}
		} else {
			global.dealtdamage = 0;
			global.sans_obj.startdodging = true;
			global.dmganim = instance_create_depth(320, 75, depth-5, misstext);
			global.dmganim.yvel = -3;
			global.dmganim.alphavel = -0.04;
		}
		global.attackcounter += 1;
		global.battleclock = 120;
	}
	if (global.battleclock != -1) { global.battleclock -= 1; if (global.dmganim.image_alpha == 0) { global.dmganim.color = c_white; }; };
	
	if (global.battleclock == 60) {
		global.attacker.alphavel = -0.04;
		global.attacker.xscalevel = -0.04;
	}
	
	if (global.battleclock == 0) {
		global.battle_state = "dialog";
		initDialog = true;
	}
}

if (global.battle_state == "actmenu") {
	if (cancel) {
		global.soul.LerpTo(194, 447);
		global.battle_state = "actionselect";
		var t = [];
		array_copy(t, 0, global.currenttext, 0, array_length(global.currenttext));
		global.arena_text.UpdateText(t);
		global.arena_text.MoveTo(25, 248);
	}
	
	if (confirm) {
		audio_play_sound(select, 1, false);
		confirm = false;
		global.battle_state = "viewingacts";
		switch (array_length(global.acts)) {
			case 0:
				show_error("you must have at least one ACT!", true);
			break;
			
			case 1:
				global.arena_text.UpdateText(["[instant]* [noadvance]" + global.acts[0]]);
			break;
			
			case 2:
				global.arena_text.UpdateText(["[instant]* [noadvance]" + global.acts[0] + "         * " + global.acts[1]]);
			break;
			
			case 3:
				global.arena_text.UpdateText(["[instant]* [noadvance]" + global.acts[0] + "         *[color:#000000]ㅤ[color:#FFFFFF]" + global.acts[1] + "\n* [noadvance]" + global.acts[2]]);
			break;
			
			case 4:
				// The following is such insanely bad practice that Dustdustdustfellinsanityinsanityinsanityinsanityinsanity!Sans couldn't match it.
				global.arena_text.UpdateText(["[instant]* [noadvance]" + global.acts[0] + "         *[color:#000000]ㅤ[color:#FFFFFF]" + global.acts[1] + "\n* [noadvance]" + global.acts[2] +  "         * " + global.acts[3]]);
			break;
			
			default:
				show_error("you can't have more than four ACTs!", true);
			break
		}
	}
}

if (global.battle_state == "viewingacts") {
	if (cancel) {
		global.soul.LerpTo(194, 447);
		global.battle_state = "actionselect";
		var t = [];
		array_copy(t, 0, global.currenttext, 0, array_length(global.currenttext));
		global.arena_text.UpdateText(t);
		global.arena_text.MoveTo(25, 248);
	}
	if (global.selected_submenu == 1 or global.selected_submenu == 3) {
		if ((left or right) and (array_length(global.acts) == 2 or array_length(global.acts) == 3 or array_length(global.acts) == 4)) {
			if (global.selected_submenu == 1) {
				global.selected_submenu = 3;
			} else if (global.selected_submenu == 3) {
				global.selected_submenu = 1;
			}
			updateSubmenu();
		}
		if ((up or down) and (array_length(global.acts) == 2 or array_length(global.acts) == 3 or array_length(global.acts) == 4)) {
			if (global.selected_submenu == 1 and array_length(global.acts) == 3 or array_length(global.acts) == 4) {
				global.selected_submenu = 2;
			} else if (global.selected_submenu == 3 and array_length(global.acts) == 4) {
				global.selected_submenu = 4;
			}
			updateSubmenu();
		}
	} else if (global.selected_submenu == 2 or global.selected_submenu == 4) {
		if ((left or right) and (array_length(global.acts) == 2 or array_length(global.acts) == 4)) {
			if (global.selected_submenu == 2) {
				global.selected_submenu = 4;
			} else if (global.selected_submenu == 4) {
				global.selected_submenu = 2;
			}
			updateSubmenu();
		}
		if ((up or down) and (array_length(global.acts) == 2 or array_length(global.acts) == 3 or array_length(global.acts) == 4)) {
			if (global.selected_submenu == 2) {
				global.selected_submenu = 1;
			} else if (global.selected_submenu == 4) {
				global.selected_submenu = 3;
			}
			updateSubmenu();
		}
	}
	
	if (confirm) {
		audio_play_sound(select, 1, false);
		switch (global.selected_submenu) {
			case 1:
				onact(global.acts[0]);
				cancel = false;
				confirm = false;
			break;
			
			case 2:
				onact(global.acts[2]);
			break;
			
			case 3:
				onact(global.acts[1]);
			break;
			
			case 4:
				onact(global.acts[3]);
			break;
		}
	}
}

if (global.battle_state == "sparing") {
	with (global.arena_text) {
		if (confirm and pauseforframes == 0 and current_line >= total_lines and text_char_index >= string_length(current_line_text)) {
			other.textdone = true;
		}
	}
	if (textdone) {
		textdone = false;
		var fade = instance_create_depth(0, 0, -9999, fader);
		fade.bounce = true;
		fade.fadeOverFrames = 20;
		fade.startingOpacity = 0;
		fade.targetOpacity = 1;
		fade.executeOnFirstBounce = function() {
			global.in_battle = false;
			global.can_move = true;
			global.can_menu = true;
			global.player_active = true;
			instance_destroy(global.soul);
			room_goto(global.prevroom);
		}
		fade.mode = "fadeOut";
	}
}

if (global.battle_state == "displayingtext") {
	with (global.arena_text) {
		if (confirm and pauseforframes == 0 and current_line >= total_lines and text_char_index >= string_length(current_line_text)) {
			other.textdone = true;
		}
	}
	if (textdone) {
		textdone = false;
		global.battle_state = "dialog";
		initDialog = true;
		global.soul.MoveTo(-999, -999);
		global.arena_text.UpdateText(["[noadvance]"]);
		global.arena_text.MoveTo(-999, -999);
	}
}

if (global.battle_state == "itemmenu") {
	if (cancel) {
		global.soul.LerpTo(354, 447);
		global.battle_state = "actionselect";
		var t = [];
		array_copy(t, 0, global.currenttext, 0, array_length(global.currenttext));
		global.arena_text.UpdateText(t);
		global.arena_text.MoveTo(25, 248);
	}
	
	if (up) {
		if (itemindex != 0) {
			itemindex -= 1;
			global.arena_text.UpdateText(getItemText());
		}
	}
	
	if (down) {
		if (itemindex != array_length(global.inventory)-1) {
			itemindex += 1;
			global.arena_text.UpdateText(getItemText());
		}
	}
	
	if (confirm) {
		onitem(global.inventory[itemindex]);
	}
}

if (global.battle_state == "mercymenu") {
	if (cancel) {
		global.soul.LerpTo(509, 447);
		global.battle_state = "actionselect";
		var t = [];
		array_copy(t, 0, global.currenttext, 0, array_length(global.currenttext));
		global.arena_text.UpdateText(t);
		global.arena_text.MoveTo(25, 248);
	}
	
	if (up or down) {
		if (global.selected_submenu == 1) {
			global.selected_submenu = 2;
		} else if (global.selected_submenu == 2) {
			global.selected_submenu = 1;
		}
		updateSubmenu();
	}
	
	if (confirm) { // by default, these events change the battle state
		audio_play_sound(squeak, 1, false);
		if (global.selected_submenu == 1) {
			onspare();
		} else if (global.selected_submenu == 2) {
			onflee();
		}
	}
}

if (global.battle_state == "dialog") {
	if (initDialog) {
		global.dialogbubble = instance_create_depth(378, 107, depth-5, dialogbubble);
		global.dialogbubble.preset = "sans";
		global.dialogbubble.text = ["[noadvance]yknow, i never\nwanted anything\nclose to this.[pauseforframes:120][advance]", "[noadvance]but hey.[pauseforframes:120][advance]", "[noadvance]at least it's a\nbeautiful day\noutside.[pauseforframes:120][advance]", "birds are \nsinging...[pauseforframes:30] flowers\nare blooming...[pauseforframes:120][advance]", "days like these...[pauseforframes:30]\ni knew they were\ntoo good to last.[pauseforframes:140][advance]"];
		global.dialogbubble.noskip = true;
		global.dialogbubble.spd = 1.5;
		initDialog = false;
	}
	
	if (keyboard_check_pressed(ord("C"))) {
		instance_destroy(global.dialogbubble.textbox);
		instance_destroy(global.dialogbubble);
		global.battle_state = "enemyattack";
		initEnemyAttack = true;
		audio_sound_set_track_position(audioid, 21.13);
		grad = instance_create_depth(320, 480, depth-2, gradient_obj);
	} else if (!instance_exists(global.dialogbubble)) {
		global.battle_state = "enemyattack";
		initEnemyAttack = true;
		grad = instance_create_depth(320, 480, depth-2, gradient_obj);
	}
}

if (global.battle_state == "enemyattack") {
	if (initEnemyAttack) {
		attackid = irandom(0);
		switch (attackid) { // initialize attacks here
			case 0:
				global.attacktimer = 0;
				global.arena.MoveTo(320, 400);
				global.arena.LerpTo(320, 321);
				global.arena.LerpToSize(140, 140);
				global.soul.MoveTo(312, 300);
				global.soul.TurnBlue("down");
				instance_create_depth(296, 340, depth-6, platform);
				var tmpx = 245;
				for (var i = 0; i < 15; i++) {
					tmpx += 10;
					createbone(tmpx, 367, sansbone50, "white", 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, depth-4);
				}
				screenshake(30, 2, 10);
			break;
		}
		initEnemyAttack = false;
	}
	
	global.attacktimer += 1;
	
	switch (attackid) { // this isn't the best way to handle attacks, but it works and its fairly simple
		case 0:
			if (keyboard_check_pressed(ord("C")) and heals != 0 and global.player_hp != global.player_maxhp) {
				global.player_hp = global.player_maxhp;
				global.KR = 0;
				audio_play_sound(heal, 1, false);
				heals -= 1;
				var h = instance_create_depth(10, 10, -999, heal_informer);
				h.text = $"{heals}/3 heals remaining";
				h.alphavel = -0.01;
			}
			
			if (global.attacktimer >= 0 and global.attacktimer < 360) {
				if (global.attacktimer % 30 == 0) {
					createGasterBlaster(320, -100, irandom_range(100, 540), irandom_range(80, 380), true, depth-10, 0, 0, 30, 0.5, 1);
				}
			}
			
			if (global.attacktimer == 360) {
				global.arena.LerpToSize(475, 140);
				global.soul.TurnRed();
				global.soul.LerpTo(global.soul.x, global.soul.y+20);
				with (boneattack) {instance_destroy();}
				with (gasterblaster) {instance_destroy();}
				with (gasterbeam) {instance_destroy();}
				with (platform) {instance_destroy();}
				var tmpx = -10;
				for (var i = 0; i < 75; i++) {
					tmpx += 10;
					createbone(tmpx, 367, sansbone50, "white", 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, depth-4);
				}
				tmpx = -10;
				for (var i = 0; i < 75; i++) {
					tmpx += 10;
					createbone(tmpx, 225, sansbone50, "white", 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, depth-4);
				}
				screenshake(30, 2, 10);
			}
			
			if (global.attacktimer > 360 and global.attacktimer < 720) {
				if (global.attacktimer % 60 == 0) {
					createGasterBlaster(320, -100, irandom_range(100, 540), irandom_range(80, 380), true, depth-10, 0, 0, 60, 1, 1);
				}
				if (global.attacktimer % 60 == 0) {
					createbone(global.arena.x-(global.arena.width/2)+5, global.arena.y-(global.arena.height/2)+5, sansbone130, "blue", 0, 1, 1, 1, 5, 0, 0, 0, 0, 0, depth-4);
					createbone(global.arena.x+(global.arena.width/2)-5, global.arena.y-(global.arena.height/2)+5, sansbone130, "orange", 0, 1, 1, 1, -5, 0, 0, 0, 0, 0, depth-4);
				}
			}
			
			if (global.attacktimer == 720) {
				global.arena.LerpToSize(140, 140);
				global.soul.MoveTo(320, 321);
				with (boneattack) {instance_destroy();}
				with (gasterblaster) {instance_destroy();}
				with (gasterbeam) {instance_destroy();}
				with (platform) {instance_destroy();}
				sintimer = 0;
				screenshake(30, 2, 10);
			}
			
			if (global.attacktimer > 720 and global.attacktimer < 1080) {
				global.arena.image_angle += 2;
				global.arena.lerpangle += 2;
				sintimer += 1;
				if (global.attacktimer % 60 == 0) {
					createbone(50, global.arena.y-(global.arena.height/2)+5, sansbone600, "orange", 90, 1, 1, 1, 0, 5, 0, 0, 0, 0, depth-4);
				}
				if (global.attacktimer % 7 == 0) {
					// alright so quick intervention
					// i had to disable "remove unused assets when compiling" as it would not include most of the bone assets.
					// i was very confused by this for a good hour
					// but according to [this](https://github.com/YoYoGames/GameMaker-Bugs/issues/9011) you have to do that
					// it's not a good solution but i am NOT typing out 640 sprites in obj_time
					// i could generate them with a script?
					// i should...actually probably do that but like later
					
					createbone(global.arena.x-(global.arena.lerpwidth/2)-20, global.arena.y-(global.arena.lerpheight/2)-5, asset_get_index($"sansbone{round(75 + (sin(sintimer)*20))}"), "white", 90, 1, 1, 1, 0, 3, 0, 0, 0, 0, depth-4);
					createbone(global.arena.x+(global.arena.lerpwidth/2)-45+round((sin(sintimer)*20)), global.arena.y-(global.arena.lerpheight/2)-5, sansbone200, "white", 90, 1, 1, 1, 0, 3, 0, 0, 0, 0, depth-4);
				}
			}
			
			if (global.attacktimer == 1080) {
				global.arena.LerpTo(480, 100);
				global.soul.MoveTo(global.arena.x, global.arena.y);
				global.arena.lerpangle = 0;
				global.arena.image_angle = 0;
				with (boneattack) {instance_destroy();}
				with (gasterblaster) {instance_destroy();}
				with (gasterbeam) {instance_destroy();}
				with (platform) {instance_destroy();}
				sintimer = 0;
				screenshake(30, 2, 10);
			}
			
			if (global.attacktimer > 1080 and global.attacktimer < 1100) {
				global.soul.MoveTo(global.arena.x, global.arena.y);
			}
			
			if (global.attacktimer == 1100) {
				global.screen.LerpToAngle(180);
			}
			
			if (global.attacktimer >= 1100 and global.attacktimer < 1560) {
				if (global.arena.y <= 321) {
					global.arena.MoveTo(global.arena.x, global.arena.y + 0.5);
				}
				
				if (global.attacktimer % 50 == 0) {
					createbone(global.arena.x-(global.arena.width/2), global.arena.y-(global.arena.height/2)-5, sansbone70, "white", 90, 1, 1, 1, 0, 2, 0, 0, 0, 0, depth-4);
					createbone(global.arena.x, global.arena.y+(global.arena.height/2)+5, sansbone70, "white", 90, 1, 1, 1, 0, -2, 0, 0, 0, 0, depth-4);
				}
			}
			
			if (global.attacktimer == 1560) {
				with (boneattack) {instance_destroy();}
				with (gasterblaster) {instance_destroy();}
				with (gasterbeam) {instance_destroy();}
				with (platform) {instance_destroy();}
				screenshake(30, 2, 10);
				global.soul.TurnBlue("down");
				global.arena.MoveTo(global.arena.x, 321);
				global.screen.LerpToAngle(0);
			}
			
			if (global.attacktimer > 1560 and global.attacktimer < 1920) {
				if (global.arena.x >= 320) {
					global.arena.MoveTo(global.arena.x - 0.5, global.arena.y);
				}
				
				if (global.attacktimer % 60 == 0) {
					createGasterBlaster(320, -100, irandom_range(100, 540), irandom_range(80, 380), true, depth-10, 0, 0, 60, 1, 1);
				}
			}
			
			if (global.attacktimer == 1920) {
				with (boneattack) {instance_destroy();}
				//with (gasterblaster) {instance_destroy();}
				//with (gasterbeam) {instance_destroy();}
				with (platform) {instance_destroy();}
				screenshake(30, 2, 10);
				global.arena.MoveTo(320, global.arena.y);
				createbone(global.arena.x, global.arena.y, sansbone140, "white", 0, 1, 1, 1, 0, 0, 2, 0, 0, 0, depth-4, true);
				createbone(global.arena.x, global.arena.y, sansbone140, "white", 90, 1, 1, 1, 0, 0, 2, 0, 0, 0, depth-4, true);
				global.soul.TurnRed();
			}
			
			if (global.attacktimer > 1920 and global.attacktimer < 2300) {
				if (global.attacktimer % 60 == 0) {
					createGasterBlaster(320, -100, irandom_range(100, 540), irandom_range(80, 380), true, depth-10, 0, 0, 60, 1, 1);
				}
			}
			
			if (global.attacktimer == 2300) {
				with (boneattack) {instance_destroy();}
				with (gasterblaster) {instance_destroy();}
				with (gasterbeam) {instance_destroy();}
				with (platform) {instance_destroy();}
				screenshake(30, 2, 10);
				global.soul.TurnBlue("up");
			}
			
			if (global.attacktimer > 2300 and global.attacktimer < 3020) {
				global.screen.SetAngle(global.screen.lerpangle + 1);
				if (global.attacktimer % 180 == 0) {
					if (instance_find(invertColors, 0) != noone) { stopColorInversion(); }
					else { startColorInversion(); };
				}
				if (global.attacktimer % 30 == 0) {
					createbone(global.arena.x-(global.arena.width/2)-20, global.arena.y-(global.arena.height/2)+5, sansbone20, "white", 0, 1, 1, 1, 4, 0, 0, 0, 0, 0, depth-4, false);
					createbone(global.arena.x-(global.arena.width/2)-20, global.arena.y-(global.arena.height/2)+50, sansbone85, "white", 0, 1, 1, 1, 4, 0, 0, 0, 0, 0, depth-4, false);
					createbone(global.arena.x+(global.arena.width/2)+20, global.arena.y-(global.arena.height/2)+5, sansbone20, "white", 0, 1, 1, 1, -4, 0, 0, 0, 0, 0, depth-4, false);
					createbone(global.arena.x+(global.arena.width/2)+20, global.arena.y-(global.arena.height/2)+50, sansbone85, "white", 0, 1, 1, 1, -4, 0, 0, 0, 0, 0, depth-4, false);
				}
			}
			
			if (global.attacktimer == 3020) {
				with (boneattack) {instance_destroy();}
				with (gasterblaster) {instance_destroy();}
				with (gasterbeam) {instance_destroy();}
				with (platform) {instance_destroy();}
				stopColorInversion();
				global.screen.LerpToAngle(0);
				screenshake(30, 2, 10);
				global.soul.TurnRed();
			}
			
			if (global.attacktimer > 3020 and global.attacktimer < 3380) {
				if (global.attacktimer % 30 == 0) {
					createbone(global.arena.x-(global.arena.width/2), global.arena.y-(global.arena.width/2)+5, sansbone35, "white", 0, 1, 1, 1, 2, 0, 0, 0, 0, 0, depth-4, false);
					createbone(global.arena.x+(global.arena.width/2), global.arena.y-(global.arena.width/2)+40, sansbone35, "white", 0, 1, 1, 1, -2, 0, 0, 0, 0, 0, depth-4, false);
					createbone(global.arena.x-(global.arena.width/2), global.arena.y-(global.arena.width/2)+75, sansbone35, "white", 0, 1, 1, 1, 2, 0, 0, 0, 0, 0, depth-4, false);
					createbone(global.arena.x+(global.arena.width/2), global.arena.y-(global.arena.width/2)+110, sansbone35, "white", 0, 1, 1, 1, -2, 0, 0, 0, 0, 0, depth-4, false);
				}
			}
			
			if (global.attacktimer == 3380) {
				with (boneattack) {instance_destroy();}
				with (gasterblaster) {instance_destroy();}
				with (gasterbeam) {instance_destroy();}
				with (platform) {instance_destroy();}
				screenshake(60, 3, 10);
				global.arena.LerpToSize(650, 140);
				global.sans_obj.LerpTo(-200, global.sans_obj.y);
				global.fight_button.LerpTo(-200, global.fight_button.y);
				global.act_button.LerpTo(-200, global.act_button.y);
				global.item_button.LerpTo(-200, global.item_button.y);
				global.mercy_button.LerpTo(-200, global.mercy_button.y);
				global.soul.sprite_index = bluesoul;
				global.soul.image_index = 3;
				sintimer = 0;
				
			}
			
			if (global.attacktimer > 3380 and global.attacktimer < 4100) {
				sintimer += 1;
				global.screen.SetAngle(sin(sintimer/50) * 5);
				
				if (global.attacktimer % 7 == 0) {
					createbone(global.arena.x+(global.arena.lerpwidth/2)+5, global.arena.y-(global.arena.lerpheight/2)-20, asset_get_index($"sansbone{round(75 + (sin(sintimer)*20))}"), "white", 0, 1, 1, 1, -3, 0, 0, 0, 0, 0, depth-4);
					createbone(global.arena.x+(global.arena.lerpwidth/2)+5, global.arena.y+(global.arena.lerpheight/2)-45+round((sin(sintimer)*20)), sansbone200, "white", 0, 1, 1, 1, -3, 0, 0, 0, 0, 0, depth-4);
				}
			}
			
			if (global.attacktimer > 4100 and global.attacktimer < 4460) {
				sintimer += 1;
				global.screen.SetAngle(sin(sintimer/50) * 5);
				if (global.attacktimer % 30 == 0) {
					for (var i = 0; i < 7; i++) {
						var type = choose("white", "white", "white", "blue", "orange");
						var bone = createbone(global.soul.x, 200, sansbone20, type, 0, 1, 1, 1, 0, 0, 5, 0, 0, 0, depth-5, true);
						bone.direction = irandom(360);
						bone.speed = 1;
						bone.gravity = 0.03;
						bone.gravity_direction = 270;
					}
				}
			}
			
			if (global.attacktimer == 4460) {
				with (boneattack) {instance_destroy();}
				with (gasterblaster) {instance_destroy();}
				with (gasterbeam) {instance_destroy();}
				with (platform) {instance_destroy();}
				screenshake(30, 2, 10);
				global.arena.LerpTo(320, 320);
				global.soul.sprite_index = centeredredsoul;
				global.soul.MoveTo(320, 320);
				global.arena.LerpToSize(26, 26);
				global.sans_obj.LerpTo(272, global.sans_obj.y);
				global.fight_button.LerpTo(33, global.fight_button.y);
				global.act_button.LerpTo(186, global.act_button.y);
				global.item_button.LerpTo(346, global.item_button.y);
				global.mercy_button.LerpTo(501, global.mercy_button.y);
				global.screen.SetAngle(0);
				instance_destroy(grad);
				sintimer = 0;
			}
			
			if (global.attacktimer == 4500) {
				audio_play_sound(slash, 1, false);
				global.sliceanim = instance_create_depth(320, 100, depth-6, attackobj);
			}
			
			if (global.attacktimer == 4600) {
				audio_play_sound(hit, 1, false);
				screenshake(30, 2, 10);
				//global.sans_obj.sansbodysprite = sanstorsodamage;
			}
			
			if (global.attacktimer == 4660) {
				audio_play_sound(silence, 1, false);
				var d = instance_create_depth(global.sans_obj.x, global.sans_obj.y, global.sans_obj.depth, duster);
				d.dust_animation = global.testsansdustanimation; // hey CHANGE THIS
				d.sprite_index = testsanssprite;
				instance_destroy(global.sans_obj);
				audio_play_sound(love, 1, false);
				global.player_lv = 20;
				player_recalc_stats();
				global.kr_obj.x = global.hpbar.x+global.player_maxhp*1.2+10;
				global.hp_text.x = global.hpbar.x+global.player_maxhp*1.2+50;
			}
			
			if (global.attacktimer == 5100) {
				game_end();
			}
			
		break;
	}
	
	if (global.attacktimer <= 0) {
		if (attackid != 2) { // example attack id you wouldn't want to clear it on
			global.arena.LerpToAngle(0);
			global.screen.LerpToAngle(0);
			with (boneattack) {instance_destroy();}
			with (gasterblaster) {instance_destroy();}
			with (gasterbeam) {instance_destroy();}
			with (platform) {instance_destroy();}
			stopColorInversion();
		}
		
		global.arena.LerpToSize(575, 140);
		global.arena.LerpTo(320, 321);
		global.arena.lerp_speed = 0.6;
		global.soul.MoveTo(-999, -999);
		updateSoulLocation = true;
		if (global.arena.width == 575 and global.arena.height == 140) {
			global.battle_state = "actionselect"; // wait for arena to finish resizing
			var t = [];
			var randomdialog = global.flavortexts[irandom(array_length(global.flavortexts)-1)];
			array_copy(t, 0, randomdialog, 0, array_length(randomdialog));
			array_copy(global.currenttext, 0, randomdialog, 0, array_length(randomdialog));
			global.arena_text.UpdateText(t);
			global.arena_text.MoveTo(25, 248);
			global.arena.lerp_speed = 0.3;
		}
	}
}

if (global.battle_state == "customstart") {
	clock -= 1;
	
	if (clock == 0) {
		global.battle_state = "dialog";
		initDialog = true;
	}
}