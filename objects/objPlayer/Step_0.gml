// check running
var left = control_check(global.leftButton) || (global.directionalTapFix && control_check_pressed(global.leftButton));
var right = control_check(global.rightButton) || (global.directionalTapFix && control_check_pressed(global.menuRightButton));

var h = 0;

if (!frozen) {
    if (right) {
        h = 1;
    } else if (left) {
        h = -1;
    }
}

var slipBlock = instance_place(x, y + global.grav, objSlipBlock);

// check vine meeting
var notOnBlock = !place_meeting(x, y + global.grav, objBlock);
var onVineLeft = place_meeting(x - 1, y, objVineLeft) && notOnBlock;
var onVineRight = place_meeting(x + 1, y, objVineRight) && notOnBlock;

if (h != 0) {
    // running
    
    image_xscale = h;
    if ((h == -1 && !onVineRight) || (h == 1 && !onVineLeft)) {
        if (slipBlock == noone) {
            // not meet slip block
            
            hspeed = maxSpeed * h;
        } else {
            // meet slip block
            
            hspeed += h * slipBlock.slip;
            if (abs(hspeed > maxSpeed)) {
                hspeed = h * maxSpeed;
            }
        }
        
        sprite_index = sprPlayerRunning;
    }
} else {
    // not running
    if (slipBlock == noone) {
        hspeed = 0;
    } else {
        if (hspeed > 0) {
            hspeed -= slipBlock.slip;
            if (hspeed <= 0) {
                hspeed = 0;
            }
        } else if (hspeed < 0) {
            hspeed += slipBlock.slip;
            if (hspeed >= 0) {
                hspeed = 0;
            }
        }
    }
    
    sprite_index = sprPlayerIdle;
}

// check platform meeting
if (!onPlatform) {
    var vspeedFlip = vspeed * global.grav
    if (vspeedFlip < -0.05) {
        sprite_index = sprPlayerJump;
    } else if (vspeedFlip > 0.05) {
        sprite_index = sprPlayerFall;
    }
} else {
    if (!place_meeting(x, y + 4 * global.grav, objPlatform)) {
        onPlatform = false;
    }
}

// check slide block meeting
var slideBlock = instance_place(x, y + global.grav, objSlideBlock);
if (slideBlock != noone) {
    hspeed += slideBlock.h;
}

// limit vertical speed
if (abs(vspeed) > maxFallSpeed) {
    vspeed = sign(vspeed) * maxFallSpeed;
}

if (!frozen) {
    if (control_check_pressed(global.shootButton)) {
        player_shoot(onVineLeft || onVineRight);
    }
    if (control_check_pressed(global.jumpButton)) {
        player_jump();
    }
    if (control_check_released(global.jumpButton)) {
        player_release_jump();
    }
    if (control_check_pressed(global.suicideButton)) {
        player_die();
    }
}

// update bullets
with (objBullet) {
    event_user(0);
}

// check A/D align
if (global.adAlign && place_meeting(x, y + global.grav, objBlock) && !frozen) {
    if (control_check_pressed(global.alignLeftButton)) {
        --hspeed;
    }
    if (control_check_pressed(global.alignRightButton)) {
        ++hspeed;
    }
}

// check wall jumping
if (onVineLeft || onVineRight) {
    vspeed = 2 * global.grav;
    sprite_index = sprPlayerSliding;
    
    // leave vine
    if ((onVineLeft && control_check_pressed(global.rightButton)) || (onVineRight && control_check_pressed(global.leftButton))) {
        if (control_check(global.jumpButton)) {
            // wall jumping
            if (onVineRight) {
                hspeed = -15;
            } else {
                hspeed = 15;
            }
            
            vspeed = -9 * global.grav;
            audio_play_sound(sndWallJump, 0, false);
            sprite_index = sprPlayerJump;
        } else {
            // fall
            if (onVineRight) {
                hspeed = -3;
            } else {
                hspeed = 3;
            }
            
            sprite_index = sprPlayerFall;
        }
    }
}

// check gravity arrow meeting
var moveX = x + hspeed;
var moveY = y + vspeed + gravity;
if (global.grav == 1) {
    if (place_meeting(moveX, moveY, objGravityUp)) {
        player_flip();
    }
} else {
    if (place_meeting(moveX, moveY, objGravityDown)) {
        player_flip();
    }
}

// check water meeting
moveX = x + hspeed;
moveY = y + vspeed + gravity;
with (objWater) {
    with (other) {
        if (place_meeting(moveX, moveY, other)) {
            if (vspeed * global.grav > 2) {
                vspeed = 2 * global.grav;
                moveY = y + vspeed + gravity;
            }
            if (other.refreshes) {
                doubleJump = true;
            }
        }
    }
}