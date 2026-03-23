if (start) {
	audio_play_sound(gbcharge, 1, false);
	start = false;
}
if (state == "movingintotargetposition") {
	x = lerp(x, targetx, movespeed);
	y = lerp(y, targety, movespeed);
	if (facePlayer and !playerAngleCalculated) {
		endangle = point_direction(targetx, targety, global.soul.x, global.soul.y)+90;
		playerAngleCalculated = true;
	} else {
		image_angle = lerp(image_angle, endangle, movespeed);
	}
}
if (round(x) == round(targetx) and round(y) == round(targety) and round(image_angle) == round(endangle) and state == "movingintotargetposition") {
	state = "firing";
	image_speed = 1;
	x = targetx;
	y = targety;
	image_angle = endangle;
} else if (state == "movingintotargetposition") {
	//show_debug_message("x: ");
	//show_debug_message(round(x));
	//show_debug_message("y: ");
	//show_debug_message(round(y));
	//show_debug_message("ang: ");
	//show_debug_message(round(image_angle));
	
	//show_debug_message("tx: ");
	//show_debug_message(targetx);
	//show_debug_message("ty: ");
	//show_debug_message(targety);
	//show_debug_message("tang: ");
	//show_debug_message(endangle);
	
	//show_debug_message("debug:");
	//show_debug_message(round(x) == round(targetx));
	//show_debug_message(round(y) == round(targety));
	//show_debug_message(round(image_angle) == round(endangle));
	//show_debug_message(state == "movingintotargetposition");
	
	//show_debug_message("current_time: " + string(current_time));
}

if (state == "firing") {
	clock += 1;
	
	if (grabhelpercoords) {
		targetendx = helper.x;
		targetendy = helper.y;
		grabhelpercoords = false;
	}
	
	if (clock == 24) {
		audio_play_sound(gbfire, 1, false);
		//if (image_angle > 180) {
		//	beam = instance_create_depth(x+(sprite_get_width(sprite_index)/2), y, depth+1, gasterbeam);
		//} else {
		//	beam = instance_create_depth(x-(sprite_get_width(sprite_index)/2), y, depth+1, gasterbeam);
		//}
		beam = instance_create_depth(x, y, depth+1, spgasterbeam);
		beam.image_angle = image_angle;
		beam.firelen = firelen;
		beam.target_xscale = image_xscale;
		
		helper = instance_create_depth(x, y, depth, helpercalculation);
		helper.direction = image_angle + 90;
		helper.speed = calculationdistance;
		grabhelpercoords = true;
	}
	
	if (clock == firelen) {
		state = "movingback";
	}
} else if (state == "movingback") {	
	x = lerp(x, targetendx, 0.05);
	y = lerp(y, targetendy, 0.05);
	image_alpha -= 0.03;
	beam.image_alpha -= 0.03;
	
	if (instance_exists(beam)) {
		//if (image_angle > 180) {
		//	beam.x = x+(sprite_get_width(sprite_index)/2);
		//} else {
		//	beam.x = x-(sprite_get_width(sprite_index)/2);
		//}
		beam.x = x;
		beam.y = y;
	}
	
	if ((x < -100 or x > 740) and (y > -100 or y < 580) or image_alpha <= 0) {
		instance_destroy();
	}
}