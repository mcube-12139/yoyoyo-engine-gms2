if ((x < 0 || x > room_width || y < 0 || y > room_height) && global.edgeDeath) {
    // outside room & edge dying
    
    player_die();
}

if (place_meeting(x, y, objPlayerKiller)) {
    // meet killer
    
    player_die();
}

// update sprite
if (global.playerAnimationFix) {
    var notOnBlock = !place_meeting(x, y + global.grav, objBlock);
    var onVineRight = place_meeting(x + 1, y, objVineRight) && notOnBlock;
    var onVineLeft = place_meeting(x - 1, y, objVineLeft) && notOnBlock;
    
    if (!onVineRight && !onvineLeft) {
        // not on vine
        
        if (onPlatform || !notOnBlock) {
            // on ground
            
            var left = control_check(global.leftButton) || (global.directionalTapFix && control_check_pressed(global.leftButton));
            var right = control_check(global.rightButton) || (global.directionalTapFix && control_check_pressed(global.rightButton));
            
            if ((left || right) && !frozen) {
                sprite_index = sprPlayerRunning;
            } else {
                sprite_index = sprPlayerIdle;
            }
        } else {
            // not on ground
            
            if (vspeed * global.grav < 0) {
                sprite_index = sprPlayerJump;
            } else {
                sprite_index = sprPlayerFall;
            }
        }
    } else {
        // on vine
        
        sprite_index = sprPlayerSliding;
    }
}