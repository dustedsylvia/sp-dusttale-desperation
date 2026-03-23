function createAttackWarning(createX, createY, width=50, height=50, _depth=depth-3, rotation=0, len=300) {
	var warning = instance_create_depth(createX, createY, _depth, attackwarning);
	attackwarning.deleteAfterFrames = len;
	attackwarning.resize(width, height);
	attackwarning.image_angle = rotation;
	
	return warning;
}