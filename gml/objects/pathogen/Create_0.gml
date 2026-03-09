// note: every piece of ui here is drawn using objects. why? it's a lot easier, in two ways:
// for one, you can rotate it, apply physics to it, change the depth, delete it, move it, scale it, etc.
// with one variable change. now that's a lot easier than drawing them all in one object. which is...
// not efficient or easy, to say the least.
// for another, it's a lot easier for me to code. so. that's why. if you were wondering.

// note: to set these variables, set them AFTER the instance is created. or clone this object
// and set the values to what you want them to be.
// (...the latter is probably better for bosses, and the former is better for simple fights)

global.player_lv = 10;
player_recalc_stats();
global.player_hp = 56;

global.enemy_name = "Monster";
global.enemy_hp = 50;
global.enemy_maxhp = 50;
global.enemy_def = 3;
global.enemy_atk = 3;
global.player_active = false;
global.enemy_checkmsg = ["* MONSTER 15 ATK 15 DEF[pauseforframes:30]\n* No data available."];
global.in_battle = true;

//instance_create_depth(0, 0, 0, makearectangle);

global.fight_button = instance_create_depth(33, 433, depth-5, button);
global.fight_button.button_type = "fight"; // we don't actually have to do this as its the default.
                                           // but i'm doing it anyway!!!
global.act_button = instance_create_depth(186, 433, depth-5, button);
global.act_button.button_type = "act";
global.item_button = instance_create_depth(346, 433, depth-5, button);
global.item_button.button_type = "item";
global.mercy_button = instance_create_depth(501, 433, depth-5, button);
global.mercy_button.button_type = "mercy";

// you can control the following instances using `global.object.property_you_want_to_change = value;`.
global.soul = instance_create_depth(-999, -999, depth-8, soul);
global.nametext = instance_create_depth(31, 401, depth-5, name);
global.lovetext = instance_create_depth(133, 401, depth-5, lovevalue);
global.hp_obj = instance_create_depth(225, 406, depth-5, hp);
global.hpbar = instance_create_depth(256, 401, depth-5, hpbar);
global.kr_enabled = true;//false;
setup_kr = global.kr_enabled;
// NOTE: THE LOCATION OF THIS IS ONLY UPDATED ONCE!!!
global.hp_text = instance_create_depth(global.hpbar.x+global.player_maxhp*1.2+14, 401, depth-5, hptext);
global.arena = instance_create_depth(33, 251, depth-5, arena);

// for testing purposes only
global.sans_obj = instance_create_depth(272, 100, depth-5, break_sans);

global.flavortexts = [["* [noadvance]..."]];
global.encountertext = ["* [noadvance]Now you've done it."];
global.arena_text = instance_create_depth(25, 251, depth-6, flavorer_not_top);
global.arena_text.textbox_x = 25;
global.arena_text.textbox_y = 251;
global.arena_text.draw_box = false;
array_copy(global.arena_text.text, 0, global.encountertext, 0, array_length(global.encountertext));
global.currenttext = global.encountertext;
global.arena_text.text_voicebeep = voicebp_battle;
global.lerpSubmenus = true;
global.selected = 1;
prevselected = 1;
global.selected_submenu = 1;
global.battle_state = "actionselect";
global.acts = ["Check", "Talk"];
global.randomdialog = [["[color:#000000]..."]];
global.attacker = noone;
global.attackfocusbar = noone;
global.sliceanim = noone;
global.missanim = noone;
global.dealtdamage = 0;
global.alwaysmiss = true;
global.battleclock = -1;
global.attackcounter = 0;
global.dialogbubble = noone;
global.attacktimer = 240;

updateSoulLocation = true;

attacked = true;
initDialog = false;
initEnemyAttack = false;
attackid = 0;
global.wasd_enabled = true;

onspare = function() {
	global.battle_state = "dialog";
	initDialog = true;
	global.soul.MoveTo(-999, -999);
	global.arena_text.UpdateText([""]);
}

onflee = function() {
	global.battle_state = "dialog";
	initDialog = true;
	global.soul.MoveTo(-999, -999);
	global.arena_text.UpdateText([""]);
}

updateSubmenu = function() {
	switch (global.selected_submenu) {
		case 1:
			if (global.lerpSubmenus == true) {
				global.soul.LerpTo(65, 279);
			} else {
				global.soul.MoveTo(65, 279);
			}
		break;
		case 2:
			if (global.lerpSubmenus == true) {
				global.soul.LerpTo(65, 311);
			} else {
				global.soul.MoveTo(65, 311);
			}
		break;
		case 3:
			if (global.lerpSubmenus == true) {
				global.soul.LerpTo(325, 279);
			} else {
				global.soul.MoveTo(325, 279);
			}
		break;
		case 4:
			if (global.lerpSubmenus == true) {
				global.soul.LerpTo(325, 311);
			} else {
				global.soul.MoveTo(325, 311);
			}
		break;
		default: 
			show_error("updateSubmenu detected an invalid submenu value", true);
		break;
	}
}
