if (instance_exists(objPlayer)) {
    with (instance_create_layer(x, y, layer, objCherry)) {
        speed = 5;
        with (objPlayer) {
            other.direction = point_direction(other.x, other.y, x, y);
        }
    }
    
    alarm[0] = 45;
}