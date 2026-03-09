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

if (setup_kr) {
	// NOTE: THE LOCATION OF THIS IS ONLY UPDATED ONCE!!!
	global.kr_obj = instance_create_depth(global.hpbar.x+global.player_maxhp*1.2+10, 406, depth-5, kr);
	global.hp_text.x = global.hpbar.x+global.player_maxhp*1.2+50;
	setup_kr = false;
}

//if (keyboard_check(ord("Q"))) {
//	if (global.kr_enabled == true) {
//		global.hpbar.applykr(1);
//	} else {
//		global.hpbar.applydamage(1);
//	}
//	audio_stop_sound(playerhit);
//	audio_play_sound(playerhit, 1, 0);
//}
if (keyboard_check_pressed(ord("Q"))) {
	createGasterBlaster(irandom(640), irandom(480), irandom(640), irandom(480), true, depth-10, 0, 0);
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
			global.arena_text.UpdateText(["[instant]* [noadvance]" + global.enemy_name]);
			global.arena_text.MoveTo(73, 248);
		} else if (global.selected == 2) {
			global.battle_state = "actmenu";
			global.soul.LerpTo(65, 279);
			global.arena_text.UpdateText(["[instant]* [noadvance]" + global.enemy_name]);
			global.arena_text.MoveTo(73, 248);
		} else if (global.selected == 3) {
			global.battle_state = "itemmenu";
			global.soul.LerpTo(65, 279);
			//global.arena_text.UpdateText(["[instant]* [noadvance]Spare\n* [noadvance]Flee"]);
			//global.arena_text.MoveTo(73, 248);
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
		global.missanim = instance_create_depth(320, 50, depth-5, misstext);
		global.missanim.alphavel = -0.04;
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
			    global.dealtdamage = round((global.player_atk - global.enemy_def + random(2)) * 2.2);
			} else {
			    global.dealtdamage = round((global.player_atk - global.enemy_def + random(2)) * ((562 - abs(global.attackfocusbar.x - 320))/562) * 2);
			}
		} else {
			global.dealtdamage = 0;
			global.sans_obj.startdodging = true;
			global.missanim = instance_create_depth(320, 75, depth-5, misstext);
			global.missanim.yvel = -3;
			global.missanim.alphavel = -0.04;
		}
		global.attackcounter += 1;
		show_debug_message("calculated " + string(global.dealtdamage) + " damage");
		global.battleclock = 120;
	}
	if (global.battleclock != -1) { global.battleclock -= 1; if (global.missanim.image_alpha == 0) { global.missanim.color = c_white; }; };
	
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
		var t = [];
		var randomdialog = global.randomdialog[irandom(array_length(global.randomdialog)-1)];
		array_copy(t, 0, randomdialog, 0, array_length(randomdialog));
		global.dialogbubble.text = t;
		initDialog = false;
	}
	
	if (!instance_exists(global.dialogbubble)) {
		global.battle_state = "enemyattack";
		initEnemyAttack = true;
	}
}

if (global.battle_state == "enemyattack") {
	if (initEnemyAttack) {
		attackid = irandom(0);
		switch (attackid) { // initialize attacks here
			case 0:
				global.attacktimer = 240;
				global.arena.LerpTo(131, 251);
				global.arena.LerpToSize(375, 140);
				global.soul.MoveTo(312, 300);
				global.soul.TurnBlue("down");
			break;
		}
		initEnemyAttack = false;
	}
	
	global.attacktimer -= 1;
	
	switch (attackid) { // this isn't the best way to handle attacks, but it works and its fairly simple
		case 0:
			if (global.attacktimer == 200) {
				createGasterBlaster(500, 0, 300, 200, true, depth-10, 0, 0);
			}
		break;
	}
	
	if (global.attacktimer <= 0) {
		global.arena.LerpToSize(575, 140);
		global.arena.LerpTo(33, 251);
		updateSoulLocation = true;
		if (global.arena.width == 575 and global.arena.height == 140) {
			global.battle_state = "actionselect"; // wait for arena to finish resizing
			var t = [];
			var randomdialog = global.flavortexts[irandom(array_length(global.flavortexts)-1)];
			array_copy(t, 0, randomdialog, 0, array_length(randomdialog));
			global.arena_text.UpdateText(t);
			global.arena_text.MoveTo(25, 248);
		}
	}
}