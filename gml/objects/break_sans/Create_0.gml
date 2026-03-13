sintimer = 0;
costimer = 1;

sansheadpos = [x + 22, y];
sansbodypos = [x, y + 44];
sansarmpos = [x + 90, y + 50];
sanslegspos = [x + 12, y + 94];

xoffset = 0;
yoffset = 0;
rotoffset = 0;

sansheadsprite = sansheadnoeyes;
sansbodysprite = sanstorsonormal;
sansarmsprite = sansrightarm;
sanslegsprite = sanslegs;

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