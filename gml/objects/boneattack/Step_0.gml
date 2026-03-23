if (initLen) {
	linearlength = sprite_get_height(sprite_index);
	initLen = false;
}

x += xvel;
y += yvel;
image_angle += rotvel;
image_alpha += alphavel;
if (image_alpha < 0 and destroyOnInvisibility) { instance_destroy(); };
if (image_alpha < 0) { image_alpha = 0; }; // cap opacity to 0-1
if (image_alpha > 1) { image_alpha = 1; };
image_xscale += xscalevel;
image_yscale += yscalevel;

// time for my incredible coding skills :cool:
// in case it's not blatantly obvious that was satire
length = sprite_get_height(sprite_index);

if (length != lerplength and lerplength != -1) {
	length = lerp(length, lerplength, lerpspeed);
	if (centerpivoted) {
		tmpsprite = sprite_duplicate(asset_get_index("sansbone" + string(round(length))));
		sprite_assign(tmpsprite, asset_get_index("sansbone" + string(round(length))));
		sprite_set_offset(tmpsprite, round(sprite_get_width(tmpsprite)/2), round(sprite_get_height(tmpsprite)/2));
		sprite_index = tmpsprite;
		removeThisOnDestroy = tmpsprite;
	} else {
		sprite_index = asset_get_index("sansbone" + string(round(length)));
	}
}

if (xvel != lerpxspeed) {
	xvel = lerp(xvel, lerpxspeed, lerpspeed);
}

if (type == "white") {
	image_color = #FFFFFF;
}
if (type == "blue") {
	image_color = #42FCFF;
}
if (type == "orange") {
	image_color = #FCA600;
}

if (lengthing) {
	if (state == 1) {
		linearlength += lengthspeed;
		y -= lengthspeed;
		if (linearlength >= lengthmax) {
			state = 2;
		}
	}
	if (state == 2) {
		linearlength -= lengthspeed;
		y += lengthspeed;		
		if (linearlength <= lengthmin) {
			state = 1;
		}
	}
	if (centerpivoted) {
		tmpsprite = sprite_duplicate(asset_get_index("sansbone" + string(round(linearlength))));
		sprite_assign(tmpsprite, asset_get_index("sansbone" + string(round(linearlength))));
		sprite_set_offset(tmpsprite, round(sprite_get_width(tmpsprite)/2), round(sprite_get_height(tmpsprite)/2));
		sprite_index = tmpsprite;
		removeThisOnDestroy = tmpsprite;
	} else {
		sprite_index = asset_get_index("sansbone" + string(round(linearlength)));
	}
}

if (!place_meeting(x, y, arenainteract) and destroyIfNotTouchingArena) { instance_destroy(); }