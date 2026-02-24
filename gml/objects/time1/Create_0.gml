// yes these 3 lines were "borrowed" from JBE
// since i wrote it i don't think it's immoral though
game_set_speed(30, gamespeed_fps);
display_reset(display_aa, false);
randomize();

global.player_name = environment_get_variable("username");
global.player_lv = 1;
global.player_hp = 20;
global.player_maxhp = 16 + (4 * global.player_lv); // won't work for lv 20+
global.player_def = infinity; // yea u good twin
global.player_atk = infinity; // enemy NOT good twin :sob:

global.minutes = 0;
global.prevminutes = 0;
global.seconds = 0;
global.prevseconds = 0;

timer = 0;

if (!variable_global_exists("recording")) {
    global.recording = false;
    global.frame_count = 0;
}

if (directory_exists("frames")) {
	directory_destroy("frames");
    directory_create("frames");
} else if (!directory_exists("frames")) {
	directory_create("frames");
}