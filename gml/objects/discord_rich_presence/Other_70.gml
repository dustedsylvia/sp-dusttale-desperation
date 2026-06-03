var ev_type = async_load[? "event_type"];

if (ev_type == "DiscordReady") {
	global.discord_initialized = true;
	
	ready = true;
	np_setpresence_timestamps(date_current_datetime(), 0, false);
	np_setpresence_more("", "NECROPTOSIS.", false);
	
	np_setpresence_buttons(0, "gamejolt.", "https://gamejolt.com/games/spdusttaledesperation/1018009");
	
	//np_setpresence() should ALWAYS come the last!!
	np_setpresence("* i'm so tired.", "NECROPTOSIS", "cross", "");
	
	// passing a URL will add this sprite asynchronously via *internets*
	sprite_add(np_get_avatar_url(async_load[? "user_id"], async_load[? "avatar"]), 1, false, false, 0, 0);
}