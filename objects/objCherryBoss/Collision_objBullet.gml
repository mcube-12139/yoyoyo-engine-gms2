audio_play_sound(sndBossHit, 0, false);

instance_destroy(other);

--currentHP;

if (currentHP <= 0) {
    instance_destroy(objHiddenBlock);
    
    global.noPause = false;
    
    instance_destroy();
}