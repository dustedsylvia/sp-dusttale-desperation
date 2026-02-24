/// @function                   screenshake(_time, _magnitude, _fade);
/// @param  {real}  _time       The length of time - in steps - to shake the screen
/// @param  {real}  _magnitude  The amount of screenshake to apply
/// @param  {real}  _fade       How quickly the screenshake effect will fade out
/// @description    Set the screenshake object variables.

// Taken directly from https://gamemaker.io/en/tutorials/coffee-break-tutorials-juicy-screenshake-gml

function screenshake(_time, _magnitude, _fade) {
	// I had to change this part
	shaker = instance_create_depth(-100, -100, 0, screenshaker);
	shaker.shake = true;
	shaker.shake_time = _time;
	shaker.shake_magnitude = _magnitude;
	shaker.shake_fade = _fade;
}