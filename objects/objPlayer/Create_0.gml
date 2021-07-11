// frozen?
frozen = false;

// ground jump power
jump = 8.5 * global.grav;
// air jump power
airJump = 7 * global.grav;
// gravity
gravity = 0.4 * global.grav;
image_yscale = global.grav;

// enable double jump?
doubleJump = true;
// run speed
maxSpeed = 3;
// max fall speed
maxFallSpeed = 9;
// on platform?
onPlatform = false;

// bow exists?
bowExists = global.difficulty == MEDIUM && global.gameStarted;

if (global.autosave) {
    // automatically save
    global.autosave = false;
    game_saves(true);
}