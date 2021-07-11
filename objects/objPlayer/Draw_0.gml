draw_self();
if (bowExists) {
    var bowX;
    var bowY;
    if (global.delayBow) {
        bowX = xprevious;
        bowY = yprevious;
    } else {
        bowX = x;
        bowY = y;
    }
    // draw bow
    draw_sprite_ext(sprBow, 0, bowX, bowY, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}

if (global.debugShowHitbox) {
    // draw hitbox
    
    draw_sprite_ext(mask_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.8 * image_alpha);
}