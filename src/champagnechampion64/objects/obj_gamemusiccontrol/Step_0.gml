//check for drinks amount, play music


if (global.points >= 0)
{
		audio_sound_gain(mu_sober, 1, 0);		
		audio_sound_gain(mu_buzzed, 0, 0);
		audio_sound_gain(mu_drunk, 0, 0);
}

if (global.points >= 10)
{
		audio_sound_gain(mu_sober, 0, 0);
		audio_sound_gain(mu_buzzed, 1, 0);
		audio_sound_gain(mu_drunk, 0, 0);
}

if (global.points >= 20)
{
		audio_sound_gain(mu_sober, 0, 0);
		audio_sound_gain(mu_buzzed, 0, 0);
		audio_sound_gain(mu_drunk, 1, 0);
}