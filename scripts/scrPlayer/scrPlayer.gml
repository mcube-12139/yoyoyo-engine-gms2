function player_jump() {
    if (place_meeting(x, y + global.grav, objBlock) || place_meeting(x, y + global.grav, objPlatform) || onPlatform) {
        vspeed = -jump;
        doubleJump = true;
        audio_play_sound(sndJump, 0, false);
    } else if (doubleJump || place_meeting(x, y + global.grav, objWater)) {
        vspeed = -airJump;
        sprite_index = sprPlayerJump;
        audio_play_sound(sndDoubleJump, 0, false);
        
        if (!place_meeting(x, y + global.grav, objRefreshWater)) {
            // take away double jump
            doubleJump = false;
        } else {
            // enable double jump
            doubleJump = true;
        }
    }
}

function player_release_jump() {
    if (vspeed * global.grav < 0) {
        vspeed *= 0.45;
    }
}

function player_shoot(mirror) {
    // mirror: boolean - mirror x scale?
    if (instance_number(objBullet) < 4) {
        with (instance_create_layer(x, y, layer, objBullet)) {
            hspeed = (mirror ? -16 : 16) * other.image_xscale;
        }
        audio_play_sound(sndShoot, 0, false);
    }
}

function player_die() {
    // kill player
    
    if (instance_exists(objPlayer) && (!global.noDeath && !global.debugNoDeath)) {
        if (global.gameStarted) {
            // die
            global.deathSound = audio_play_sound(sndDie, 0, false);
            if (!global.muteMusic) {
                // play death music
                if (global.deathMusicMode == DeathMusicMode.PAUSE) {
                    // pause music
                    audio_pause_sound(global.currentMusic);
                    global.gameOverMusic = audio_play_sound(sndDeathBGM, 1, false);
                } else if (global.deathMusicMode == DeathMusicMode.FADE) {
                    // fade out music
                    with (objWorld) {
                        event_user(0);
                    }
                    global.gameOverMusic = audio_play_sound(sndDeathBGM, 1, false);
                }
            }
            
            with (objPlayer) {
                instance_create_layer(x, y, layer, objBloodEmitter);
                instance_destroy();
            }
            
            instance_create_layer(0, 0, "world", objGameOver);
            
            // increase death
            ++global.death;
            
            // save death & time
            game_saves(false);
        } else {
            // die in difficulty selecting room
            instance_destroy(objPlayer);
            room_restart();
        }
    }
}

function player_flip() {
    // flip player
    global.grav = -global.grav;
    with (objPlayer) {
        doubleJump = true;
        vspeed = 0;
        jump = -jump;
        airJump = -airJump;
        gravity = -gravity;
        image_yscale = -image_yscale;
        y += 3 * global.grav;
    }
}