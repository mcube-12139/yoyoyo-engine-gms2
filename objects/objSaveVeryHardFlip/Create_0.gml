canSave = true;
grav = -1;

if (global.difficulty > Difficulty.VERY_HARD) {
    instance_destroy();
}

sprite_index = sprSaveFlip;