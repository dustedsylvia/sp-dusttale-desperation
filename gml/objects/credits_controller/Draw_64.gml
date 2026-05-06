draw_set_halign(fa_center);
draw_set_font(dtf_sans_big);
texty -= 0.5;

draw_text(320, texty, credits_text);

if (texty <= -1*(string_height(credits_text)) or keyboard_check_pressed(ord("Z")) and !activated) {
	activated = true;
	var fade = instance_create_depth(0, 0, -9999, fader);
	fade.bounce = true;
	fade.fadeOverFrames = 20;
	fade.startingOpacity = 0;
	fade.targetOpacity = 1;
	fade.executeOnFirstBounce = function() {
		room_goto(room_menu);
	}
	fade.executeOnCompletion = function() {
		global.can_move = true;
		global.can_menu = true;
	}
	fade.mode = "fadeOut";
	audio_sound_gain(music, 0, 250);
	instance_destroy();
}