// Flow:
// First, the SOUL sprite is drawn where the SOUL last was.
// It stays unbroken for 19 frames.
// On the 20th frame, it turns to the broken sprite and snd_break1 is played.
// For 39 frames, it stays this way.
// On the 60th frame, 5 shards are created (use sprite `shard`)
// All sprites change at the same time
// The shards all stay on one image for exactly 4 frames before moving
// to the next image_index
// 1 second = 30 frames
// 4 frames per image_index
// 30 / 4 = 7.5 fps
// <strikethrough>I'm really not sure about the movement of the shards, though...</strikethrough>
// I checked NXTale and it simply uses an object with some physics things.
// I've replicated this in `objshard`
// For 49 frames (including the frame the shards are created), nothing happens
// After that, over 50 frames, the Game Over text goes from 0 opacity to 1 opacity
// The final color is weirdly #fefefe and not #ffffff
// 37 frames after the game over text reaches #fefefe, the Game Over text is drawn
// (it cannot end now! <name>! stay determined!)
// It's drawn at x: 160 y: 328 without an asterisk in the Determination Mono font
// each character is 12x18 (i confirmed this is true)
// After the text disappears, on the 72nd frame, the Game Over text starts fading
// out from 1 to 0 opacity over 32 frames, 33 if you could the frame with 0 opacity.
// After the Game Over text disappears, on the 30th frame, the overworld starts
// fading in over 11 frames, 12 if you could the final frame with 1 opacity.
// And that's it! That's the whole Game Over sequence.

soulx = global.soul.x;
souly = global.soul.y;

with (global.soul) {
	instance_destroy();
}

with (instance_find(player, 0)) {
	instance_destroy();
}

// These can be changed but they don't have to be
gameovertext = ["It cannot end now!", global.player_name + "![pauseforframes:26]\nStay determined..."];

gameoverflavorer = noone;
gameovermusic = Determination;

// These should not be changed
gameoveropacity = 0;
timer = 0;
soul_sprite = redsoul;
state = 1;
textdone = false;

audio_stop_all();

global.screen.LerpToAngle(0);
with (boneattack) {instance_destroy();}
with (gasterblaster) {instance_destroy();}
with (gasterbeam) {instance_destroy();}
with (platform) {instance_destroy();}
stopColorInversion();