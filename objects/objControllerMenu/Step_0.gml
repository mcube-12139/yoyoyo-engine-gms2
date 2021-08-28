playerIndex = (playerIndex + 0.2) % 4;

if (!settingButton) {
    if (control_check_pressed(global.menuUpButton)) {
        audio_play_sound(global.menuSound, 0, false);
        select = (select + 11) % 12;
    } else if (control_check_pressed(global.menuDownButton)) {
        audio_play_sound(global.menuSound, 0, false);
        select = (select + 1) % 12;
    } else if (control_check_pressed(global.menuBackButton)) {
        game_save_config();
        instance_create_layer(x, y, layer, objOptionsMenu);
        instance_destroy();
        exit;
    } else if (control_check_pressed(global.menuAcceptButton)) {
        if (select != 0) {
            if (select != 11) {
                settingButton = true;
            } else {
                // set controls to default
                global.leftButton[1] = gp_padl;
                global.rightButton[1] = gp_padr;
                global.upButton[1] = gp_padu;
                global.downButton[1] = gp_padd;
                global.jumpButton[1] = gp_face1;
                global.shootButton[1] = gp_face3;
                global.restartButton[1] = gp_face4;
                global.skipButton[1] = gp_face2;
                global.suicideButton[1] = gp_select;
                global.pauseButton[1] = gp_start;
                
                strButton[1] = "D-Pad Left";
                strButton[2] = "D-Pad Right";
                strButton[3] = "D-Pad Up";
                strButton[4] = "D-Pad Down";
                strButton[5] = "A/Cross";
                strButton[6] = "X/Square";
                strButton[7] = "Y/Triangle";
                strButton[8] = "B/Circle";
                strButton[9] = "Select/Touch-Pad";
                strButton[10] = "Start/Options";
                
                resetPrompt = true;
                alarm[0] = 60;
            }
        }
    }
    
    if (select == 0) {
        if (control_check_pressed(global.menuRightButton)) {
            global.controllerIndex = (global.controllerIndex + 2) % 13 - 1;
            if (global.controllerIndex != -1) {
                strButton[0] = string(global.controllerIndex);
            } else {
                strButton[0] = global.texts.disabled;
            }
        } else if (control_check_pressed(global.menuLeftButton)) {
            global.controllerIndex = (global.controllerIndex + 13) % 13 - 1;
            if (global.controllerIndex != -1) {
                strButton[0] = string(global.controllerIndex);
            } else {
                strButton[0] = global.texts.disabled;
            }
        }
    }
} else {
    var buttonChange = control_get_controller_button();
    if (buttonChange != -1) {
        // one button is pressed
        if (select == 1) {
            global.leftButton[1] = buttonChange;
            strButton[1] = control_get_controller_button_name(buttonChange);
        } else if (select == 2) {
            global.rightButton[1] = buttonChange;
            strButton[2] = control_get_controller_button_name(buttonChange);
        } else if (select == 3) {
            global.upButton[1] = buttonChange;
            strButton[3] = control_get_controller_button_name(buttonChange);
        } else if (select == 4) {
            global.downButton[1] = buttonChange;
            strButton[4] = control_get_controller_button_name(buttonChange);
        } else if (select == 5) {
            global.jumpButton[1] = buttonChange;
            strButton[5] = control_get_controller_button_name(buttonChange);
        } else if (select == 6) {
            global.shootButton[1] = buttonChange;
            strButton[6] = control_get_controller_button_name(buttonChange);
        } else if (select == 7) {
            global.restartButton[1] = buttonChange;
            strButton[7] = control_get_controller_button_name(buttonChange);
        } else if (select == 8) {
            global.skipButton[1] = buttonChange;
            strButton[8] = control_get_controller_button_name(buttonChange);
        } else if (select == 9) {
            global.suicideButton[1] = buttonChange;
            strButton[9] = control_get_controller_button_name(buttonChange);
        } else if (select == 10) {
            global.pauseButton[1] = buttonChange;
            strButton[10] = control_get_controller_button_name(buttonChange);
        }
    } else if (keyboard_check_pressed(vk_anykey)) {
        settingButton = false;
    }
}