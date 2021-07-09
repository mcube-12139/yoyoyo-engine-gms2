playerIndex = (playerIndex + 0.2) % 4;

if (!settingKey) {
    if (control_check_pressed(global.menuUpButton)) {
        audio_play_sound(global.menuSound, 0, false);
        select = (select + 10) % 11;
    } else if (control_check_pressed(global.menuDownButton)) {
        audio_play_sound(global.menuSound, 0, false);
        select = (select + 1) % 11;
    } else if (control_check_pressed(global.menuBackButton)) {
        game_save_config();
        instance_create_layer(x, y, layer, objOptionsMenu);
        instance_destroy();
    } else if (control_check_pressed(global.menuAcceptButton)) {
        if (select != 10) {
            settingKey = true;
        } else {
            // set controls to default
            global.leftButton[0] = vk_left;
            global.rightButton[0] = vk_right;
            global.upButton[0] = vk_up;
            global.downButton[0] = vk_down;
            global.jumpButton[0] = vk_shift;
            global.shootButton[0] = 90; // Z
            global.restartButton[0] = 82; // R
            global.skipButton[0] = 83; // S
            global.suicideButton[0] = 81; // Q
            global.pauseButton[0] = 80; // P
            
            strKey[0] = "Left";
            strKey[1] = "Right";
            strKey[2] = "Up";
            strKey[3] = "Down";
            strKey[4] = "Shift";
            strKey[5] = "Z";
            strKey[6] = "R";
            strKey[7] = "S";
            strKey[8] = "Q";
            strKey[9] = "P";
            
            resetPrompt = true;
            alarm[0] = 60;
        }
    }
} else {
    if (keyboard_check_pressed(vk_anykey)) {
        var keyChange = keyboard_key;
        
        if (keyChange == 160 || keyChange == 161) {
            // shift
            
            keyChange = 16;
        }
        
        if (select == 0) {
            global.leftButton[0] = keyChange;
            strKey[0] = control_get_key_name(keyChange);
        } else if (select == 1) {
            global.rightButton[0] = keyChange;
            strKey[1] = control_get_key_name(keyChange);
        } else if (select == 2) {
            global.upButton[0] = keyChange;
            strKey[2] = control_get_key_name(keyChange);
        } else if (select == 3) {
            global.downButton[0] = keyChange;
            strKey[3] = control_get_key_name(keyChange);
        } else if (select == 4) {
            global.jumpButton[0] = keyChange;
            strKey[4] = control_get_key_name(keyChange);
        } else if (select == 5) {
            global.shootButton[0] = keyChange;
            strKey[5] = control_get_key_name(keyChange);
        } else if (select == 6) {
            global.restartButton[0] = keyChange;
            strKey[6] = control_get_key_name(keyChange);
        } else if (select == 7) {
            global.skipButton[0] = keyChange;
            strKey[7] = control_get_key_name(keyChange);
        } else if (select == 8) {
            global.suicideButton[0] = keyChange;
            strKey[8] = control_get_key_name(keyChange);
        } else {
            global.pauseButton[0] = keyChange;
            strKey[9] = control_get_key_name(keyChange);
        }
        
        settingKey = false;
    } else if (control_get_controller_button() != -1) {
        settingKey = false;
    }
}