var key_z = keyboard_check_pressed(ord("Z"));
var key_enter = keyboard_check_pressed(vk_enter);
var confirm = (key_z or key_enter);

if (place_meeting(x, y, playerinteract)) {
	global.can_move = false;
	global.can_menu = false;
	var fade = instance_create_depth(0, 0, -9999, fader);
	fade.bounce = true;
	fade.fadeOverFrames = 20;
	fade.startingOpacity = 0;
	fade.targetOpacity = 1;
	fade.executeOnFirstBounce = function() {
		room_goto(targetroom);
		var p = instance_find(player, 0);
		p.x = targetx;
		p.y = targety;
		global.resetcam = true;
	}
	fade.executeOnCompletion = function() {
		global.can_move = true;
		global.can_menu = true;
	}
	fade.mode = "fadeOut";
	instance_destroy();
}