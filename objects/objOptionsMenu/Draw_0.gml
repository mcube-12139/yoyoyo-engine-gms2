draw_set_font(fArialBold_30);

for (var i = 0; i != optionsNum; ++i) {
    draw_text(xSelector, ySelector + i * ySeperation, strSelect[i]);
}

draw_set_halign(fa_right);

var drawX = xSelector + xSeperation;
var drawY = ySelector;

draw_text(drawX, drawY, global.muteMusic ? "Off" : "On");
drawY += ySeperation;
draw_text(drawX, drawY, string(global.volumeLevel) + "%");
drawY += ySeperation;

draw_text(drawX, drawY, global.fullscreenMode ? "Fullscreen" : "Windowed");
drawY += ySeperation;

draw_text(drawX, drawY, global.smoothingMode ? "On" : "Off");
drawY += ySeperation;

draw_text(drawX, drawY, global.vsyncMode ? "On" : "Off");

draw_sprite(sprPlayerIdle, playerIndex, xSelector - 16, ySelector + select * ySeperation + 26);

draw_set_halign(fa_left);

draw_button_info(false);