//check for drinks amount, play music


if (global.points >= 0)
{
		audio_sound_gain(mu_sober, 0.25, 240);		
		audio_sound_gain(mu_buzzed, 0, 240);
		audio_sound_gain(mu_drunk, 0, 240);
}

if (global.points >= 10)
{
		audio_sound_gain(mu_sober, 0, 240);
		audio_sound_gain(mu_buzzed, 0.25, 240);
		audio_sound_gain(mu_drunk, 0, 240);
}

if (global.points >= 20)
{
		audio_sound_gain(mu_sober, 0, 240);
		audio_sound_gain(mu_buzzed, 0, 240);
		audio_sound_gain(mu_drunk, 0.25, 240);
}