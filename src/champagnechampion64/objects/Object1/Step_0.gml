/// @description Insert description here
// You can write your code in this editor

if keyboard_check_pressed(ord("Z"))
{
	drank = 0;
}


if keyboard_check_pressed(ord("X"))
{
	drank = 10;
}

if keyboard_check_pressed(ord("C"))
{
	drank = 20;
}



if (drank => 0)
{
	if !audio_is_playing(music)
	{
		music = audio_play_sound(Sound2,0,true)
	}
}


if keyboard_check_pressed(ord("P"))
{
	audio_stop_sound(music);
}