event_inherited();

if (speedDown) {
    if (speed > 0) {
        speed -= 0.25;
    } else {
        speedDown = false;
        speed = 0
    }
}

if (moveFromPlayer) {
    with (objPlayer) {
        other.direction = point_direction(x, y, other.x, other.y);
    }
    
    speed += 0.2;
} else {
    move_bounce_solid(false);
}