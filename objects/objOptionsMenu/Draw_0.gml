draw_set_font(global.texts.extraLargeFont);

for (var i = 0; i != optionsNum; ++i) {
    draw_text(xSelector, ySelector + i * ySeperation, strSelect[i]);
}

draw_set_halign(fa_right);

var drawX = xSelector + xSeperation;
var drawY = ySelector;

draw_text(drawX, drawY, global.muteMusic ? global.texts.off : global.texts.on);
drawY += ySeperation;
draw_text(drawX, drawY, string(global.volumeLevel) + "%");
drawY += ySeperation;

draw_text(drawX, drawY, global.fullscreenMode ? global.texts.fullscreen : global.texts.windowed);
drawY += ySeperation;

draw_text(drawX, drawY, global.smoothingMode ? global.texts.on : global.texts.off);
drawY += ySeperation;

draw_text(drawX, drawY, global.vsyncMode ? "On" : "Off");

draw_sprite(sprPlayerIdle, playerIndex, xSelector - 16, ySelector + select * ySeperation + 26);

draw_set_halign(fa_left);

draw_button_info(false);