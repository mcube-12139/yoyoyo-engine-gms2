function music_toggle() {
    // toggle music
    
    global.muteMusic = !global.muteMusic;
    
    if (!global.muteMusic) {
        // play music
        if (instance_exists(objPlayer) || !global.gameStarted) {
            if (global.roomMusic != -2) {
                music_play(global.roomMusic, true);
            }
        }
    } else {
        music_stop();
        audio_stop_sound(global.gameOverMusic);
    }
}

function music_play(soundid, loops) {
    // play music
    // soundid: real - sound id
    // loops: boolean - loop?
    
    if (!global.muteMusic) {
        if (global.currentMusicID != soundid) {
            global.currentMusicID = soundid;
            
            audio_stop_sound(global.currentMusic);
            
            if (soundid != -1) {
                global.currentMusic = audio_play_sound(soundid, 1, loops);
            }
        }
    }
}

function music_stop() {
    // stop current music
    
    global.currentMusicID = -1;
    
    audio_stop_sound(global.currentMusic);
}