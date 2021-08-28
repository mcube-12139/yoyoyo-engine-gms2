draw_self();

if (showText) {
    draw_set_font(global.texts.smallFont);
    draw_set_halign(fa_center);
    var yOffset = string_height(signText);
    draw_text(x + sprite_width / 2, y - yOffset, signText);

    draw_set_halign(fa_left);
}