playerIndex = (playerIndex + 0.2) % 4;

if (control_check_pressed(global.menuUpButton)) {
    audio_play_sound(global.menuSound, 0, false);
    select = (select + optionsNum - 1) % optionsNum;
} else if (control_check_pressed(global.menuDownButton)) {
    audio_play_sound(global.menuSound, 0, false);
    select = (select + 1) % optionsNum;
} else if (control_check_pressed(global.menuBackButton)) {
    game_save_config();
    global.menuSelectPrev[1] = 0;
    room_goto(rMenu);
    exit;
} else if (control_check_pressed(global.menuAcceptButton)) {
    if (select == 0) {
        music_toggle();
    } else if (select == 2) {
        global.fullscreenMode = !global.fullscreenMode;
        window_set_fullscreen(global.fullscreenMode);
    } else if (select == 3) {
        global.smoothingMode = !global.smoothingMode;
    } else if (select == 4) {
        global.vsyncMode = !global.vsyncMode;
        game_set_vsync();
    } else if (select == 5) {
        game_save_config();
        global.menuSelectPrev[1] = select;
        instance_create_layer(x, y, layer, objKeyboardControlsMenu);
        instance_destroy();
        exit;
    } else if (select == 6) {
        game_save_config();
        global.menuSelectPrev[1] = select;
        instance_create_layer(x, y, layer, objControllerMenu);
        instance_destroy();
        exit;
    }
}

if (select == 1) {
    if (control_check(global.menuRightButton)) {
        if (global.volumeLevel < 100) {
            ++global.volumeLevel;
        }
        audio_master_gain(global.volumeLevel / 100);
    } else if (control_check(global.menuLeftButton)) {
        if (global.volumeLevel > 0) {
            --global.volumeLevel;
        }
        audio_master_gain(global.volumeLevel / 100);
    }
}