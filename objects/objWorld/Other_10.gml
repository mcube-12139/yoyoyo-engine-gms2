/// @desc fade music out
global.musicFading = true;
global.currentGain = audio_sound_get_gain(global.currentMusic);
audio_sound_gain(global.currentMusic, 0, 1000);

alarm[0] = 50;
