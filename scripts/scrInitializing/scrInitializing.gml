// enumerations

// menu modes
enum MenuMode {
    WARP_ROOM,
    MENU
}

// death music mode
enum DeathMusicMode {
    NONE,
    PAUSE,
    FADE
}

// difficulties
enum Difficulty {
    MEDIUM = 0,
    HARD = 1,
    VERY_HARD = 2,
    IMPOSSIBLE = 3
}

// camera modes
enum CameraMode {
    NONE,
    SNAPPED,
    SMOOTH
}

// set global option

// debug mode?
global.debugMode = false;
// change player's color & alpha in inf-jump | god mode?
global.debugVisuals = false;
// show debug text overlay?
global.debugOverlay = false;
// enable god mode?
global.debugNoDeath = false;
// enable inf-jump?
global.debugInfJump = false;
// show player's hitbox?
global.debugShowHitbox = false;

// default window caption
global.windowCaptionDef = "YoYoYo Engine GMS2";
global.windowCaptionLast = global.windowCaptionDef;
window_set_caption(global.windowCaptionDef);

// MD5 data password
global.md5StrAdd = "Put something here";

global.startRoom = rStage_01;

// menu mode
global.menuMode = MenuMode.MENU;
// menu sound
global.menuSound = sndJump;
// death music mode
global.deathMusicMode = DeathMusicMode.NONE;
// enable A|D align?
global.adAlign = false;
// count time after died?
global.timeWhenDead = true;
// die at edge?
global.edgeDeath = true;
// pause delay
global.pauseDelayLength = 40;
// delay bow?
global.delayBow = false;
// fix directional tap bug?
global.directionalTapFix = false;
// fix player animation?
global.playerAnimationFix = false;

// secret item number
global.secretItemTotal = 8;
// boss item number
global.bossItemTotal = 8;
// autosave after get secret item?
global.autosaveSecretItems = false;

// enable controller?
global.controllerEnabled = true;
// controller delay
global.controllerDelayLength = 5;

// enable save protection?
global.extraSaveProtection = false;

// initialize global variables

global.savenum = 0;
global.difficulty = Difficulty.MEDIUM;
global.death = 0;
global.time = 0;
global.timeMicro = 0;
global.saveRoom = "";
global.savePlayerX = 0;
global.savePlayerY = 0;
global.grav = 1;
global.saveGrav = 1;

global.roomMusic = -2;
global.roomCameraMode = CameraMode.NONE;
global.roomCameraX = 0;
global.roomCameraY = 0;

global.secretItem = array_create(global.secretItemTotal, false);
global.saveSecretItem = array_create(global.secretItemTotal, false);

global.bossItem = array_create(global.bossItemTotal, false);
global.saveBossItem = array_create(global.bossItemTotal, false);

global.gameClear = false;
global.saveGameClear = false;

global.trigger = array_create(128, false);

// game started?
global.gameStarted = false;
// disable pause?
global.noPause = false;
// autosave when player is created?
global.autosave = false;
// disable death?
global.noDeath = false;
// enable inf-jump?
global.infJump = false;

// game paused?
global.gamePaused = false;
// pause surface id
global.pauseSurf = -1;
// pause delay
global.pauseDelay = 0;

// current music
global.currentMusicID = -1;
// current music instance
global.currentMusic = -1;
// death sound instance
global.deathSound = -1;
// game over music instance
global.gameOverMusic = -1;
// music fading?
global.musicFading = false;
// current music gain
global.currentGain = 0;

// previously selected option on difficulty menu
global.menuSelectPrev[0] = 0;
// previously selected option on option menu
global.menuSelectPrev[1] = 0;

// get window size
global.windowWidth = surface_get_width(application_surface);
global.windowHeight = surface_get_height(application_surface);

// previous window position & size
global.windowXPrev = 0;
global.windowYPrev = 0;
global.windowWidthPrev = 0;
global.windowHeightPrev = 0;

display_set_gui_size(global.windowWidth, global.windowHeight);

// use controller?
global.controllerMode = false;
// controller delay
global.controllerDelay = -1;

// set random seed
randomize();