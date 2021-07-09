if (vspeed == 0) {
    with (objPlayer) {
        with (other) {
            if (place_meeting(x, y - other.vspeed - global.grav, other)) {
                vspeed = 2;
            }
        }
    }
}

event_inherited();

