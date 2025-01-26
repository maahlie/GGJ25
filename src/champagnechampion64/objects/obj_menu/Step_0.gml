/// @description Insert description here
// You can write your code in this editor

curspressed = global.a_hold

if global.a_pressed and !lol
{
	audio_stop_sound(mu_title);
	audio_play_sound(mu_intro, false, 0.25);
	lol=true
	alarm[0] = 120
	//alarm[1] = 90
	obj_menucamera.dx = 1
}

