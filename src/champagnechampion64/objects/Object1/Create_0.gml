/// @description Insert description here
// You can write your code in this editor
music_sync = audio_create_sync_group(true);
audio_play_in_sync_group(music_sync, mu_1);
audio_play_in_sync_group(music_sync, mu_2);
audio_play_in_sync_group(music_sync, mu_3);
audio_start_sync_group(music_sync);

drank = 0;