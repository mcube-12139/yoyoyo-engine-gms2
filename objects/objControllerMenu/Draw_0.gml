draw_set_font(global.texts.largeFont);

for (var i = 0; i != 12; ++i) {
    var drawX = xSelector + xSeperation;
    var drawY = ySelector + i * ySeperation;
    
    draw_text(xSelector, drawY + 32, strSelect[i]);
    
    draw_set_halign(fa_right);
    
    if (i == select) {
        draw_sprite(sprPlayerIdle, playerIndex, xSelector - 20, drawY + 52);
        
        if (settingButton) {
            draw_text(drawX, drawY + 32, global.texts.pressButtonToSet);
        }
    }
    
    if (!settingButton || i != select) {
        draw_text(drawX, drawY + 32, strButton[i]);
    }
    
    if (resetPrompt && i == 11) {
        draw_text(drawX, drawY + 32, global.texts.controlsReset);
    }
    
    draw_set_halign(fa_left);
}

if (global.controllerIndex != -1) {
    draw_set_color(c_maroon);
    draw_set_font(global.texts.smallFont);
    
    var controllerText = global.texts.currentController + ": ";
    
    if (gamepad_is_connected(global.controllerIndex)) {
        controllerText += gamepad_get_description(global.controllerIndex);
    } else {
        controllerText += global.texts.none;
    }
    
    draw_text(xSelector + 2, ySelector + 12 * ySeperation + 34, controllerText);
    
    draw_set_color(c_black);
}

draw_button_info(false);