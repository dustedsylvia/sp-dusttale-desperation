randomise();

//application_surface_draw_enable(false);

dusti = instance_create_depth(-100, -100, 0, dust_info);

global.hand_dust_animation = dusti.hand;
global.testsansdustanimation = dusti.testsans;
global.mode = "Normal";
global.drawsidebars = true;

global.minutes = 0;
global.prevminutes = 0;
global.seconds = 0;
global.prevseconds = 0;

global.resetcam = false;

global.fliphorizontal = false;

global.screen = instance_create_depth(0, 0, 0, viewanglecontroller);

global.playercutscenemoveup = false;

global.reinitialized = false;

//global.cam = instance_create_depth(0, 0, -9999, camera_controller);

timer = 0;

global.debug = false;

global.drewMaskSurfacesPhaseOne = false;
global.drewMaskSurfacesPhaseTwo = false;

global.disablepivotedbonewarning = false;

global.is_gm_live_enabled = false;