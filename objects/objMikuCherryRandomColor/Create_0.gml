image_speed = 0;

image_blend = make_color_hsv(irandom(255), 255, 255);

curve = 0;

with (objMiku) {
    if (curve) {
        other.curve = choose(-0.5, 0.5);
    }
}