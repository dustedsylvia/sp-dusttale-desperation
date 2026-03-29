sintimer = 0;
costimer = 1;

//sansheadpos = [x + 22, y];
//sansbodypos = [x + 2, y + 39];
//sanslegspos = [x + 19, y + 106];

sansheadpos = [x, y];
sansbodypos = [x, y + 39];
sanslegspos = [x, y + 106];

xoffset = 0;
yoffset = 0;
rotoffset = 0;

sansheadsprite = head_blackout;
sansbodysprite = body_blackout;
sanslegsprite = legs_blackout;

startdodging = false;
dodgetimer = 121;

outline_thickness = 2;

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

function preset(newPreset) {
	switch (newPreset) {
		case "blackout":
			sansheadsprite = head_blackout;
			sansbodysprite = body_blackout;
			sanslegsprite = legs_blackout;
		break;
		
		case "blackoutwitheyes":
			sansheadsprite = head_blackout_eyes;
			sansbodysprite = body_blackout;
			sanslegsprite = legs_blackout;
		break;
		
		case "quiet":
			sansheadsprite = head_fracturedskull_closed_eyes;
			sansbodysprite = body_handsbehindback;
			sanslegsprite = legs_normal;
		break;
		
		case "noeyes":
			sansheadsprite = head_fracturedskull_smallsmile;
			sansbodysprite = body_handsbehindback;
			sanslegsprite = legs_normal;
		break;
		
		case "sadredeyes":
			sansheadsprite = head_fracturedskull_redeyes;
			sansbodysprite = body_handsbehindback;
			sanslegsprite = legs_normal;
		break;
		
		case "sadredeyesshrug":
			sansheadsprite = head_fracturedskull_redeyes;
			sansbodysprite = body_handsopen_1;
			sanslegsprite = legs_normal;
		break;
		
		case "sadredeyewinkshrug":
			sansheadsprite = head_sadwink;
			sansbodysprite = body_handsopen_1;
			sanslegsprite = legs_normal;
		break;
	}
}