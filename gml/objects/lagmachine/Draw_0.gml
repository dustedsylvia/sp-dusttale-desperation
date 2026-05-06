var videodata = video_draw();
var status = videodata[0];

if (status == 0) {
    var videosurface = videodata[1];
    draw_surface_ext(videosurface, 0, 0, 1, 1, 0, c_white, 1);
} 