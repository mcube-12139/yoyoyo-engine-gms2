function game_save_config() {
    ini_open("config.ini");
    
    // settings
    ini_write_real("settings", "mute-music", global.muteMusic);
    ini_write_real("settings", "volume-level", global.volumeLevel);
    ini_write_real("settings", "fullscreen-mode", global.fullscreenMode);
    ini_write_real("settings", "smoothing-mode", global.smoothingMode);
    ini_write_real("settings", "vsync-mode", global.vsyncMode);
    
    // keyboard controls
    ini_write_real("controls", "left", global.leftButton[0]);
    ini_write_real("controls", "right", global.rightButton[0]);
    ini_write_real("controls", "up", global.upButton[0]);
    ini_write_real("controls", "down", global.downButton[0]);
    ini_write_real("controls", "jump", global.jumpButton[0]);
    ini_write_real("controls", "shoot", global.shootButton[0]);
    ini_write_real("controls", "restart", global.restartButton[0]);
    ini_write_real("controls", "skip", global.skipButton[0]);
    ini_write_real("controls", "suicide", global.suicideButton[0]);
    ini_write_real("controls", "pause", global.pauseButton[0]);
    ini_write_real("controls", "align-left", global.alignLeftButton[0]);
    ini_write_real("controls", "align-right", global.alignRightButton[0]);
    
    if (global.controllerEnabled) {
        ini_write_real("controller", "index", global.controllerIndex);
        ini_write_real("controller", "left", global.leftButton[1]);
        ini_write_real("controller", "right", global.rightButton[1]);
        ini_write_real("controller", "up", global.upButton[1]);
        ini_write_real("controller", "down", global.downButton[1]);
        ini_write_real("controller", "jump", global.jumpButton[1]);
        ini_write_real("controller", "shoot", global.shootButton[1]);
        ini_write_real("controller", "restart", global.restartButton[1]);
        ini_write_real("controller", "skip", global.skipButton[1]);
        ini_write_real("controller", "suicide", global.suicideButton[1]);
        ini_write_real("controller", "pause", global.pauseButton[1]);
        ini_write_real("controller", "align-left", global.alignLeftButton[1]);
        ini_write_real("controller", "align-right", global.alignRightButton[1]);
    }
    
    ini_close();
}

