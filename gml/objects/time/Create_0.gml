randomise();

dusti = instance_create_depth(-100, -100, 0, dust_info);

global.hand_dust_animation = dusti.hand;
global.mode = "Normal";
global.drawsidebars = true;

global.minutes = 0;
global.prevminutes = 0;
global.seconds = 0;
global.prevseconds = 0;

global.resetcam = false;

timer = 0;