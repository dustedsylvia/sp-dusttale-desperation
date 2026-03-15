if (x != lerpx) {
	x = lerp(x, lerpx, lerp_speed);
}

if (y != lerpy) {
	y = lerp(y, lerpy, lerp_speed);
}

if (setup == false) {
	switch (button_type) {
		case "fight":
			sprite_index = fightbtn;
		break;
		
		case "act":
			sprite_index = actbtn;
		break;
		
		case "item":
			sprite_index = itembtn;
		break;
		
		case "mercy":
			sprite_index = mercybtn;
		break;
		
		default:
			show_error("thats, um. not a button type.", true);
		break;
	}
}

switch (button_type) {
	case "fight":
		if (global.selected == 1) {
			image_index = 1;
		} else {
			image_index = 0;
		}
	break;
		
	case "act":
		if (global.selected == 2) {
			image_index = 1;
		} else {
			image_index = 0;
		}
	break;
		
	case "item":
		if (global.selected == 3) {
			image_index = 1;
		} else {
			image_index = 0;
		}
	break;
		
	case "mercy":
		if (global.selected == 4) {
			image_index = 1;
		} else {
			image_index = 0;
		}
	break;
		
	default:
		show_error("thats, um. not a button type.", true);
	break;
}

if (global.battle_state != "actionselect" and image_index == 1 and dontkeepbuttonshighlighted) {
	image_index = 0;
}