function game_load_config() {
    ini_open("config.ini");
    
    // settings
    global.muteMusic = ini_read_real("settings", "mute-music", false);
    global.volumeLevel = clamp(floor(ini_read_real("settings", "volume-level", 100)), 0, 100);
    audio_master_gain(global.volumeLevel / 100);
    
    global.fullscreenMode = ini_read_real("settings", "fullscreen-mode", false);
    window_set_fullscreen(global.fullscreenMode);
    
    global.smoothingMode = ini_read_real("settings", "smoothing-mode", false);
    
    global.vsyncMode = ini_read_real("settings", "vsync-mode", false);
    if (global.vsyncMode) {
        // set vsync
        game_set_vsync();
    }
    
    // keyboard controls
    global.leftButton[0] = ini_read_real("controls", "left", vk_left);
    global.rightButton[0] = ini_read_real("controls", "right", vk_right);
    global.upButton[0] = ini_read_real("controls", "up", vk_up);
    global.downButton[0] = ini_read_real("controls", "down", vk_down);
    global.jumpButton[0] = ini_read_real("controls", "jump", vk_shift);
    global.shootButton[0] = ini_read_real("controls", "shoot", 90); // Z
    global.restartButton[0] = ini_read_real("controls", "restart", 82); // R
    global.skipButton[0] = ini_read_real("controls", "skip", 83); // S
    global.suicideButton[0] = ini_read_real("controls", "suicide", 81); // Q
    global.pauseButton[0] = ini_read_real("controls", "pause", 80); // P
    global.alignLeftButton[0] = ini_read_real("controls", "align-left", 65); // A
    global.alignRightButton[0] = ini_read_real("controls", "align-right", 68); // D
    
    // menu keys
    global.menuLeftButton[0] = vk_left;
    global.menuRightButton[0] = vk_right;
    global.menuUpButton[0] = vk_up;
    global.menuDownButton[0] = vk_down;
    global.menuAcceptButton[0] = vk_shift;
    global.menuBackButton[0] = 90; // Z
    global.menuOptionsButton[0] = vk_enter;
    
    if (global.controllerEnabled) {
        // controller options
        global.controllerIndex = ini_read_real("controller", "index", -1);
        global.leftButton[1] = ini_read_real("controller", "left", gp_padl);
        global.rightButton[1] = ini_read_real("controller", "right", gp_padr);
        global.upButton[1] = ini_read_real("controller", "up", gp_padu);
        global.downButton[1] = ini_read_real("controller", "down", gp_padd);
        global.jumpButton[1] = ini_read_real("controller", "jump", gp_face1);
        global.shootButton[1] = ini_read_real("controller", "shoot", gp_face3);
        global.restartButton[1] = ini_read_real("controller", "restart", gp_face4);
        global.skipButton[1] = ini_read_real("controller", "skip", gp_face2);
        global.suicideButton[1] = ini_read_real("controller", "suicide", gp_select);
        global.pauseButton[1] = ini_read_real("controller", "pause", gp_start);
        global.alignLeftButton[1] = ini_read_real("controller", "align-left", gp_shoulderl);
        global.alignRightButton[1] = ini_read_real("controller", "align-right", gp_shoulderr);
    }
    
    // menu buttons
    global.menuLeftButton[1] = gp_padl;
    global.menuRightButton[1] = gp_padr;
    global.menuUpButton[1] = gp_padu;
    global.menuDownButton[1] = gp_padd;
    global.menuAcceptButton[1] = gp_face1;
    global.menuBackButton[1] = gp_face2;
    global.menuOptionsButton[1] = gp_select;
    
    ini_close();
    
    game_save_config();
}

function game_saves(savePosition) {
    // save game
    // savePosition: boolean - save player's position?
    
    if (savePosition) {
        global.saveRoom = room_get_name(room);
        with (objPlayer) {
            global.savePlayerX = x;
            global.savePlayerY = y;
        }
        global.saveGrav = global.grav;
        
        array_copy(global.saveSecretItem, 0, global.secretItem, 0, global.secretItemTotal);
        array_copy(global.saveBossItem, 0, global.bossItem, 0, global.bossItemTotal);
        
        global.saveGameClear = global.gameClear;
    }
    
    var saveJso = {};
    saveJso.death = global.death;
    saveJso.time = global.time;
    saveJso.timeMicro = global.timeMicro;
    saveJso.difficulty = global.difficulty;
    saveJso.saveRoom = global.saveRoom;
    saveJso.savePlayerX = global.savePlayerX;
    saveJso.savePlayerY = global.savePlayerY;
    saveJso.saveGrav = global.saveGrav;
    
    saveJso.saveSecretItem = [];
    saveJso.saveBossItem = [];
    array_copy(saveJso.saveSecretItem, 0, global.saveSecretItem, 0, global.secretItemTotal);
    array_copy(saveJso.saveBossItem, 0, global.saveBossItem, 0, global.bossItemTotal);
    
    saveJso.saveGameClear = global.saveGameClear;
    
    saveJso.jsoMd5 = md5_string_unicode(json_stringify(saveJso) + global.md5StrAdd);
    
    // todo: save securely
    var f = file_text_open_write(@"Data\save-" + string(global.savenum));
    file_text_write_string(f, base64_encode(json_stringify(saveJso)));
    file_text_close(f);
}

