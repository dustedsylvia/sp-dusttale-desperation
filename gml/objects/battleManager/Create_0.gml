game_set_speed(60, gamespeed_fps);
display_reset(display_aa, false); // stops screen tearing (sometimes)
audio_play_sound(Megalovania, 9999, true);
randomize();

clock = 0;

fightbt_spr = fightbtn;
fbt_x = 33;
fbt_y = 433;

fight_on = false;
attackingInit = false;
fight_1 = NaN;

act_on = false;
act_check = NaN;
can_check = true;
check_on = false;
total_acts = 4; // MAKE SURE TO UPDATE THIS!
act2_text_index = -9999;
act3_text_index = -9999;
act4_text_index = -9999;
act2_on = false;
act3_on = false;
act4_on = false;

items = ["Pie", "I.Noodles", "Steak", "SnowPiece", "SnowPiece", "SnowPiece", "L. Hero", "L. Hero"];
item_on = false;
page = 1;
item_1_label = NaN;
item_2_label = NaN;
item_3_label = NaN;
item_4_label = NaN;
page_label = NaN;
csi_text_index = NaN;
csi_on = false;

hit_snd = hit;

mercy_on = false;
spare_label = NaN;

actbt_spr = actbtn;
abt_x = 186;
abt_y = 433;

itembt_spr = itembtn;
ibt_x = 346;
ibt_y = 433;

mercybt_spr = mercybtn;
mbt_x = 501;
mbt_y = 433;

textMgr = instance_create_depth(-100, -100, -9998, textManager);

soulInst = instance_create_depth(-100, -100, -9999, redsoul);

sel_btn = 1; // FIGHT
sel_btnb = 1;

sel_sub = 1;
sel_subb = 1;

state = "buttonselect"; // You can change these if you want to do a fight intro
stateprev = "buttonselect";

mdialog = [];

player_name = "Chara";
player_lv = 19;

enemy_name = "Classic!Sans";
check_msg = "SANS 1 ATK 1 DEF\nThe easiest enemy.\nCan only deal 1 damage.";
enemy_hp = 1;
enemy_maxhp = 1;
enemy_atk = 1;
enemy_def = 1;

kr_enabled = true;

weapon_atk = 99; // Real Knife
armor_def = 99;  // The Locket

global.player_maxhp = 16 + (4 * player_lv);
global.player_hp = 92;
player_atk = (-2 + (2 * player_lv))// + weapon_atk;
player_def = ((player_lv - 1) / 4) + armor_def;

name_x = 31;
name_y = 401;

lv_x = 133;
lv_y = 401;

hp_x = 225;
hp_y = 406;

hpbar_x = hp_x + 31;
hpbar_y = 401;
hpbar_w = global.player_hp * 1.2;
hpbar_h = 21;

krbar_x = hp_x + 31;
krbar_y = 401;
krbar_w = global.player_hp * 1.2 + 1;
krbar_h = 21;

maxhpbar_x = hp_x + 31;
maxhpbar_y = 401;
maxhpbar_w = global.player_maxhp * 1.2;
maxhpbar_h = 21;

kr_x = maxhpbar_x + maxhpbar_w + 10;
kr_y = 406;

hpt_x = maxhpbar_x + maxhpbar_w + 50;
hpt_y = 401;

st_x = maxhpbar_x + maxhpbar_w + 89;
st_y = 401;

mhpt_x = maxhpbar_x + maxhpbar_w + 113;
mhpt_y = 401;

bottom_wall_x = 33;
bottom_wall_y = 386;

top_wall_x = 33;
top_wall_y = 251;

left_wall_x = 33;
left_wall_y = 251;

right_wall_x = 603;
right_wall_y = 251;

arenaInst = instance_create_depth(33, 251, -9999, arena);
alwaysResetArena = true;

attacktimer = 4;

_needsSetup = true;
needsSetup = true;

has_flavor_text = false;
flavor_text_index = NaN;

fromSide = NaN;

slicer_x = 608;
slicer_y = 256;

sspeed = 10;
atk_slicer_f = 0;
slicer_f = 0;
slicing = false;

timer_1 = 0;
timer_1_c = false;

distance_from_center = 1000;
damage = 0;

sliced = false;

phase = 1;
turn = 0;

head_x = 320;
head_y = top_wall_y - 129;

head_xstart = 320;
head_ystart = top_wall_y - 129;

body_x = 320;
body_y = top_wall_y - 78;

body_xstart = 320;
body_ystart = top_wall_y - 78;

legs_x = 323;
legs_y = top_wall_y - 40;

dialog_bubble = bubble_right_wide;
dialog_bubble_x = 378;
dialog_bubble_y = 107;

t = 0;
dt = pi/(room_speed);
xrad = 1;
yrad = 1;

xrad1 = 1;
yrad1 = 1;

flavortext = "You feel like you're going to\nhave a bad time.";

dialogInit = false;
dialogIndex = -1;

// This code from NXTALE (Objects\Battle\Characters\Sans\obj_sansb_body\Create)
movemode = 1;
sin_controller = 0;
y_offset = 0;
x_offset = 0;
// end nxtale code

wasd_enabled = true;

dodging = false;
damageanim = [0, -4, -3, -2, -2, -2, -1, 0, 0, 0, 0, 1, 2, 2, 2, 3, 4, -4]; // shows how it should move every frame. a value of 4 means it would move down 4 pixels
dodgeAnim = [0, -12, -12, -12, -12, -12, -12, -10, -8, -6, -4, -2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 4, 6, 8, 10, 12, 12, 12, 12, 12, 12];
animIndex = 0;

collisions_offset = false;

if (!variable_global_exists("recording")) {
    global.recording = false;
    global.frame_count = 0;
}

krCon = instance_create_depth(-100, -100, 0, krController);

attacks = [];

damagedThisFrame = false;

createBoneAttack = function(bonex, boney, bonelength, bonexspeed, boneyspeed) {
	bone = [];
	
	bone[0] = bonex;
	bone[1] = boney;
	bone[2] = bonelength;
	bone[3] = bonexspeed;
	bone[4] = boneyspeed;
	bone[5] = true; // isActive
	bone[6] = 6; // innate_karma
	
	attacks[array_length(attacks)] = bone;
	
	return array_length(attacks) - 1;
}