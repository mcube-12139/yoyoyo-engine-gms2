var drawX = x;
for (var i = 0; i != image_xscale; i++) {
    var drawY = y;
    var column = indices[i];
    for (var j = 0; j != image_yscale; j++) {
        draw_sprite_ext(sprite_index, column[j], drawX, drawY, 1, 1, image_angle, image_blend, image_alpha);
        drawY += 32;
    }
    drawX += 32;
}