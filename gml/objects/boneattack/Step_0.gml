var s = delta_time;

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

if (lerping) {
	if (x != lerpx) {
		x = lerp(x, lerpx, lerp_speed);
	}

	if (y != lerpy) {
		y = lerp(y, lerpy, lerp_speed);
	}
	if (y == lerpy and x == lerpx) {
		lerping = false;
	}
	
}

if (sinspeed != 0) {
	sintmr += sinspeed;
	y = lerp(starty, targety, abs(sin(sintmr)));
}

// time for my incredible coding skills :cool:
// in case it's not blatantly obvious that was satire
length = sprite_get_height(sprite_index);

if (length != lerplength and lerplength != -1) {
	length = lerp(length, lerplength, lerpspeed);
	if (centerpivoted) {
		try {
			sprite_delete(tmpsprite);
		} catch (e) {};
		tmpsprite = sprite_duplicate(asset_get_index("sansbone" + string(round(length))));//black_pixel;//noone;//sprite_duplicate(asset_get_index("sansbone" + string(round(length))));
		show_debug_message($"{id} called sprite_duplicate, and {id} has centerpivoted as {centerpivoted}");
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
			try {
				sprite_delete(tmpsprite);
			} catch (e) {};
			tmpsprite = sprite_duplicate(asset_get_index("sansbone" + string(round(length))));//black_pixel;//sprite_duplicate(asset_get_index("sansbone" + string(round(len))));
			show_debug_message($"{id} called sprite_duplicate, and {id} has centerpivoted as {centerpivoted}");
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


// im definitely transfem im sitting on a table with a starbucks drink while wearing a skirt im so gay
// copyright rachel 2026-present
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
		try {
			sprite_delete(tmpsprite);
		} catch (e) {};
		tmpsprite = sprite_duplicate(asset_get_index("sansbone" + string(round(length))));//black_pixel;//sprite_duplicate(asset_get_index("sansbone" + string(round(linearlength))));
		sprite_assign(tmpsprite, asset_get_index("sansbone" + string(round(linearlength))));
		sprite_set_offset(tmpsprite, round(sprite_get_width(tmpsprite)/2), round(sprite_get_height(tmpsprite)/2));
		sprite_index = tmpsprite;
		removeThisOnDestroy = tmpsprite;
	} else {
		sprite_index = asset_get_index("sansbone" + string(round(linearlength)));
	}
}

if (lengthingbutvertical) {
	if (state == 1) {
		linearlength += lengthspeed;
		if (linearlength >= lengthmax) {
			state = 2;
		}
	}
	if (state == 2) {
		linearlength -= lengthspeed;
		if (linearlength <= lengthmin) {
			state = 1;
		}
	}
	if (centerpivoted) {
		try {
			sprite_delete(tmpsprite);
		} catch (e) {};
		tmpsprite = sprite_duplicate(asset_get_index("sansbone" + string(round(length))));//black_pixel;//sprite_duplicate(asset_get_index("sansbone" + string(round(linearlength))));
		sprite_assign(tmpsprite, asset_get_index("sansbone" + string(round(linearlength))));
		sprite_set_offset(tmpsprite, round(sprite_get_width(tmpsprite)/2), round(sprite_get_height(tmpsprite)/2));
		sprite_index = tmpsprite;
		removeThisOnDestroy = tmpsprite;
	} else {
		sprite_index = asset_get_index("sansbone" + string(round(linearlength)));
	}
}

function MoveTo(newX, newY) {
	x = newX;
	y = newY;
	lerpx = newX;
	lerpy = newY;
}

function LerpTo(lerpX, lerpY) {
	lerpx = lerpX;
	lerpy = lerpY;
}

if (lifetime <= 0) { instance_destroy(); };
//if (!place_meeting(x, y, arenainteract) and destroyIfNotTouchingArena) { instance_destroy(); }

if (delta_time - s >= global.lag_spike_threshold_time) {
	show_debug_message($"Lagspike detected!");
	show_debug_message($"Details:");
	show_debug_message($"Spike time: \"{delta_time - s}\"");
	show_debug_message($"_GMFUNCTION_: \"{_GMFUNCTION_}\"");
	show_debug_message($"Object: \"{object_get_name(object_index)}\"");
	show_debug_message($"Event: \"{event_type}:{event_number}\"");
	show_debug_message($"Callstack:");
	show_debug_message($"   0: \"{debug_get_callstack()[0]}\"");
	show_debug_message($"   1: \"{debug_get_callstack()[1]}\"");
	show_debug_message($"End details.");
}