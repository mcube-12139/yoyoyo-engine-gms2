/// @desc draw debug overlay & pause screen

// draw debug overlay
if (global.debugOverlay) {
    draw_set_font(global.texts.smallFont);
    
    var drawX = 0;
    var drawY = 0;
    var drawAlign = 0;
    with (objPlayer) {
        drawX = x;
        drawY = y;
        drawAlign = x % 3;
    }
    
    draw_text_outline(20, 20, "X: " + string(drawX), c_black, c_white);
    draw_text_outline(20, 40, "Y: " + string(drawY), c_black, c_white);
    draw_text_outline(20, 60, "Align: " + string(drawAlign), c_black, c_white);
    draw_text_outline(20, 80, "Room Name: " + string(room_get_name(room)), c_black, c_white);
    draw_text_outline(20, 100, "Room ID: " + string(room), c_black, c_white);
    draw_text_outline(20, 120, "God Mode: " + string(global.debugNoDeath), c_black, c_white);
    draw_text_outline(20, 140, "Infinite Jump: " + string(global.debugInfJump), c_black, c_white);
    draw_text_outline(20, 160, "FPS: " + string(fps), c_black, c_white);
    draw_text_outline(20, 180, "Real FPS: " + string(fps_real), c_black, c_white);
}

// draw pause screen
if (global.gamePaused) {
    draw_clear(c_black);
    
    if (surface_exists(global.pauseSurf)) {
        draw_surface(global.pauseSurf, 0, 0);
    }
    
    var guiWidth = display_get_gui_width();
    var guiHeight = display_get_gui_height();
    draw_set_alpha(0.4);
    draw_rectangle(0, 0, guiWidth - 1, guiHeight - 1, false);
    draw_set_alpha(1);
    
    draw_set_color(c_white);
    
    draw_set_halign(fa_center);
    draw_set_font(global.texts.extraLargeFont);
    
    draw_text(guiWidth / 2, guiHeight / 2 - 24, global.texts.pause);
    
    draw_set_halign(fa_left);
    draw_set_font(global.texts.middleFont);
    
    var t = global.time;
    var timeText = time_stringify(t);
    
    draw_text(20, 516, global.texts.volume + ": " + string(global.volumeLevel) + "%");
    draw_text(20, 541, global.texts.deaths + ": " + string(global.death));
    draw_text(20, 566, global.texts.time + ": " + string(timeText));
}

// draw "Debug Mode" on title screen
if (global.debugMode && room == rTitle) {
    draw_set_color(c_red);
    draw_set_font(global.texts.smallFont);
    draw_text(34, 34, "Debug Mode");
}

draw_set_color(c_black);