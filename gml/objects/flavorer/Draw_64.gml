clock += 1;

var key_z = keyboard_check_pressed(ord("Z"));
var key_x = keyboard_check_pressed(ord("X"));

var key_enter = keyboard_check_pressed(vk_enter);
var key_shift = keyboard_check_pressed(vk_shift);

var confirm = (key_z or key_enter);
var cancel = (key_x or key_shift);

// Draw the textbox boxes
draw_rectangle_colour(textbox_x, textbox_y, textbox_x + textbox_outer_width, textbox_y + textbox_outer_height, textbox_outer_color, textbox_outer_color, textbox_outer_color, textbox_outer_color, false);
draw_rectangle_colour(textbox_x + textbox_outerinner_offset_x, textbox_y + textbox_outerinner_offset_y, textbox_x + textbox_outerinner_offset_x + textbox_inner_width, textbox_y + textbox_outerinner_offset_y + textbox_inner_height, textbox_inner_color, textbox_inner_color, textbox_inner_color, textbox_inner_color, false);

// Note: The order in which this code runs is extremely important.
// Not that it normally isn't, but if you switch almost anything the whole thing pretty much breaks.
// soooooooooooooo like try not to do that...

if (pauseforframes >= 1) { pauseforframes -= 1; };
if (needs_page_init) {
	pauseforframes = 0;
	pauseforframescache = [];
	pauseforframesoverride = false;
	pauseforframeslastchar = false;
	colorl0 = [];
	colorl1 = [];
	colorl2 = [];
	defaultcolor = #FFFFFF;
	asteriskcolor1 = #FFFFFF;
	asteriskcolor2 = #FFFFFF;
	asteriskcolor3 = #FFFFFF;
	noskip = -1;
	noskipoverride = false;
	noskiplastchar = false;
	instant = -1;
	instantoverride = false;
	instantlastchar = false;
	advance = -1;
	advanceoverride = false;
	advancelastchar = false;
	noadvance = -1;
	noadvanceoverride = false;
	noadvancelastchar = false;
	done = false;
	
	current_text = text[text_page_index];
	lines = string_split(current_text, "\n");
	current_line_text = lines[current_line];
	total_lines = array_length(lines) - 1;
	needs_page_init = false;
}

if (needs_line_init) {
	pauseforframes = 0;
	pauseforframescache = [];
	pauseforframesoverride = false;
	pauseforframeslastchar = -1;
	defaultcolor = #FFFFFF;
	noskip = -1;
	noskipoverride = false;
	noskiplastchar = false;
	instant = -1;
	instantoverride = false;
	instantlastchar = false;
	advance = -1;
	advanceoverride = false;
	advancelastchar = false;
	noadvance = -1;
	noadvanceoverride = false;
	noadvancelastchar = false;
	done = false;
	
	draw_asterisk = false;
	current_text = text[text_page_index];
	lines = string_split(current_text, "\n");
	current_line_text = lines[current_line];
	needs_line_init = false;
	
	setupLine();
}

if (text_char_index == string_length(current_line_text)) {
	if (noskiplastchar) { noskip = true; };
	if (noadvancelastchar) { noadvance = false; };
	if (pauseforframeslastchar != -1) { pauseforframes = pauseforframeslastchar; pauseforframeslastchar = -1; };
}

if (text_char_index < string_length(current_line_text) and clock % textspd == 0 and pauseforframes == 0) {
	text_char_index += 1;
	audio_play_sound(text_voicebeep, 1, 0);
	for (var i = 0; i < array_length(pauseforframescache); i++) {
		try {
			if (pauseforframescache[i][0] == text_char_index) {
				pauseforframes = pauseforframescache[i][1];
			}
		} catch (error) {} // Looks like you've GONE TOO FAR.
	}
} else if (text_char_index == string_length(current_line_text) and clock % textspd == 0 and current_line != total_lines and pauseforframes == 0) {
	text_char_index = 0;
	current_line += 1;
	needs_line_init = true;
}

if (text_char_index == noadvance or noadvanceoverride == true or (text_char_index == string_length(current_line_text) and noadvancelastchar == true) and pauseforframes == 0) {
	noadvance = true;
	noadvancelastchar = false;
	noadvanceoverride = false;
}

if (cancel and (noskip == -1 or text_char_index < noskip or noskipoverride == true) and pauseforframes == 0) {
	noskipoverride = false;
	if (!(text_char_index == 0 and noskip != -1)) {
		skip();
	}
}

if (confirm and pauseforframes == 0 and noadvance <= 0 and current_line >= total_lines and text_char_index >= string_length(current_line_text)) {
	next();
}

