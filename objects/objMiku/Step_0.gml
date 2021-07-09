if (instance_exists(objPlayer)) {
    // player exist
    
    ++timer;
    if (timer == 65 || timer == 95 || timer == 118 || timer == 140 || timer == 154 || timer == 191 || timer == 221 || timer == 235 || timer == 243 || timer == 266 || timer == 278) {
        event_user(0);
    } else if (timer == 80 || timer == 103 || timer == 133 || timer == 147 || timer == 169 || timer == 206 || timer == 228 || timer == 257 || timer == 271) {
        event_user(1);
    } else if (timer > 300 && timer < 480) {
        if (timer % 2 == 1) {
            with (instance_create_layer(x, y, "below_player", objMikuCherryRandomColor)) {
                direction = random_range(180, 270);
                speed = random_range(7, 9);
            }
        }
    } else if (timer == 490) {
        with (objMikuCherryRandomColor) {
            direction = 0;
            speed = 0;
        }
    } else if (timer == 505) {
        with (objMikuCherryRandomColor) {
            y -= 30;
        }
    } else if (timer == 520) {
        with (objMikuCherryRandomColor) {
            y -= 30;
        }
    } else if (timer == 528) {
        with (objMikuCherryRandomColor) {
            vspeed = -10;
        }
    } else if (timer > 540 && timer < 875) {
        curve = true;
        
        if (timer % 15 == 1) {
            instance_create_layer(x, y, "below_player", objMikuCherryRandomColorExplode);
        }
    } else if (timer > 1058 && timer < 1110) {
        curve = false;
        instance_create_layer(random(800), random(128), "below_player", objMikuCherryRandomColor);
    } else if (timer == 1120) {
        with (objMikuCherryRandomColor) {
            vspeed = 8;
        }
    } else if (timer > 1130 && timer < 1600) {
        if (timer % 3 == 1) {
            with (instance_create_layer(random(800), 0, "below_player", objMikuCherryRandomColor)) {
                vspeed = 9;
            }
        }
        
        if (timer == 1234 || timer == 1264 || timer == 1286 || timer == 1308 || timer == 1322 || timer == 1480 || timer == 1495 || timer == 1517 || timer == 1547 || timer == 1561 || timer == 1583) {
            event_user(0);
        } else if (timer == 1249 || timer == 1271 || timer == 1301 || timer == 1315 || timer == 1337 || timer == 1510 || timer == 1532 || timer == 1554 || timer == 1568) {
            event_user(1);
        }
    } else if (timer > 1600 && timer < 2070) {
        if (timer % 4 == 1) {
            with (instance_create_layer(800, random(608), "below_player", objMikuCherryRandomColor)) {
                hspeed = -9;
            }
        }
        
        if (timer == 1726 || timer == 1741 || timer == 1763 || timer == 1793 || timer == 1807 || timer == 1829) {
            event_user(0);
        } else if (timer == 1756 || timer == 1778 || timer == 1800 || timer == 1814) {
            event_user(1);
        }
    } else if (timer > 2070 && timer < 2280) {
        if (timer % 8 == 1) {
            instance_create_layer(x, y, "below_player", objMikuCherryRandomColorBounce);
        }
    } else if (timer == 2450) {
        with (objMikuCherryRandomColorBounce) {
            image_blend = c_black;
            speedDown = true;
        }
    } else if (timer == 2550) {
        with (objMikuCherryRandomColorBounce) {
            moveFromPlayer = true;
        }
    } else if (timer > 2675 && timer < 2950) {
        curve = true;
        if (timer % 18 == 1) {
            make_circle(random(800), 0, random(360), 12, choose(6, 7, 8), "below_player", objMikuCherryRandomColor);
        }
    } else if (timer > 2950 && timer < 3200) {
        if (timer % 18 == 1) {
            make_circle(800, random(608), random(360), 12, choose(6, 7, 8), "below_player", objMikuCherryRandomColor);
        }
    } else if (timer > 3200 && timer < 3525) {
        if (timer % 17 == 1) {
            make_circle(random(800), 0, random(360), 12, choose(6, 7, 8), "below_player", objMikuCherryRandomColor);
            make_circle(800, random(608), random(360), 12, choose(6, 7, 8), "below_player", objMikuCherryRandomColor);
        }
    } else if (timer > 3684 && timer < 3750) {
        curve = false;
        with (instance_create_layer(x, y, "below_player", objMikuCherryRandomColor)) {
            direction = random_range(170, 280);
            speed = random_range(8, 10);
        }
    } else if (timer == 3750) {
        music_stop();
        audio_play_sound(sndDie, 0, false);
        
        if (!global.bossItem[0]) {
            with (instance_create_layer(672, 544, "below_player", objBossItem)) {
                itemNum = 0;
            }
        }
        
        instance_destroy();
    }
}