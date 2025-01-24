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



if (drank >= 0)
{
		audio_sound_gain(mu_1, 50, 0);		
		audio_sound_gain(mu_2, 0, 0);
		audio_sound_gain(mu_3, 0, 0);
}

if (drank >= 10)
{
		audio_sound_gain(mu_1, 0, 0);
		audio_sound_gain(mu_2, 50, 0);
		audio_sound_gain(mu_3, 0, 0);
}

if (drank >= 20)
{
		audio_sound_gain(mu_1, 0, 0);
		audio_sound_gain(mu_2, 0, 0);
		audio_sound_gain(mu_3, 50, 0);
}