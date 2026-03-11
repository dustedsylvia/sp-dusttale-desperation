function createbone(bonex, boney, bonelength=sansbone50, bonetype="white", rot=0, alpha=1, xscale=1, yscale=1, xvel=0, yvel=0, rotvel=0, alphavel=0, xscalevel=0, yscalevel=0, _depth=depth-3, rotation=0) {
	var newbone = instance_create_depth(bonex, boney, _depth, boneattack);
	newbone.sprite_index = bonelength;
	newbone.image_angle = rot;
	newbone.image_alpha = alpha;
	newbone.image_xscale = xscale;
	newbone.image_yscale = yscale;
	newbone.xvel = xvel;
	newbone.yvel = yvel;
	newbone.rotvel = rotvel;
	newbone.alphavel = alphavel;
	newbone.xscalevel = xscalevel;
	newbone.yscalevel = yscalevel;
	newbone.type = bonetype;
	
	return newbone;
}