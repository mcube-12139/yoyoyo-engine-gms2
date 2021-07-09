if (place_meeting(x + hspeed, y, objBlock)) {
    if (hspeed <= 0) {
        move_contact_solid(180, -hspeed);
    } else {
        move_contact_solid(0, hspeed);
    }
    hspeed = 0;
}

if (place_meeting(x, y + vspeed, objBlock)) {
    if (vspeed <= 0) {
        move_contact_solid(90, -vspeed);
        if (global.grav == -1) {
            doubleJump = true;
        }
    } else {
        move_contact_solid(270, vspeed);
        if (global.grav == 1) {
            doubleJump = true;
        }
    }
    vspeed = 0;
}

if (place_meeting(x + hspeed, y + vspeed, objBlock)) {
    hspeed = 0;
}