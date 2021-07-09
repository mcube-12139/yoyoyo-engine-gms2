draw_set_font(fArialBold_24);

for (var i = 0; i != 12; ++i) {
    var drawX = xSelector + xSeperation;
    var drawY = ySelector + i * ySeperation;
    
    draw_text(xSelector, drawY + 32, strSelect[i]);
    
    draw_set_halign(fa_right);
    
    if (i == select) {
        draw_sprite(sprPlayerIdle, playerIndex, xSelector - 20, drawY + 52);
        
        if (settingButton) {
            draw_text(drawX, drawY + 32, "Press button to set");
        }
    }
    
    if (!settingButton || i != select) {
        draw_text(drawX, drawY + 32, strButton[i]);
    }
    
    if (resetPrompt && i == 11) {
        draw_text(drawX, drawY + 32, "Controls reset!");
    }
    
    draw_set_halign(fa_left);
}

if (global.controllerIndex != -1) {
    draw_set_color(c_maroon);
    draw_set_font(fArialBold_12);
    
    var controllerText = "Current controller: ";
    
    if (gamepad_is_connected(global.controllerIndex)) {
        controllerText += gamepad_get_description(global.controllerIndex);
    } else {
        controllerText += "None";
    }
    
    draw_text(xSelector + 2, ySelector + 12 * ySeperation + 34, controllerText);
    
    draw_set_color(c_black);
}

draw_button_info(false);