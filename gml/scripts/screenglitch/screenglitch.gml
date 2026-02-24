/// @function                   screenglitch(_time, _magnitude, _fade);
/// @param  {real}  _time       The length of time - in steps - to glitch the screen
/// @param  {real}  _magnitude  The amount of glitch to apply
/// @param  {real}  _fade       How quickly the glitch = effect will fade out
/// @description    Set the screenglitch object variables.

// Taken directly from [script]screenshake

function screenglitch(_time, _magnitude, _fade) {
	glitcher = instance_create_depth(-100, -100, 0, screenglitcher);
	glitcher.glitch = true;
	glitcher.glitch_time = _time;
	glitcher.glitch_magnitude = _magnitude;
	glitcher.glitch_fade = _fade;
}