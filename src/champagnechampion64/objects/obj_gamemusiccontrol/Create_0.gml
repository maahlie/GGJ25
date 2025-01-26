//create music group, start playing in sync
audio_stop_sound(mu_intro);
music_sync = audio_create_sync_group(true);

audio_play_in_sync_group(music_sync, mu_sober);
audio_play_in_sync_group(music_sync, mu_buzzed);
audio_play_in_sync_group(music_sync, mu_drunk);
audio_play_in_sync_group(music_sync, mu_questioned);

audio_sound_gain(mu_sober, 0, 0);
audio_sound_gain(mu_buzzed, 0, 0);
audio_sound_gain(mu_drunk, 0, 0);
audio_sound_gain(mu_questioned, 0, 0);

audio_start_sync_group(music_sync);

seq = 0
alarm[0] = 45