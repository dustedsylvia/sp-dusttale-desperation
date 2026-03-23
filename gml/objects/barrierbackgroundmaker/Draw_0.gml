var videodata = video_draw();
var status = videodata[0];

if (status == 0) {
    var videosurface = videodata[1];
    draw_surface(videosurface, 0, 0);
} 