for (var i = 0; i != 3; ++i) {
    var drawX = x + i * xSeperation;
    
    draw_set_font(fArialBold_30);
    
    draw_text(drawX, y, str[i]);
    
    draw_set_font(fArialBold_12);
    draw_set_halign(fa_center);
    
    var difStr;
    if (difSelect && i == select) {
        if (!warnText) {
            if (select_2 == -1) {
                difStr = "< Load Game >";
            } else if (select_2 == MEDIUM) {
                difStr = "< Medium >";
            } else if (select_2 == HARD) {
                difStr = "< Hard >";
            } else if (select_2 == VERY_HARD) {
                difStr = "< Very Hard >";
            } else {
                difStr = "< Impossible >";
            }
        } else {
            draw_text(drawX + 63, y - 100, "Are you sure\nyou want to\noverwrite this save?");
            if (warnSelect) {
                difStr = "< Yes >";
            } else {
                difStr = "< No >";
            }
        }
    }
    
    if (exists[i]) {
        // draw death & time
        draw_set_halign(fa_left);
        draw_text(drawX + 10, y + 70, "Deaths: " + string(death[i]));
        draw_text(drawX + 10, y + 90, "Time: " + string(timeStr[i]));
        draw_set_halign(fa_center);
        
        if (!difSelect || (difSelect && i != select)) {
            if (difficulty[i] == MEDIUM) {
                difStr = "Medium";
            } else if (difficulty[i] == HARD) {
                difStr = "Hard";
            } else if (difficulty[i] == VERY_HARD) {
                difStr = "Very Hard";
            } else {
                difStr = "Impossible";
            }
        }
        
        draw_set_font(fArialBold_24);
        
        if (clear[i]) {
            draw_text(drawX + 63, y + 215, "Clear!!");
        }
        var l = 0;
        for (var j = 0; j != 2; ++j) {
            for (var k = 0; k != 4; ++k) {
                if (boss[i][l]) {
                    draw_sprite(sprBossItem, 0, drawX + 32 * k, y + 128 + 32 * j);
                }
                ++l;
            }
        }
    } else {
        if (!difSelect || (difSelect && i != select)) {
            difStr = "No Data";
        }
    }
    
    draw_set_font(fArialBold_12);
    draw_text(drawX + 65, y + 49, difStr);
    
    if (i == select) {
        for (var j = 0; j != 7; ++j) {
            if (j != 3) {
                draw_sprite(sprCherry, appleIndex, drawX + 5 + 20 * j, y + 310);
            } else {
                draw_sprite(sprPlayerIdle, playerIndex, drawX + 5 + 20 * j, y + 310);
            }
        }
    }
    
    draw_set_halign(fa_left);
}

draw_button_info(true);