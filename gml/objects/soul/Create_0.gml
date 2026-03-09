lerpx = x;
lerpy = y;
lerp_speed = 0.3;

move_speed = 2.5;

soulmode = "red";
bluevelocity = 0;
bluegravity = 0.12;
bluedir = "down";
canjump = false;
jumping = false;
collisionclock = 0;

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

function TurnBlue(newDirection) {
	sprite_index = bluesoul;
	bluedir = newDirection;
	soulmode = "blue";
}

function TurnRed() {
	sprite_index = redsoul;
	soulmode = "red";
}

function BlueRotate() {
	if (bluedir == "down") { gravity_direction = 270; };
	if (bluedir == "left") { gravity_direction = 180; };
	if (bluedir == "up") { gravity_direction = 90; };
	if (bluedir == "right") { gravity_direction = 0; };
}