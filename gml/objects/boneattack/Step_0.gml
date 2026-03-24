lifetime -= 1;

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
	
	len = length;
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

if (len != lentomoveto and lentomoveto != -1) {
	lenmovespeed += lenmovespeedspeed;
	// note: using this at the same time as lerpto may not produce very desirable results
	var done = false;
	if (len > lentomoveto) {
		len -= lenmovespeed;
	} else if (len < lentomoveto) {
		len += lenmovespeed;
	} else if (round(len) == round(lentomoveto)) {
		lentomoveto = -1;
		done = true;
	}
	if (!done) {
		if (centerpivoted and round(len) >= 12) {
			tmpsprite = sprite_duplicate(asset_get_index("sansbone" + string(round(len))));
			sprite_assign(tmpsprite, asset_get_index("sansbone" + string(round(len))));
			sprite_set_offset(tmpsprite, round(sprite_get_width(tmpsprite)/2), round(sprite_get_height(tmpsprite)/2));
			sprite_index = tmpsprite;
			removeThisOnDestroy = tmpsprite;
		} else if (round(len) >= 12) {
			sprite_index = asset_get_index("sansbone" + string(round(len)));
		} else {
			instance_destroy();
		}
	}
	
	length = len;
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

if (lifetime <= 0) { instance_destroy(); };
if (!place_meeting(x, y, arenainteract) and destroyIfNotTouchingArena) { instance_destroy(); }