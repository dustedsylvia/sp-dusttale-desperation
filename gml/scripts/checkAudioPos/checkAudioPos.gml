function checkAudioPos(audio_id, position, threshold=0.02) {
	if (point_distance(audio_sound_get_track_position(audio_id), 0, position, 0) <= threshold) {
		return true;
	}
	
	return false;
}