function game_loads(loadFile) {
    // load game
    // loadFile: boolean - load from file?
    
    if (loadFile) {
        var saveJso;
        
        var f = file_text_open_read(@"Data\save-" + string(global.savenum));
        var saveValid = true;
        try {
            saveJso = json_parse(base64_decode(file_text_read_string(f)));
        
            global.death = saveJso.death;
            global.time = saveJso.time;
            global.timeMicro = saveJso.timeMicro;
            global.difficulty = saveJso.difficulty;
            global.saveRoom = saveJso.saveRoom;
            global.savePlayerX = saveJso.savePlayerX;
            global.savePlayerY = saveJso.savePlayerY;
            global.saveGrav = saveJso.saveGrav;
            
            if (is_string(global.saveRoom)) {
                if (!room_exists(asset_get_index(global.saveRoom))) {
                    // room does not exist
                    
                    saveValid = false;
                }
            } else {
                saveValid = false;
            }
            
            array_copy(global.saveSecretItem, 0, saveJso.saveSecretItem, 0, global.secretItemTotal);
            array_copy(global.saveBossItem, 0, saveJso.saveBossItem, 0, global.bossItemTotal);
            
            global.saveGameClear = saveJso.saveGameClear;
            
            var jsoMd5 = saveJso.jsoMd5;
            
            // check md5
            if (!is_string(jsoMd5)) {
                jsoMd5 = "";
            }
            
            variable_struct_remove(saveJso, "jsoMd5");
            var genMd5 = md5_string_unicode(json_stringify(saveJso) + global.md5StrAdd);
            
            if (jsoMd5 != genMd5) {
                saveValid = false;
            }
        } catch (e) {
            saveValid = false;
        } finally {
            file_text_close(f);
        }
        
        if (!saveValid) {
            // save is invalid
            
            show_message("Save invalid!");
            game_restarts();
            return;
        }
    }
    
    instance_destroy(objPlayer);
    
    global.gameStarted = true;
    global.noPause = false;
    global.autosave = false;
    
    global.grav = global.saveGrav;
    
    array_copy(global.secretItem, 0, global.saveSecretItem, 0, global.secretItemTotal);
    array_copy(global.bossItem, 0, global.saveBossItem, 0, global.bossItemTotal);
    
    global.gameClear = global.saveGameClear;
    
    instance_create_layer(global.savePlayerX, global.savePlayerY, "player", objPlayer);
    
    room_goto(asset_get_index(global.saveRoom));
}

function game_restarts() {
    // restart game
    if (surface_exists(global.pauseSurf)) {
        surface_free(global.pauseSurf);
    }
    game_restart();
}

function game_set_caption() {
    var caption = global.windowCaptionDef;
    
    if (global.gameStarted) {
        caption += " -" + " Deaths: " + string(global.death) + " Time: ";
        
        var t = floor(global.time);
        caption += time_stringify(t);
    }
    
    if (caption != global.windowCaptionLast) {
        // caption changed
        
        window_set_caption(caption);
    }
    
    global.windowCaptionLast = caption;
}

function game_set_vsync() {
    // enable vsync
    
    global.windowXPrev = window_get_x();
    global.windowYPrev = window_get_y();
    global.windowWidthPrev = window_get_width();
    global.windowHeightPrev = window_get_height();
    
    display_reset(0, global.vsyncMode);
    
    with (objWorld) {
        alarm[1] = 1;
    }
}

function game_set_camera() {
    // set camera
    
    with (objPlayer) {
        if (global.roomCameraMode == CameraMode.SNAPPED) {
            var xFollow = x;
            var yFollow = y;
        
            var viewWidth = camera_get_view_width(view_camera[0]);
            var viewHeight = camera_get_view_height(view_camera[0]);
            camera_set_view_pos(view_camera[0], floor(xFollow / viewWidth) * viewWidth, floor(yFollow / viewHeight) * viewHeight);
        } else if (global.roomCameraMode == CameraMode.SMOOTH) {
            global.roomCameraX += (x - global.roomCameraX) / 4;
            global.roomCameraY += (y - global.roomCameraY) / 4;
            var viewWidth = camera_get_view_width(view_camera[0]);
            var viewHeight = camera_get_view_height(view_camera[0]);
            camera_set_view_pos(view_camera[0], median(0, global.roomCameraX - viewWidth / 2, room_width - viewWidth), median(0, global.roomCameraY - viewHeight / 2, room_height - viewHeight));
        }
    }
}

function game_reset_window_size() {
    window_set_size(global.windowWidth, global.windowHeight);
}