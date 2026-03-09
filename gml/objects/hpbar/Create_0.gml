// Alright so here's the "english translation" of u/Warlock_D's analysis of KR
// So every one of Sans' attacks has a property called "innate_karma". This
// is applied to Frisk's KR on the first frame of collision. The innate_karma
// then changes to 1.

// Then there's a code snippet that determines how the HP is changed:
// First, it caps the KR to 40. Then, if the KR is greater than the HP value,
// the KR is capped to the HP value minus 1.
// Next, if the KR is > 0 and HP > 1, this code is run:
// The km_t is increased by 1 (i'm assuming this means karma meter timer?)
// if the HP didn't change from last frame then this code is run:
// km_bonus is set to 0 (i don't know what this means)
// If the inv >= 45 (invincibility frames???????) then km_bonus
// is chosen from 0 or 1, if inv >= 60 then km_bonus is set to
// 0, 1, or 1, and if INV >= 75 then km_bonus is set to 1

// Next: the actual application of KR
// if km_t >= 1 plus the km_bonus AND the KR is >= 40 then the kr_t is set to 0,
// hp is decreased by 1, and kr is decreased by 1.
// if km_t >= 2 + km_bonus * 2 AND the KR is >= 30 then the kr_t is set to 0,
// hp is decreased by 1, and kr is decreased by 1.
// if km_t >= 5 + km_bonus * 3 AND the KR is >= 20 then the kr_t is set to 0,
// hp is decreased by 1, and kr is decreased by 1.
// so there's a pattern
// if km_t >= 15 + km_bonus * 5 AND the KR is >= 10 then the kr_t is set to 0,
// hp is decreased by 1, and kr is decreased by 1.
// if km_t >= 30 + km_bonus * 10 then the kr_t is set to 0,
// hp is decreased by 1, and kr is decreased by 1.

// Finally (and this is weird) if the HP is less than 1 the HP is set to one.
// ...I assume this is because KR application probably can kill you?
// u/Warlock_D then mentions the KR value is messed with in ONE bullet.
// but this is probably a bug because of the execution order, so I'm going to
// ignore this.

// init
global.KR = 0;
global.KR_clock = 0;
global.KR_bonus = 0;
global.INV = 10;
previoushp = global.player_hp;
clock = 0;

applykr = function(karma) {
	if (global.player_hp - karma > 0) {
		global.player_hp -= karma;
		global.KR += karma;
	} else if (global.KR > 0) {
		global.KR -= karma;
	} else if (global.player_hp == 1) {
		global.player_hp = 0;
	}

	if (global.KR + global.player_hp > global.player_maxhp) {
		global.player_hp = global.player_maxhp - global.KR;
	}
	
	if (global.player_hp < 0) {
		global.player_hp = 0;
	}
	
	return true;
}

applydamage = function(damage) {
	global.player_hp -= damage;
	if (global.player_hp < 0) {
		global.player_hp = 0;
	}
}

applyheal = function(healamt) {
	global.KR = 0;
	global.KR_clock = 0;
	global.player_hp += healamt;
	if (global.player_hp > global.player_maxhp) {
		global.player_hp = global.player_maxhp;
		return true; // true if hp had to be capped
	} else {
		return false; // false if it didn't
	}
}