if (text_char_index == instant or instantoverride == true or (text_char_index == string_length(current_line_text) and instantlastchar == true) and pauseforframes == 0) { // need to skip the text
	instantoverride = false;
	// NOTE: [instant] WILL OVERRIDE [noskip]!!!!!!!!!!!!!
	current_text = text[text_page_index];
	lines = string_split(current_text, "\n");
	current_line_text = lines[current_line];
	total_lines = array_length(lines) - 1;
	if (total_lines == 0) {
		text_char_index = string_length(lines[0]);
	} else if (total_lines == 1) {
		text_char_index = string_length(lines[1]);
	} else if (total_lines == 2) {
		text_char_index = string_length(lines[2]);
	}
	
	current_line = total_lines;
	needs_line_init = true;
	if (total_lines >= 1) {
		line1 = string_copy(lines[0], 1, string_length(lines[0]));
		if (string_starts_with(line1, "* ")) {
			line1_asterisk = true;
		}
	}
	if (total_lines >= 2) {
		line2 = string_copy(lines[1], 1, string_length(lines[1]));
		if (string_starts_with(line2, "* ")) {
			line2_asterisk = true;
		}
	}
	if (total_lines >= 3) {
		line3 = string_copy(lines[2], 1, string_length(lines[2]));
		if (string_starts_with(line3, "* ")) {
			line3_asterisk = true;
		}
	}
}

if (text_char_index == advance or advanceoverride == true or (text_char_index == string_length(current_line_text) and advancelastchar == true) and pauseforframes == 0) { next(); };

// THIS causes a problem
if (clock >= 2) {
	if (current_line >= 0 and line1_asterisk) {
		draw_sprite_ext(asterisk_sprite, 0, textbox_x + 28, textbox_y + 32, 1, 1, 0, asteriskcolor1, 1);
	}
	if (current_line >= 1 and line2_asterisk) {
		draw_sprite_ext(asterisk_sprite, 0, textbox_x + 28, textbox_y + 68, 1, 1, 0, asteriskcolor2, 1);
	}
	if (current_line >= 2 and line3_asterisk) {
		draw_sprite_ext(asterisk_sprite, 0, textbox_x + 28, textbox_y + 104, 1, 1, 0, asteriskcolor3, 1);
	}
}

draw_set_font(textfont);
switch (current_line) {
	case 0:
		drawText = string_copy(lines[0], 1, text_char_index);
		for (var i = 0; i < string_length(drawText); i++) {
			var ch = string_char_at(drawText, i + 1);
			var clr = calculateColor(i + 1, 0);
			draw_text_color(textbox_x + text_line1_offset_x + (i * textxoffset), textbox_y + text_line1_offset_y, ch, clr, clr, clr, clr, 1);
		}
	break;
	
	case 1:
		_drawText = stripAsterisks(string_copy(lines[0], 1, string_length(lines[0])));
		for (var i = 0; i < string_length(_drawText); i++) {
			var ch = string_char_at(_drawText, i + 1);
			var clr = calculateColor(i + 1, 0);
			draw_text_color(textbox_x + text_line1_offset_x + (i * textxoffset), textbox_y + text_line1_offset_y, ch, clr, clr, clr, clr, 1);
		}
		drawText = string_copy(lines[1], 1, text_char_index);
		for (var i = 0; i < string_length(drawText); i++) {
			var ch = string_char_at(drawText, i + 1);
			var clr = calculateColor(i + 1, 1);
			draw_text_color(textbox_x + text_line2_offset_x + (i * textxoffset), textbox_y + text_line2_offset_y, ch, clr, clr, clr, clr, 1);
		}
	break;
	
	case 2:
		_drawText = stripAsterisks(string_copy(lines[0], 1, string_length(lines[0])));
		for (var i = 0; i < string_length(_drawText); i++) {
			var ch = string_char_at(_drawText, i + 1);
			var clr = calculateColor(i + 1, 0);
			draw_text_color(textbox_x + text_line1_offset_x + (i * textxoffset), textbox_y + text_line1_offset_y, ch, clr, clr, clr, clr, 1);
		}
		__drawText = string_copy(lines[1], 1, string_length(lines[1]));
		__drawText = string_replace(__drawText, "* ", "");
		for (var i = 0; i < string_length(__drawText); i++) {
			var ch = string_char_at(__drawText, i + 1);
			var clr = calculateColor(i + 1, 1);
			draw_text_color(textbox_x + text_line2_offset_x + (i * textxoffset), textbox_y + text_line2_offset_y, ch, clr, clr, clr, clr, 1);
		}
		drawText = string_copy(lines[2], 1, text_char_index);
		for (var i = 0; i < string_length(drawText); i++) {
			var ch = string_char_at(drawText, i + 1);
			var clr = calculateColor(i + 1, 2);
			draw_text_color(textbox_x + text_line3_offset_x + (i * textxoffset), textbox_y + text_line3_offset_y, ch, clr, clr, clr, clr, 1);
		}
	break;
}