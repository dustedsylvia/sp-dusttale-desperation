image_xscale = 2;
image_yscale = 2;

fileExists = ini_file_exists("file0.ini");

//nameoverride = 0;
// The name should actually be the %username%.
nameoverride = environment_get_variable("username");
if (string_length(nameoverride) > 6) {
    nameoverride = string_copy(nameoverride, 1, 6);
}

state = 0;
textbox = pointer_null;
menu_open = false;
selected_option = 1;
returntext = "Return";
location = "???????????";
soul_spr = s_detailed_soul;
soul_x = 142;
soul_y = 246;

savetext = ["* The sight of the unchanged\nflavor text fills you\n[color:#FF0000]with DETERMINATION[color:#FFFFFF]."];
saveclone = [];

_minutes = 0;
_seconds = 0;