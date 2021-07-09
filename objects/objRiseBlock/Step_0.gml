if (yspeed == 0) {
    with (objPlayer) {
        with (other) {
            if (place_meeting(x, y - other.vspeed - global.grav, other)) {
                yspeed = -2;
            }
        }
    }
}

event_inherited();

