// note: every piece of ui here is drawn using objects. why? it's a lot easier, in two ways:
// for one, you can rotate it, apply physics to it, change the depth, delete it, move it, scale it, etc.
// with one variable change. now that's a lot easier than drawing them all in one object. which is...
// not efficient or easy, to say the least.
// for another, it's a lot easier for me to code. so. that's why. if you were wondering.

// note: to set these variables, set them AFTER the instance is created. or clone this object
// and set the values to what you want them to be.
// (...the latter is probably better for bosses, and the former is better for simple fights)

// quick note: if you want something to be behind the arena, well. forget about it. it's impossible.
// why? it's a long, long story. you could try looking in arena_mask for more context.

//global.player_lv = 10;
//player_recalc_stats();
//global.player_hp = 56;

global.enemy_name = "sans.";
global.enemy_hp = 50;
global.enemyhpbar = noone;
global.enemy_maxhp = 50;
global.enemy_def = 3;
global.enemy_atk = 3;
global.player_active = false;
global.enemy_checkmsg = ["* [noadvance]sans.[pauseforframes:30]\n* ..."];
global.in_battle = true;

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
global.arena = instance_create_depth(320, 700, depth-2, arena);
global.bonemasker = instance_create_depth(0, 0, depth-3, bonemaskupdater);

// for testing purposes only
global.sans_obj = instance_create_depth(265, 75, depth-5, sp_dust_sans);
//global.inventory = ["Pie", "Noodles", "Steak", "S. Piece", "S. Piece", "S. Piece", "L. Hero", "L. Hero"];
global.inventory = ["Pie"];

global.canspare = true;//false;

global.expreward = 40;
global.gldreward = irandom_range(10, 30);
global.flavortexts = [["[noadvance]"]];
global.encountertext = ["[noadvance]"];
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
global.battle_state = "customstart";
global.acts = ["Check", "Spare"]; // You can have up to four ACTs, just add them here and add a case to the onact function
global.randomdialog = [["[color:#000000]..."]];
global.attacker = noone;
global.attackfocusbar = noone;
global.sliceanim = noone;
global.dmganim = noone;
global.dealtdamage = 0;
global.alwaysmiss = false;
global.battleclock = -1;
global.attackcounter = 0;
global.dialogbubble = noone;
global.attacktimer = 240;
global.battlebgm = megalobroken;
playbgm = true;

updateSoulLocation = true;

textdone = false;

attacked = true;
initDialog = false;
initEnemyAttack = false;
attackid = 0;

itemindex = 0;

global.wasd_enabled = true;

fleechance = 50;

clock = 180;
audioid = noone;
necropbg = noone;

heals = 999;

if (!variable_global_exists("prevroom")) {
	show_error("\n\nglobal.prevroom was NOT set before entering the battle!\nIf you don't need this functionality, disable it in testencounter.\n\n", true);
}

onspare = function() {
	if (global.canspare) {
		global.battle_state = "sparing";
		initDialog = true;
		global.soul.MoveTo(-999, -999);
		global.arena_text.MoveTo(25, 248);
		// CHANGE THIS
		global.sans_obj.spare = true;
		global.arena_text.UpdateText(["* [noadvance]YOU WON!\n* Gained 0 EXP and " + string(global.gldreward) + "G."]);
		global.player_gold += global.gldreward;
	} else {
		global.battle_state = "dialog";
		initDialog = true;
		global.soul.MoveTo(-999, -999);
		global.arena_text.UpdateText(["[noadvance]"]);
		global.arena_text.MoveTo(-999, -999);
	}
}

onflee = function() {
	if (global.armor == "Bandage" or irandom(100) < fleechance) {
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
			room_goto(global.prevroom);
		}
		fade.mode = "fadeOut";
		global.arena_text.MoveTo(25, 248);
		global.arena_text.UpdateText(["* [noadvance]Escaped..."]);
		instance_destroy(global.soul);
		global.battle_state = "none";
	} else {
		fleechance += 10;
		global.battle_state = "dialog";
		initDialog = true;
		global.soul.MoveTo(-999, -999);
		global.arena_text.UpdateText(["[noadvance]"]);
		global.arena_text.MoveTo(-999, -999);
	}
}

