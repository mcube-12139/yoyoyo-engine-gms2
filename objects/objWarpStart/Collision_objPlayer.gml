if (dif == 4) {
    // load game
    if (file_exists(@"Data\save-" + string(global.savenum))) {
        game_loads(true);
    } else {
        player_die();
    }
} else {
    // new game
    global.gameStarted = true;
    global.autosave = true;
    
    global.difficulty = dif;
    
    if (file_exists(@"Data\save-" + string(global.savenum))) {
        file_delete(@"Data\save-" + string(global.savenum));
    }
    
    instance_destroy(objPlayer);
    
    room_goto(global.startRoom);
}