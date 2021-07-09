var drawX = x;
var drawY = y;

draw_self();
if (bowExists) {
    // todo: delay bow
    // draw bow
    draw_sprite_ext(sprBow, 0, drawX, drawY, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}

if (global.debugShowHitbox) {
    // draw hitbox
    
    draw_sprite_ext(mask_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.8 * image_alpha);
}