onact = function(actname) {
	switch (actname) {
		case "Check":
			global.soul.MoveTo(-999, -999);
			global.arena_text.MoveTo(25, 248);
			var t = [];
			array_copy(t, 0, global.enemy_checkmsg, 0, array_length(global.enemy_checkmsg));
			global.arena_text.UpdateText(t);
			global.battle_state = "displayingtext";
		break;
		
		case "Spare":
			global.canspare = true;
			global.soul.MoveTo(-999, -999);
			global.arena_text.MoveTo(25, 248);
			global.arena_text.UpdateText(["* You're filled with[pauseforframes:30]\nDEBUG."]);
			global.battle_state = "displayingtext";
		break;
	}
}

onitem = function(itemname) {
	switch (itemname) {
		case "Pie":
			audio_play_sound(heal, 1, false);
			global.soul.MoveTo(-999, -999);
			global.arena_text.MoveTo(25, 248);
			array_delete(global.inventory, itemindex, 1);
			if (global.hpbar.applyheal(global.player_maxhp)) {
				global.arena_text.UpdateText(["* You ate the Butterscotch Pie.[pauseforframes:20]\n* Your HP was maxed out!"]);
			} else {
				global.arena_text.UpdateText(["* You ate the Butterscotch Pie.[pauseforframes:20]\n* Somehow, your HP wasn't\nmaxed out...?"]);
			}
			global.battle_state = "displayingtext";
		break;
		
		case "Noodles":
			audio_play_sound(heal, 1, false);
			global.soul.MoveTo(-999, -999);
			global.arena_text.MoveTo(25, 248);
			array_delete(global.inventory, itemindex, 1);
			if (global.hpbar.applyheal(90)) {
				global.arena_text.UpdateText(["* You ate the Instant Noodles.[pauseforframes:20]\n* Your HP was maxed out!"]);
			} else {
				global.arena_text.UpdateText(["* You ate the Instant Noodles.[pauseforframes:20]\n* You recovered 90 HP!"]);
			}
			global.battle_state = "displayingtext";
		break;
		
		case "Steak":
			audio_play_sound(heal, 1, false);
			global.soul.MoveTo(-999, -999);
			global.arena_text.MoveTo(25, 248);
			array_delete(global.inventory, itemindex, 1);
			if (global.hpbar.applyheal(60)) {
				global.arena_text.UpdateText(["* You ate the Face Steak.[pauseforframes:20]\n* Your HP was maxed out!"]);
			} else {
				global.arena_text.UpdateText(["* You ate the Face Steak.[pauseforframes:20]\n* You recovered 60 HP!"]);
			}
			global.battle_state = "displayingtext";
		break;
		
		case "S. Piece":
			audio_play_sound(heal, 1, false);
			global.soul.MoveTo(-999, -999);
			global.arena_text.MoveTo(25, 248);
			array_delete(global.inventory, itemindex, 1);
			if (global.hpbar.applyheal(45)) {
				global.arena_text.UpdateText(["* You ate the Snowman Piece.[pauseforframes:20]\n* Your HP was maxed out!"]);
			} else {
				global.arena_text.UpdateText(["* You ate the Snowman Piece.[pauseforframes:20]\n* You recovered 45 HP!"]);
			}
			global.battle_state = "displayingtext";
		break;
		
		case "L. Hero":
			audio_play_sound(heal, 1, false);
			global.soul.MoveTo(-999, -999);
			global.arena_text.MoveTo(25, 248);
			array_delete(global.inventory, itemindex, 1);
			global.player_atkbonus += 4;
			if (global.hpbar.applyheal(40)) {
				global.arena_text.UpdateText(["* You ate the Legendary Hero.[pauseforframes:20]\n* Your HP was maxed out!"]);
			} else {
				global.arena_text.UpdateText(["* You ate the Legendary Hero.[pauseforframes:20]\n* You recovered 40 HP!"]);
			}
			global.battle_state = "displayingtext";
		break;
	}
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

getItemText = function() {
	itemamount = array_length(global.inventory)-1;
	if (itemindex + 2 <= itemamount) {
		return ["[instant]* [noadvance]" + global.inventory[itemindex] + "\n* " + global.inventory[itemindex+1] + "\n* [noadvance]" + global.inventory[itemindex+2]];
	} else if (itemindex + 1 <= itemamount) {
		return ["[instant]* [noadvance]" + global.inventory[itemindex] + "\n* [noadvance]" + global.inventory[itemindex+1]];
	} else if (itemindex <= itemamount) {
		return ["[instant]* [noadvance]" + global.inventory[itemindex]];
	} else {
		show_error("getItemText failed as there are no items", true);
	}
}