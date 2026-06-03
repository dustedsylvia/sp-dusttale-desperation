#macro DISCORD_APP_ID "1511117222569836766"

ready = false;

alarm[0] = 300;

if (!np_initdiscord(DISCORD_APP_ID, true, 0))
{
	show_message("Warning!!\nInitializing Discord Rich Presence FAILED.\nThe game should still run properly,\nbut Discord Rich Presence won't work.\n\nPress OK to continue.");
}