/// @desc game check

// todo: set texture smoothing mode

// check controller
if (global.controllerEnabled && global.controllerIndex != -1) {
    if (!global.controllerMode) {
        if (keyboard_check_pressed(vk_anykey)) {
            global.controllerDelay = -1;
        } else if (control_get_controller_button() != -1) {
            if (global.controllerDelay == -1) {
                global.controllerDelay = global.controllerDelayLength;
            }
        }
    } else {
        if (keyboard_check_pressed(vk_anykey)) {
            if (global.controllerDelay == -1) {
                global.controllerDelay = global.controllerDelayLength;
            }
        } else if (control_get_controller_button() != -1) {
            global.controllerDelay = -1;
        }
    }
    
    if (global.controllerDelay != -1) {
        if (global.controllerDelay == 0) {
            global.controllerMode = !global.controllerMode;
            global.controllerDelay = -1;
        } else {
            --global.controllerDelay;
        }
    }
}

if (global.gameStarted) {
    // handle pause
    if (global.pauseDelay <= 0) {
        if (control_check_pressed(global.pauseButton)) {
            if (!global.gamePaused) {
                // not paused
                
                if (!global.noPause) {
                    // enable pause
                    
                    global.gamePaused = true;
                    global.pauseDelay = global.pauseDelayLength;
                    
                    instance_deactivate_all(true);
                    
                    global.pauseSurf = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
                    surface_copy(global.pauseSurf, 0, 0, application_surface);
                }
            } else {
                // paused
                
                global.gamePaused = false;
                global.pauseDelay = global.pauseDelayLength;
                
                instance_activate_all();
                
                if (surface_exists(global.pauseSurf)) {
                    surface_free(global.pauseSurf);
                }
                
                game_save_config();
                
                io_clear();
            }
        }
    } else {
        --global.pauseDelay;
    }
    
    if (!global.gamePaused) {
        // not paused
        // check restarting
        if (control_check_pressed(global.restartButton)) {
            // stop death sound & music
            audio_stop_sound(global.deathSound);
            audio_stop_sound(global.gameOverMusic);
            
            // resume room music
            audio_resume_sound(global.currentMusic);
            
            if (global.musicFading) {
                // return music gain
                global.musicFading = false;
                audio_sound_gain(global.currentMusic, global.currentGain, 0);
                alarm[0] = -1;
            }
            
            game_saves(false);
            game_loads(false);
        }
        
        if (global.timeWhenDead || instance_exists(objPlayer)) {
            global.timeMicro += delta_time;
            global.time += global.timeMicro div 1000000;
            global.timeMicro %= 1000000;
        }
    } else {
        // paused
        // check volume changing
        if (control_check(global.upButton)) {
            if (global.volumeLevel < 100) {
                ++global.volumeLevel;
            }
        } else if (control_check(global.downButton)) {
            if (global.volumeLevel > 0) {
                --global.volumeLevel;
            }
        }
        
        audio_master_gain(global.volumeLevel / 100);
    }
    
    game_set_caption();
}

// check debugging
if (global.debugMode && global.gameStarted && !global.gamePaused) {
    if (keyboard_check(vk_tab)) {
        // teleport player to mouse position
        with (objPlayer) {
            x = mouse_x;
            y = mouse_y;
        }
    }
    if (keyboard_check_pressed(vk_backspace)) {
        // toggle debug overlay
        global.debugOverlay = !global.debugOverlay;
    }
    if (keyboard_check_pressed(vk_insert)) {
        // save game
        with (objPlayer) {
            game_saves(true);
            audio_play_sound(sndItem, 0, false);
        }
    }
    if (keyboard_check_pressed(vk_delete)) {
        // toggle showing hitbox
        global.debugShowHitbox = !global.debugShowHitbox;
    }
    if (keyboard_check_pressed(vk_home)) {
        // toggle god mode
        global.debugNoDeath = !global.debugNoDeath;
    }
    if (keyboard_check_pressed(vk_end)) {
        // toggle inf-jump
        global.debugInfJump = !global.debugInfJump;
    }
    if (keyboard_check_pressed(vk_pageup) && room != room_first) {
        // go to next room
        instance_destroy(objPlayer);
        room_goto_next();
    }
    if (keyboard_check_pressed(vk_pagedown) && room != room_last) {
        // go to previous room
        instance_destroy(objPlayer);
        room_goto_previous();
    }
}

// set debug visual
if (global.debugVisuals) {
    with (objPlayer) {
        if (global.debugNoDeath) {
            image_alpha = 0.7;
        } else {
            image_alpha = 1;
        }
        
        if (global.debugInfJump) {
            image_blend = c_blue;
        } else {
            image_blend = c_white;
        }
    }
}

// check functional key
if (keyboard_check_pressed(vk_escape)) {
    game_end();
}

if (keyboard_check_pressed(vk_f2)) {
    game_restarts();
    exit;
}

if (keyboard_check_pressed(vk_f4) && !global.gamePaused) {
    global.fullscreenMode = !global.fullscreenMode;
    window_set_fullscreen(global.fullscreenMode);
    game_save_config();
}

if (keyboard_check_pressed(vk_f5) && !global.gamePaused) {
    game_reset_window_size();
}

if (keyboard_check(vk_control) && keyboard_check_pressed(77) && !global.gamePaused) {
    // M
    // toggle mute music
    music_toggle();
    game_save_config();
}