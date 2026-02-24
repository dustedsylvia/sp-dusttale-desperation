timer += 1;
doNotIncreaseTime = array_contains([room_mainmenu_canon, room_mainmenu], room);
//show_debug_message("timer:" + string(timer) + "\nincreasing: " + string(!doNotIncreaseTime));
if (timer >= 30 and !doNotIncreaseTime) { global.seconds += 1; timer = 0; };// show_debug_message("increased."); }
if (global.seconds >= 60 and !doNotIncreaseTime) { global.minutes += 1; global.seconds = 0; }
if (global.recording == true) {
    filename = (("frames/frame_" + string(global.frame_count)) + ".png");
    screen_save(filename);
    global.frame_count += 1;
}