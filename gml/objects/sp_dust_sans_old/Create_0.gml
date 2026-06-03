sintimer = 0;
costimer = 1;

sansheadpos = [x, y];
sansbodypos = [x, y + 39];
sanslegspos = [x, y + 106];
sansleftarmpos = [x, y + 39];
sansrightarmpos = [x, y + 106];

sansheadoffset = [0, 0];
sansbodyoffset = [0, 39];
sanslegsoffset = [0, 106];

xoffset = 0;
yoffset = 0;
rotoffset = 0;

sansheadsprite = head_blackout;
sansbodysprite = body_blackout;
sanslegsprite = legs_blackout;
sansrightarmsprite = leftarm_uhoh;
sansleftarmsprite = rightarm_uhoh;

sansleftarmangle = 0;
sansrightarmangle = 0;

animationstyle = 1;

parabola_controller = -2.58199;
parabola_speed = 0.02;

sanslegsyscale = 2;

startdodging = false;
dodgetimer = 121;

outline_thickness = 2;

lerpx = x;
lerpy = y;
lerp_speed = 0.2;

clr = c_white;
alpha = 1;

spare = false;

sansheadangle = 0;
sanslegsangle = 0;

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
			animationstyle = 1;
			sansheadsprite = head_blackout;
			sansbodysprite = body_blackout;
			sanslegsprite = legs_blackout;
		break;
		
		case "blackoutshrug":
			animationstyle = 1;
			sansheadsprite = head_blackout;
			sansbodysprite = body_blackout_shrug;
			sanslegsprite = legs_blackout;
		break;
		
		case "blackoutwitheyes":
			animationstyle = 1;
			sansheadsprite = head_blackout_eyes;
			sansbodysprite = body_blackout;
			sanslegsprite = legs_blackout;
		break;
		
		case "normal":
			animationstyle = 1;
			sansheadsprite = head_eyesclosed;
			sansbodysprite = body_handsbehindback;
			sanslegsprite = legs_normal;
		break;
		
		case "slashed":
			animationstyle = 1;
			sansheadsprite = head_danger;
			sansbodysprite = body_ouch;
			sanslegsprite = legs_normal;
		break;
		
		case "quiet":
			animationstyle = 1;
			sansheadsprite = head_fracturedskull_closed_eyes;
			sansbodysprite = body_handsbehindback;
			sanslegsprite = legs_normal;
		break;
		
		case "noeyes":
			animationstyle = 1;
			sansheadsprite = head_fracturedskull_smallsmile;
			sansbodysprite = body_handsbehindback;
			sanslegsprite = legs_normal;
		break;
		
		case "sadredeyes":
			animationstyle = 1;
			sansheadsprite = head_fracturedskull_redeyes;
			sansbodysprite = body_handsbehindback;
			sanslegsprite = legs_normal;
		break;
		
		case "sadredeyesshrug":
			animationstyle = 1;
			sansheadsprite = head_fracturedskull_redeyes;
			sansbodysprite = body_handsopen_1;
			sanslegsprite = legs_normal;
		break;
		
		case "sadredeyewinkshrug":
			animationstyle = 1;
			sansheadsprite = head_sadwink;
			sansbodysprite = body_handsopen_1;
			sanslegsprite = legs_normal;
		break;
		
		case "insane":
			animationstyle = 2;
			sansheadsprite = head_yourecooked;
			sansbodysprite = body_cool_looking;
			sanslegsprite = legs_tall;
			sansrightarmsprite = arm_grabbing;
			sansleftarmsprite = arm_pissed;
		break;
		
		case "desperate":
			animationstyle = 2;
			sansheadsprite = head_determined_eyes_dangerous;
			sansbodysprite = body_cool_looking;
			sanslegsprite = legs_powerfulpose;
			sansrightarmsprite = leftarm_uhoh;
			sansleftarmsprite = rightarm_uhoh;
		break;
	}
}