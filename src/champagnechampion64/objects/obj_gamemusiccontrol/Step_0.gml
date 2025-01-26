//check for drinks amount, play music


if (global.convo == true)
{
		audio_sound_gain(mu_sober, 0, 240);		
		audio_sound_gain(mu_buzzed, 0, 240);
		audio_sound_gain(mu_drunk, 0, 240);
		audio_sound_gain(mu_questioned, 0.25, 240);
}else{

if (global.points >= 0)
{
		audio_sound_gain(mu_sober, 0.25, 240);		
		audio_sound_gain(mu_buzzed, 0, 240);
		audio_sound_gain(mu_drunk, 0, 240);
		audio_sound_gain(mu_questioned, 0, 240);
}

if (global.points >= 10)
{
		audio_sound_gain(mu_sober, 0, 240);
		audio_sound_gain(mu_buzzed, 0.25, 240);
		audio_sound_gain(mu_drunk, 0, 240);
		audio_sound_gain(mu_questioned, 0, 240);
}

if (global.points >= 20)
{
		audio_sound_gain(mu_sober, 0, 240);
		audio_sound_gain(mu_buzzed, 0, 240);
		audio_sound_gain(mu_drunk, 0.25, 240);
		audio_sound_gain(mu_questioned, 0, 240);
}

}