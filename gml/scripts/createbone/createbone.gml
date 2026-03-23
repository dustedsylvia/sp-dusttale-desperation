function createbone(bonex, boney, bonelength=sansbone50, bonetype="white", rot=0, alpha=1, xscale=1, yscale=1, xvel=0, yvel=0, rotvel=0, alphavel=0, xscalevel=0, yscalevel=0, _depth=depth-3, centerpivot=false) {
	var newbone = instance_create_depth(bonex, boney, _depth, boneattack);
	if (centerpivot) {
		tmpsprite = sprite_duplicate(bonelength);
		sprite_assign(tmpsprite, bonelength);
		sprite_set_offset(tmpsprite, round(sprite_get_width(tmpsprite)/2), round(sprite_get_height(tmpsprite)/2));
		newbone.sprite_index = tmpsprite;
		newbone.removeThisOnDestroy = tmpsprite;
		newbone.centerpivoted = true;
	} else {
		newbone.sprite_index = bonelength;
	}
	newbone.image_angle = rot;
	newbone.image_alpha = alpha;
	newbone.image_xscale = xscale;
	newbone.image_yscale = yscale;
	newbone.xvel = xvel;
	newbone.yvel = yvel;
	newbone.lerpxspeed = xvel;
	newbone.lerplength = -1;
	newbone.rotvel = rotvel;
	newbone.alphavel = alphavel;
	newbone.xscalevel = xscalevel;
	newbone.yscalevel = yscalevel;
	newbone.type = bonetype;
	
	return newbone;
}