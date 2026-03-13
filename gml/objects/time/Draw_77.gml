//if (window_get_fullscreen() == false) {
//	display_set_gui_size(window_get_width(), window_get_width());

//	if (global.fliphorizontal == false) {
//		draw_surface_stretched_ext(application_surface, 0, 0, window_get_width(), window_get_height(), c_white, 1);
//	} else {
//		draw_surface_ext(application_surface, window_get_width(), 0, -1, 1, 0, c_white, 1);
//	}
//} else {
//	if ((display_get_width() / display_get_height()) <= (4 / 3)) {
//        scale = (display_get_width() / 640);
//    } else {
//        scale = (display_get_height() / 480);
//    }
//	// Resize window & application surface
//	window_set_size(640 * scale, 480 * scale);
//	surface_resize(application_surface, 640 * scale, 480 * scale);

//	// Set the GUI resolution.
//	display_set_gui_size(640, 480);

//	// Get the current desktop resolution.
//	display_width = display_get_width();
//	display_height = display_get_height();

//	// Set the game window resolution.
//	window_width = 640 * scale;
//	window_height = 480 * scale;

//	// Center the window.
//	window_set_position(display_width/2 - window_width/2, display_height/2 - window_height/2);
//}