global.secretItem[itemNum] = true;

if (global.autosaveSecretItems) {
    global.saveSecretItem[itemNum] = true;
    game_saves(false);
}

audio_play_sound(sndItem, 0, false);
instance_destroy();