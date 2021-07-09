function draw_button_info(optionsText) {
    // draw menu button info
    // optionsText: boolean - draw option text?
    
    var backButton;
    var acceptButton;
    var optionsButton;
    
    if (!global.controllerMode) {
        backButton = control_get_key_name(global.menuBackButton[0]);
        acceptButton = control_get_key_name(global.menuAcceptButton[0]);
        optionsButton = control_get_key_name(global.menuOptionsButton[0]);
    } else {
        backButton = control_get_controller_button_name(global.menuBackButton[1]);
        acceptButton = control_get_controller_button_name(global.menuAcceptButton[1]);
        optionsButton = control_get_controller_button_name(global.menuOptionsButton[1]);
    }
    
    // draw texts
    draw_set_font(fArialBold_12);
    draw_text(34, 556, "[" + backButton + "] Back");
    draw_set_halign(fa_right);
    draw_text(766, 556, "[" + acceptButton + "] Accept");
    
    if (optionsText) {
        // draw option text
        draw_set_halign(fa_middle);
        draw_text(400, 556, "[" + optionsButton + "] Options");
    }
    
    draw_set_halign(fa_left);
}

function draw_text_outline(_x, _y, _string, textColor, outlineColor) {
    // draw text with an outline
    // _x: real - x position
    // _y: real - y position
    // _string: string - text
    // textColor: text color
    // outlineColor: outline color
    
    draw_set_color(outlineColor);
    draw_text(_x - 1, _y + 1, _string);
    draw_text(_x - 1, _y, _string);
    draw_text(_x - 1, _y - 1, _string);
    draw_text(_x + 1, _y + 1, _string);
    draw_text(_x + 1, _y, _string);
    draw_text(_x + 1, _y - 1, _string);
    draw_text(_x, _y + 1, _string);
    draw_text(_x, _y - 1, _string);
    
    draw_set_color(textColor);
    draw_text(_x, _y, _string);
}

function make_shapes(_x, _y, angle, edges, numProjectiles, _speed, _layer, obj) {
    // spawn a shape
    // _x: real - x position
    // _y: real - y position
    // angle: real - start angle
    // edges: real - edge number
    // numProjectile: real - projectile spawns per edge
    // _speed: real - speed
    // _layer: real | string - layer
    // obj: real - projectile to spawn
    
    var rad = degtorad(angle);
    var xx = [];
    var yy = [];
    
    for (var i = 0; i != edges; ++i) {
        xx[i] = cos(rad + 2 * pi * i / edges);
        yy[i] = sin(rad + 2 * pi * i / edges);
    }
    
    xx[edges] = xx[0];
    yy[edges] = yy[0];
    
    for (var i = 0; i != edges; ++i) {
        var ddx = xx[i + 1] - xx[i];
        var ddy = yy[i + 1] - yy[i];
        
        for (var j = 0; j != numProjectiles; ++j) {
            var dx = xx[i] + ddx * j / numProjectiles;
            var dy = yy[i] + ddy * j / numProjectiles;
            
            with (instance_create_layer(_x + dx, _y + dy, _layer, obj)) {
                direction = point_direction(0, 0, dx, dy);
                speed = _speed * point_distance(0, 0, dx, dy);
            }
        }
    }
}

function make_circle(_x, _y, angle, numProjectiles, _speed, _layer, obj) {
    // spawn a ring of projectiles
    // _x: real - x position
    // _y: real - y position
    // angle: real - start angle
    // numProjectiles: real - projectile number
    // _speed: real - speed
    // _layer: real | string - layer
    // obj: real - projectile to spawn
    
    for (var i = 0; i != numProjectiles; ++i) {
        with (instance_create_layer(_x, _y, _layer, obj)) {
            speed = _speed;
            direction = angle * i * 360 / numProjectiles;
        }
    }
}

function time_stringify(seconds) {
    // stringify the time
    // seconds: real - time in seconds
    var result = string(seconds div 3600) + ":";
    seconds %= 3600;
    result += string(seconds div 600);
    seconds %= 600;
    result += string(seconds div 60) + ":";
    seconds %= 60;
    result += string(seconds div 10);
    seconds %= 10;
    result += string(seconds);
    
    return result;
}

function room_get_property() {
    // get room property
    
    var roomSong = -1;
    var cameraMode = CameraMode.NONE;
    
    switch (room) {
    case rTitle:
    case rMenu:
    case rOptions:
    case rDifficultySelect:
        roomSong = sndGuyRockBGM;
        break;
    case rStage_01:
        roomSong = sndGuyRockBGM;
        cameraMode = CameraMode.SNAPPED;
        break;
    case rStage_02:
        roomSong = sndGuyRockBGM;
        cameraMode = CameraMode.SMOOTH;
        break;
    case rCherryBoss:
        roomSong = sndMegaManBGM;
        break;
    case rMiku:
        roomSong = -2;
        break;
    }

    global.roomMusic = roomSong;
    global.roomCameraMode = cameraMode;
    if (roomSong != -2) {
        music_play(roomSong, true);
    }
}