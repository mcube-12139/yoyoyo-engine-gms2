draw_set_font(global.texts.largeFont);

for (var i = 0; i != 11; ++i) {
    var drawX = xSelector + xSeperation;
    var drawY = ySelector + i * ySeperation;
    
    draw_text(xSelector, drawY + 32, strSelect[i]);
    
    draw_set_halign(fa_right);
    
    if (i == select) {
        draw_sprite(sprPlayerIdle, playerIndex, xSelector - 20, drawY + 52);
        
        if (settingKey) {
            draw_text(drawX, drawY + 32, global.texts.pressToSet);
        }
    }
    
    if (!settingKey || i != select) {
        draw_text(drawX, drawY + 32, strKey[i]);
    }
    
    if (resetPrompt && i == 10) {
        draw_text(drawX, drawY + 32, global.texts.controlsReset + "!");
    }
    
    draw_set_halign(fa_left);
}

draw_button_info(false);