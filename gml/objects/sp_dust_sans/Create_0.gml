sintimer = 0;
costimer = 1;

sansheadpos = [x + 22, y];
sansbodypos = [x + 2, y + 39];
sanslegspos = [x + 19, y + 106];

xoffset = 0;
yoffset = 0;
rotoffset = 0;

sansheadsprite = head_eyesclosed;
sansbodysprite = body_handsbehindback;
sanslegsprite = legs_normal;

startdodging = false;
dodgetimer = 121;

lerpx = x;
lerpy = y;
lerp_speed = 0.2;

clr = c_white;
alpha = 1;

spare = false;

function MoveTo(newX, newY) {
	x = newX;
	y = newY;
	lerpx = newX;
	lerpy = newY;
}

function LerpTo(lerpX, lerpY) {
	lerpx = lerpX;
	lerpy = lerpY;
}