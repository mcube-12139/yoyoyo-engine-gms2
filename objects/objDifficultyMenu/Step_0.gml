// update sprites
appleIndex = (appleIndex + 1 / 15) mod 2;
playerIndex = (playerIndex + 1 / 5) mod 4;

if (control_check_pressed(global.menuOptionsButton)) {
    global.menuSelectPrev[0] = select;
    room_goto(rOptions);
} else {
    if (!difSelect) {
        if (control_check_pressed(global.menuLeftButton)) {
            audio_play_sound(global.menuSound, 0, false);
            select = (select + 2) % 3;
        } else if (control_check_pressed(global.menuRightButton)) {
            audio_play_sound(global.menuSound, 0, false);
            select = (select + 1) % 3;
        } else if (control_check_pressed(global.menuBackButton)) {
            global.menuSelectPrev[0] = 0;
            room_goto(rTitle);
        } else if (control_check_pressed(global.menuAcceptButton)) {
            if (global.menuMode == MenuMode.WARP_ROOM) {
                global.savenum = select;
                room_goto(rDifficultySelect);
            } else {
                difSelect = true;
                if (exists[select]) {
                    select_2 = -1;
                } else {
                    select_2 = 0;
                }
            }
        }
    } else {
        if (!warnText) {
            if (control_check_pressed(global.menuLeftButton)) {
                audio_play_sound(global.menuSound, 0, false);
                --select_2;
                if ((select_2 == -1 && !exists[select]) || select_2 < -1) {
                    select_2 = 3;
                }
            } else if (control_check_pressed(global.menuRightButton)) {
                audio_play_sound(global.menuSound, 0, false);
                ++select_2;
                if (select_2 > 3) {
                    if (exists[select]) {
                        select_2 = -1;
                    } else {
                        select_2 = 0;
                    }
                }
            } else if (control_check_pressed(global.menuBackButton)) {
                difSelect = false;
            } else if (control_check_pressed(global.menuAcceptButton)) {
                global.savenum = select;
                
                if (select_2 == -1) {
                    // load game
                    if (file_exists(@"Data\save-" + string(global.savenum))) {
                        game_loads(true);
                    }
                } else {
                    // new game
                    if (!file_exists(@"Data\save-" + string(global.savenum))) {
                        global.gameStarted = true;
                        global.autosave = true;
                        
                        global.difficulty = select_2;
                        
                        room_goto(global.startRoom);
                    } else {
                        warnText = true;
                        warnSelect = true;
                    }
                }
            }
        } else {
            if (control_check_pressed(global.menuLeftButton)) {
                audio_play_sound(global.menuSound, 0, false);
                warnSelect = !warnSelect;
            } else if (control_check_pressed(global.menuRightButton)) {
                audio_play_sound(global.menuSound, 0, false);
                warnSelect = !warnSelect;
            } else if (control_check_pressed(global.menuBackButton)) {
                warnText = false;
            } else if (control_check_pressed(global.menuAcceptButton)) {
                if (warnSelect) {
                    // new game
                    global.gameStarted = true;
                    global.autosave = true;
                    
                    global.difficulty = select_2;
                    
                    if (!file_exists(@"Data\save-" + string(global.savenum))) {
                        file_delete(@"Data\save-" + string(global.savenum));
                    }
                    
                    room_goto(global.startRoom);
                } else {
                    warnText = false;
                }
            }
        }
    }
}