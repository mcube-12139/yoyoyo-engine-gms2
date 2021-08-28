function game_init() {
    // initialize the game
    // set texts
    global.textsEN = {
        gameOverSprite: sprGameOver,
        gameName: "YoYoYo Engine GMS2",
        smallFont: fZKKLT_12,
        back: "Back",
        accept: "Accept",
        options: "Options",
        currentController: "Current controller",
        none: "None",
        loadGame: "Load Game",
        medium: "Medium",
        hard: "Hard",
        veryHard: "Very Hard",
        impossible: "Impossible",
        overwriteWarning: "Are you sure\nyou want to\noverwrite this save?",
        yes: "Yes",
        no: "No",
        noData: "No Data",
        middleFont: fZKKLT_18,
        volume: "Volume",
        deaths: "Deaths",
        time: "Time",
        largeFont: fZKKLT_24,
        clear: "Clear",
        pressToSet: "Press the key to set",
        controlsReset: "Controls reset",
        leftButton: "Left Button",
        rightButton: "Right Button",
        upButton: "Up Button",
        downButton: "Down Button",
        jumpButton: "Jump Button",
        shootButton: "Shoot Button",
        restartButton: "Restart Button",
        skipButton: "Skip Button",
        suicideButton: "Suicide Button",
        pauseButton: "Pause Button",
        resetControls: "Reset Controls",
        pressButtonToSet: "Press button to set",
        controllerIndex: "Controller Index",
        disabled: "Disabled",
        extraLargeFont: fZKKLT_30,
        music: "Music",
        volumeLevel: "Volume Level",
        screenMode: "Screen Mode",
        smoothingMode: "Smoothing Mode",
        vsync: "Vsync",
        setKeyboardControls: "Set Keyboard Controls",
        controllerOptions: "Controller Options",
        off: "Off",
        on: "On",
        fullscreen: "Fullscreen",
        windowed: "Windowed",
        pause: "PAUSE",
        save: "Save"
    };
    global.textsCN = {
        gameOverSprite: sprGameOverCN,
        gameName: "YoYoYo 引擎 GMS2",
        smallFont: fZKKLT_12,
        back: "返回",
        accept: "确定",
        options: "设置",
        currentController: "当前控制器",
        none: "无",
        loadGame: "读取存档",
        medium: "一般",
        hard: "困难",
        veryHard: "非常困难",
        impossible: "不可能",
        overwriteWarning: "你确定要覆盖\n这个存档吗?",
        yes: "是",
        no: "否",
        noData: "无存档",
        middleFont: fZKKLT_18,
        volume: "音量",
        deaths: "死亡",
        time: "时间",
        largeFont: fZKKLT_24,
        clear: "通关",
        pressToSet: "按下要设置的按键",
        controlsReset: "键位重置了",
        leftButton: "左键",
        rightButton: "右键",
        upButton: "上键",
        downButton: "下键",
        jumpButton: "跳跃键",
        shootButton: "射击键",
        restartButton: "重试键",
        skipButton: "跳过键",
        suicideButton: "自杀键",
        pauseButton: "暂停键",
        resetControls: "重置键位",
        pressButtonToSet: "按下要设置的按钮",
        controllerIndex: "控制器号码",
        disabled: "禁用",
        extraLargeFont: fZKKLT_30,
        music: "音乐",
        volumeLevel: "音量",
        screenMode: "屏幕模式",
        smoothingMode: "平滑模式",
        vsync: "垂直同步",
        setKeyboardControls: "设置键位",
        controllerOptions: "设置控制器",
        off: "关",
        on: "开",
        fullscreen: "全屏",
        windowed: "窗口化",
        pause: "暂停",
        save: "存档"
    };
    global.texts = global.textsCN;
    
    // set global option

    // debug mode?
    global.debugMode = true;
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
    global.windowCaptionLast = global.texts.gameName;
    window_set_caption(global.windowCaptionLast);

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
    global.difficulty = MEDIUM;
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

    // last autotiled room
    global.autotileLastRoom = -1;
    global.autotileMode = AutotileMode.NONE;
    global.autotileMap = ds_map_create();
    
    global.autotile4dIndices[46] = 3;
    global.autotile4dIndices[0] = 0;
    global.autotile4dIndices[1] = 3;
    global.autotile4dIndices[2] = 3;
    global.autotile4dIndices[3] = 3;
    global.autotile4dIndices[4] = 3;
    global.autotile4dIndices[5] = 3;
    global.autotile4dIndices[6] = 3;
    global.autotile4dIndices[7] = 3;
    global.autotile4dIndices[8] = 3;
    global.autotile4dIndices[9] = 3;
    global.autotile4dIndices[10] = 3;
    global.autotile4dIndices[11] = 3;
    global.autotile4dIndices[12] = 3;
    global.autotile4dIndices[13] = 3;
    global.autotile4dIndices[14] = 3;
    global.autotile4dIndices[15] = 3;
    global.autotile4dIndices[16] = 2;
    global.autotile4dIndices[17] = 3;
    global.autotile4dIndices[18] = 3;
    global.autotile4dIndices[19] = 3;
    global.autotile4dIndices[20] = 1;
    global.autotile4dIndices[21] = 3;
    global.autotile4dIndices[22] = 3;
    global.autotile4dIndices[23] = 3;
    global.autotile4dIndices[24] = 2;
    global.autotile4dIndices[25] = 3;
    global.autotile4dIndices[26] = 3;
    global.autotile4dIndices[27] = 3;
    global.autotile4dIndices[28] = 1;
    global.autotile4dIndices[29] = 3;
    global.autotile4dIndices[30] = 3;
    global.autotile4dIndices[31] = 3;
    global.autotile4dIndices[32] = 2;
    global.autotile4dIndices[33] = 1;
    global.autotile4dIndices[34] = 3;
    global.autotile4dIndices[35] = 3;
    global.autotile4dIndices[36] = 3;
    global.autotile4dIndices[37] = 3;
    global.autotile4dIndices[38] = 3;
    global.autotile4dIndices[39] = 3;
    global.autotile4dIndices[40] = 3;
    global.autotile4dIndices[41] = 3;
    global.autotile4dIndices[42] = 3;
    global.autotile4dIndices[43] = 3;
    global.autotile4dIndices[44] = 3;
    global.autotile4dIndices[45] = 3;

    global.autotileIndices[255] = 0;
    global.autotileIndices[0] = 46;
    global.autotileIndices[1] = 46;
    global.autotileIndices[2] = 45;
    global.autotileIndices[3] = 45;
    global.autotileIndices[4] = 46;
    global.autotileIndices[5] = 46;
    global.autotileIndices[6] = 45;
    global.autotileIndices[7] = 45;
    global.autotileIndices[8] = 42;
    global.autotileIndices[9] = 42;
    global.autotileIndices[10] = 37;
    global.autotileIndices[11] = 37;
    global.autotileIndices[12] = 42;
    global.autotileIndices[13] = 42;
    global.autotileIndices[14] = 36;
    global.autotileIndices[15] = 36;
    global.autotileIndices[16] = 46;
    global.autotileIndices[17] = 46;
    global.autotileIndices[18] = 45;
    global.autotileIndices[19] = 45;
    global.autotileIndices[20] = 46;
    global.autotileIndices[21] = 46;
    global.autotileIndices[22] = 45;
    global.autotileIndices[23] = 45;
    global.autotileIndices[24] = 42;
    global.autotileIndices[25] = 42;
    global.autotileIndices[26] = 37;
    global.autotileIndices[27] = 37;
    global.autotileIndices[28] = 42;
    global.autotileIndices[29] = 42;
    global.autotileIndices[30] = 36;
    global.autotileIndices[31] = 36;
    global.autotileIndices[32] = 43;
    global.autotileIndices[33] = 43;
    global.autotileIndices[34] = 33;
    global.autotileIndices[35] = 33;
    global.autotileIndices[36] = 43;
    global.autotileIndices[37] = 43;
    global.autotileIndices[38] = 33;
    global.autotileIndices[39] = 33;
    global.autotileIndices[40] = 35;
    global.autotileIndices[41] = 35;
    global.autotileIndices[42] = 23;
    global.autotileIndices[43] = 23;
    global.autotileIndices[44] = 35;
    global.autotileIndices[45] = 35;
    global.autotileIndices[46] = 21;
    global.autotileIndices[47] = 21;
    global.autotileIndices[48] = 43;
    global.autotileIndices[49] = 43;
    global.autotileIndices[50] = 33;
    global.autotileIndices[51] = 33;
    global.autotileIndices[52] = 43;
    global.autotileIndices[53] = 43;
    global.autotileIndices[54] = 33;
    global.autotileIndices[55] = 33;
    global.autotileIndices[56] = 34;
    global.autotileIndices[57] = 34;
    global.autotileIndices[58] = 22;
    global.autotileIndices[59] = 22;
    global.autotileIndices[60] = 34;
    global.autotileIndices[61] = 34;
    global.autotileIndices[62] = 20;
    global.autotileIndices[63] = 20;
    global.autotileIndices[64] = 46;
    global.autotileIndices[65] = 46;
    global.autotileIndices[66] = 45;
    global.autotileIndices[67] = 45;
    global.autotileIndices[68] = 46;
    global.autotileIndices[69] = 46;
    global.autotileIndices[70] = 45;
    global.autotileIndices[71] = 45;
    global.autotileIndices[72] = 42;
    global.autotileIndices[73] = 42;
    global.autotileIndices[74] = 37;
    global.autotileIndices[75] = 37;
    global.autotileIndices[76] = 42;
    global.autotileIndices[77] = 42;
    global.autotileIndices[78] = 36;
    global.autotileIndices[79] = 36;
    global.autotileIndices[80] = 46;
    global.autotileIndices[81] = 46;
    global.autotileIndices[82] = 45;
    global.autotileIndices[83] = 45;
    global.autotileIndices[84] = 46;
    global.autotileIndices[85] = 46;
    global.autotileIndices[86] = 45;
    global.autotileIndices[87] = 45;
    global.autotileIndices[88] = 42;
    global.autotileIndices[89] = 42;
    global.autotileIndices[90] = 37;
    global.autotileIndices[91] = 37;
    global.autotileIndices[92] = 42;
    global.autotileIndices[93] = 42;
    global.autotileIndices[94] = 36;
    global.autotileIndices[95] = 36;
    global.autotileIndices[96] = 43;
    global.autotileIndices[97] = 43;
    global.autotileIndices[98] = 33;
    global.autotileIndices[99] = 33;
    global.autotileIndices[100] = 43;
    global.autotileIndices[101] = 43;
    global.autotileIndices[102] = 33;
    global.autotileIndices[103] = 33;
    global.autotileIndices[104] = 35;
    global.autotileIndices[105] = 35;
    global.autotileIndices[106] = 23;
    global.autotileIndices[107] = 23;
    global.autotileIndices[108] = 35;
    global.autotileIndices[109] = 35;
    global.autotileIndices[110] = 21;
    global.autotileIndices[111] = 21;
    global.autotileIndices[112] = 43;
    global.autotileIndices[113] = 43;
    global.autotileIndices[114] = 33;
    global.autotileIndices[115] = 33;
    global.autotileIndices[116] = 43;
    global.autotileIndices[117] = 43;
    global.autotileIndices[118] = 33;
    global.autotileIndices[119] = 33;
    global.autotileIndices[120] = 34;
    global.autotileIndices[121] = 34;
    global.autotileIndices[122] = 22;
    global.autotileIndices[123] = 22;
    global.autotileIndices[124] = 34;
    global.autotileIndices[125] = 34;
    global.autotileIndices[126] = 20;
    global.autotileIndices[127] = 20;
    global.autotileIndices[128] = 44;
    global.autotileIndices[129] = 44;
    global.autotileIndices[130] = 39;
    global.autotileIndices[131] = 38;
    global.autotileIndices[132] = 44;
    global.autotileIndices[133] = 44;
    global.autotileIndices[134] = 39;
    global.autotileIndices[135] = 38;
    global.autotileIndices[136] = 32;
    global.autotileIndices[137] = 32;
    global.autotileIndices[138] = 27;
    global.autotileIndices[139] = 25;
    global.autotileIndices[140] = 32;
    global.autotileIndices[141] = 32;
    global.autotileIndices[142] = 26;
    global.autotileIndices[143] = 24;
    global.autotileIndices[144] = 44;
    global.autotileIndices[145] = 44;
    global.autotileIndices[146] = 39;
    global.autotileIndices[147] = 38;
    global.autotileIndices[148] = 44;
    global.autotileIndices[149] = 44;
    global.autotileIndices[150] = 39;
    global.autotileIndices[151] = 38;
    global.autotileIndices[152] = 32;
    global.autotileIndices[153] = 32;
    global.autotileIndices[154] = 27;
    global.autotileIndices[155] = 25;
    global.autotileIndices[156] = 32;
    global.autotileIndices[157] = 32;
    global.autotileIndices[158] = 26;
    global.autotileIndices[159] = 24;
    global.autotileIndices[160] = 41;
    global.autotileIndices[161] = 41;
    global.autotileIndices[162] = 31;
    global.autotileIndices[163] = 30;
    global.autotileIndices[164] = 41;
    global.autotileIndices[165] = 41;
    global.autotileIndices[166] = 31;
    global.autotileIndices[167] = 30;
    global.autotileIndices[168] = 19;
    global.autotileIndices[169] = 19;
    global.autotileIndices[170] = 15;
    global.autotileIndices[171] = 14;
    global.autotileIndices[172] = 19;
    global.autotileIndices[173] = 19;
    global.autotileIndices[174] = 7;
    global.autotileIndices[175] = 6;
    global.autotileIndices[176] = 41;
    global.autotileIndices[177] = 41;
    global.autotileIndices[178] = 31;
    global.autotileIndices[179] = 30;
    global.autotileIndices[180] = 41;
    global.autotileIndices[181] = 41;
    global.autotileIndices[182] = 31;
    global.autotileIndices[183] = 30;
    global.autotileIndices[184] = 17;
    global.autotileIndices[185] = 17;
    global.autotileIndices[186] = 11;
    global.autotileIndices[187] = 10;
    global.autotileIndices[188] = 17;
    global.autotileIndices[189] = 17;
    global.autotileIndices[190] = 3;
    global.autotileIndices[191] = 2;
    global.autotileIndices[192] = 44;
    global.autotileIndices[193] = 44;
    global.autotileIndices[194] = 39;
    global.autotileIndices[195] = 38;
    global.autotileIndices[196] = 44;
    global.autotileIndices[197] = 44;
    global.autotileIndices[198] = 39;
    global.autotileIndices[199] = 38;
    global.autotileIndices[200] = 32;
    global.autotileIndices[201] = 32;
    global.autotileIndices[202] = 27;
    global.autotileIndices[203] = 25;
    global.autotileIndices[204] = 32;
    global.autotileIndices[205] = 32;
    global.autotileIndices[206] = 26;
    global.autotileIndices[207] = 24;
    global.autotileIndices[208] = 44;
    global.autotileIndices[209] = 44;
    global.autotileIndices[210] = 39;
    global.autotileIndices[211] = 38;
    global.autotileIndices[212] = 44;
    global.autotileIndices[213] = 44;
    global.autotileIndices[214] = 39;
    global.autotileIndices[215] = 38;
    global.autotileIndices[216] = 32;
    global.autotileIndices[217] = 32;
    global.autotileIndices[218] = 27;
    global.autotileIndices[219] = 25;
    global.autotileIndices[220] = 32;
    global.autotileIndices[221] = 32;
    global.autotileIndices[222] = 26;
    global.autotileIndices[223] = 24;
    global.autotileIndices[224] = 40;
    global.autotileIndices[225] = 40;
    global.autotileIndices[226] = 29;
    global.autotileIndices[227] = 28;
    global.autotileIndices[228] = 40;
    global.autotileIndices[229] = 40;
    global.autotileIndices[230] = 29;
    global.autotileIndices[231] = 28;
    global.autotileIndices[232] = 18;
    global.autotileIndices[233] = 18;
    global.autotileIndices[234] = 13;
    global.autotileIndices[235] = 12;
    global.autotileIndices[236] = 18;
    global.autotileIndices[237] = 18;
    global.autotileIndices[238] = 5;
    global.autotileIndices[239] = 4;
    global.autotileIndices[240] = 40;
    global.autotileIndices[241] = 40;
    global.autotileIndices[242] = 29;
    global.autotileIndices[243] = 28;
    global.autotileIndices[244] = 40;
    global.autotileIndices[245] = 40;
    global.autotileIndices[246] = 29;
    global.autotileIndices[247] = 28;
    global.autotileIndices[248] = 16;
    global.autotileIndices[249] = 16;
    global.autotileIndices[250] = 9;
    global.autotileIndices[251] = 8;
    global.autotileIndices[252] = 16;
    global.autotileIndices[253] = 16;
    global.autotileIndices[254] = 1;

    // set random seed
    randomize();
}

function game_save_config() {
    ini_open("config.ini");
    
    // settings
    ini_write_real("settings", "mute-music", global.muteMusic);
    ini_write_real("settings", "volume-level", global.volumeLevel);
    ini_write_real("settings", "fullscreen-mode", global.fullscreenMode);
    ini_write_real("settings", "smoothing-mode", global.smoothingMode);
    ini_write_real("settings", "vsync-mode", global.vsyncMode);
    
    // keyboard controls
    ini_write_real("controls", "left", global.leftButton[0]);
    ini_write_real("controls", "right", global.rightButton[0]);
    ini_write_real("controls", "up", global.upButton[0]);
    ini_write_real("controls", "down", global.downButton[0]);
    ini_write_real("controls", "jump", global.jumpButton[0]);
    ini_write_real("controls", "shoot", global.shootButton[0]);
    ini_write_real("controls", "restart", global.restartButton[0]);
    ini_write_real("controls", "skip", global.skipButton[0]);
    ini_write_real("controls", "suicide", global.suicideButton[0]);
    ini_write_real("controls", "pause", global.pauseButton[0]);
    ini_write_real("controls", "align-left", global.alignLeftButton[0]);
    ini_write_real("controls", "align-right", global.alignRightButton[0]);
    
    if (global.controllerEnabled) {
        ini_write_real("controller", "index", global.controllerIndex);
        ini_write_real("controller", "left", global.leftButton[1]);
        ini_write_real("controller", "right", global.rightButton[1]);
        ini_write_real("controller", "up", global.upButton[1]);
        ini_write_real("controller", "down", global.downButton[1]);
        ini_write_real("controller", "jump", global.jumpButton[1]);
        ini_write_real("controller", "shoot", global.shootButton[1]);
        ini_write_real("controller", "restart", global.restartButton[1]);
        ini_write_real("controller", "skip", global.skipButton[1]);
        ini_write_real("controller", "suicide", global.suicideButton[1]);
        ini_write_real("controller", "pause", global.pauseButton[1]);
        ini_write_real("controller", "align-left", global.alignLeftButton[1]);
        ini_write_real("controller", "align-right", global.alignRightButton[1]);
    }
    
    ini_close();
}

function game_load_config() {
    ini_open("config.ini");
    
    // settings
    global.muteMusic = ini_read_real("settings", "mute-music", false);
    global.volumeLevel = clamp(floor(ini_read_real("settings", "volume-level", 100)), 0, 100);
    audio_master_gain(global.volumeLevel / 100);
    
    global.fullscreenMode = ini_read_real("settings", "fullscreen-mode", false);
    window_set_fullscreen(global.fullscreenMode);
    
    global.smoothingMode = ini_read_real("settings", "smoothing-mode", false);
    
    global.vsyncMode = ini_read_real("settings", "vsync-mode", false);
    if (global.vsyncMode) {
        // set vsync
        game_set_vsync();
    }
    
    // keyboard controls
    global.leftButton[0] = ini_read_real("controls", "left", vk_left);
    global.rightButton[0] = ini_read_real("controls", "right", vk_right);
    global.upButton[0] = ini_read_real("controls", "up", vk_up);
    global.downButton[0] = ini_read_real("controls", "down", vk_down);
    global.jumpButton[0] = ini_read_real("controls", "jump", vk_shift);
    global.shootButton[0] = ini_read_real("controls", "shoot", 90); // Z
    global.restartButton[0] = ini_read_real("controls", "restart", 82); // R
    global.skipButton[0] = ini_read_real("controls", "skip", 83); // S
    global.suicideButton[0] = ini_read_real("controls", "suicide", 81); // Q
    global.pauseButton[0] = ini_read_real("controls", "pause", 80); // P
    global.alignLeftButton[0] = ini_read_real("controls", "align-left", 65); // A
    global.alignRightButton[0] = ini_read_real("controls", "align-right", 68); // D
    
    // menu keys
    global.menuLeftButton[0] = vk_left;
    global.menuRightButton[0] = vk_right;
    global.menuUpButton[0] = vk_up;
    global.menuDownButton[0] = vk_down;
    global.menuAcceptButton[0] = vk_shift;
    global.menuBackButton[0] = 90; // Z
    global.menuOptionsButton[0] = vk_enter;
    
    if (global.controllerEnabled) {
        // controller options
        global.controllerIndex = ini_read_real("controller", "index", -1);
        global.leftButton[1] = ini_read_real("controller", "left", gp_padl);
        global.rightButton[1] = ini_read_real("controller", "right", gp_padr);
        global.upButton[1] = ini_read_real("controller", "up", gp_padu);
        global.downButton[1] = ini_read_real("controller", "down", gp_padd);
        global.jumpButton[1] = ini_read_real("controller", "jump", gp_face1);
        global.shootButton[1] = ini_read_real("controller", "shoot", gp_face3);
        global.restartButton[1] = ini_read_real("controller", "restart", gp_face4);
        global.skipButton[1] = ini_read_real("controller", "skip", gp_face2);
        global.suicideButton[1] = ini_read_real("controller", "suicide", gp_select);
        global.pauseButton[1] = ini_read_real("controller", "pause", gp_start);
        global.alignLeftButton[1] = ini_read_real("controller", "align-left", gp_shoulderl);
        global.alignRightButton[1] = ini_read_real("controller", "align-right", gp_shoulderr);
    }
    
    // menu buttons
    global.menuLeftButton[1] = gp_padl;
    global.menuRightButton[1] = gp_padr;
    global.menuUpButton[1] = gp_padu;
    global.menuDownButton[1] = gp_padd;
    global.menuAcceptButton[1] = gp_face1;
    global.menuBackButton[1] = gp_face2;
    global.menuOptionsButton[1] = gp_select;
    
    ini_close();
    
    game_save_config();
}

function game_saves(savePosition) {
    // save game
    // savePosition: boolean - save player's position?
    
    if (savePosition) {
        global.saveRoom = room_get_name(room);
        with (objPlayer) {
            global.savePlayerX = x;
            global.savePlayerY = y;
        }
        global.saveGrav = global.grav;
        
        array_copy(global.saveSecretItem, 0, global.secretItem, 0, global.secretItemTotal);
        array_copy(global.saveBossItem, 0, global.bossItem, 0, global.bossItemTotal);
        
        global.saveGameClear = global.gameClear;
    }
    
    var saveJso = {};
    saveJso.death = global.death;
    saveJso.time = global.time;
    saveJso.timeMicro = global.timeMicro;
    saveJso.difficulty = global.difficulty;
    saveJso.saveRoom = global.saveRoom;
    saveJso.savePlayerX = global.savePlayerX;
    saveJso.savePlayerY = global.savePlayerY;
    saveJso.saveGrav = global.saveGrav;
    
    saveJso.saveSecretItem = [];
    saveJso.saveBossItem = [];
    array_copy(saveJso.saveSecretItem, 0, global.saveSecretItem, 0, global.secretItemTotal);
    array_copy(saveJso.saveBossItem, 0, global.saveBossItem, 0, global.bossItemTotal);
    
    saveJso.saveGameClear = global.saveGameClear;
    
    saveJso.jsoMd5 = md5_string_unicode(json_stringify(saveJso) + global.md5StrAdd);
    
    // todo: save securely
    var f = file_text_open_write(@"Data\save-" + string(global.savenum));
    file_text_write_string(f, base64_encode(json_stringify(saveJso)));
    file_text_close(f);
}

function game_loads(loadFile) {
    // load game
    // loadFile: boolean - load from file?
    
    if (loadFile) {
        var saveJso;
        
        var f = file_text_open_read(@"Data\save-" + string(global.savenum));
        var saveValid = true;
        try {
            saveJso = json_parse(base64_decode(file_text_read_string(f)));
        
            global.death = saveJso.death;
            global.time = saveJso.time;
            global.timeMicro = saveJso.timeMicro;
            global.difficulty = saveJso.difficulty;
            global.saveRoom = saveJso.saveRoom;
            global.savePlayerX = saveJso.savePlayerX;
            global.savePlayerY = saveJso.savePlayerY;
            global.saveGrav = saveJso.saveGrav;
            
            if (is_string(global.saveRoom)) {
                if (!room_exists(asset_get_index(global.saveRoom))) {
                    // room does not exist
                    
                    saveValid = false;
                }
            } else {
                saveValid = false;
            }
            
            array_copy(global.saveSecretItem, 0, saveJso.saveSecretItem, 0, global.secretItemTotal);
            array_copy(global.saveBossItem, 0, saveJso.saveBossItem, 0, global.bossItemTotal);
            
            global.saveGameClear = saveJso.saveGameClear;
            
            var jsoMd5 = saveJso.jsoMd5;
            
            // check md5
            if (!is_string(jsoMd5)) {
                jsoMd5 = "";
            }
            
            variable_struct_remove(saveJso, "jsoMd5");
            var genMd5 = md5_string_unicode(json_stringify(saveJso) + global.md5StrAdd);
            
            if (jsoMd5 != genMd5) {
                saveValid = false;
            }
        } catch (e) {
            saveValid = false;
        } finally {
            file_text_close(f);
        }
        
        if (!saveValid) {
            // save is invalid
            
            show_message("Save invalid!");
            game_restarts();
            return;
        }
    }
    
    instance_destroy(objPlayer);
    
    global.gameStarted = true;
    global.noPause = false;
    global.autosave = false;
    
    global.grav = global.saveGrav;
    
    array_copy(global.secretItem, 0, global.saveSecretItem, 0, global.secretItemTotal);
    array_copy(global.bossItem, 0, global.saveBossItem, 0, global.bossItemTotal);
    
    global.gameClear = global.saveGameClear;
    
    instance_create_layer(global.savePlayerX, global.savePlayerY, "player", objPlayer);
    
    room_goto(asset_get_index(global.saveRoom));
}

function game_restarts() {
    // restart game
    if (surface_exists(global.pauseSurf)) {
        surface_free(global.pauseSurf);
    }
    game_restart();
}

function game_set_caption() {
    var caption = global.texts.gameName;
    
    if (global.gameStarted) {
        caption += " - " + global.texts.deaths + ": " + string(global.death) + " " + global.texts.time + ": ";
        
        var t = floor(global.time);
        caption += time_stringify(t);
    }
    
    if (caption != global.windowCaptionLast) {
        // caption changed
        
        window_set_caption(caption);
    }
    
    global.windowCaptionLast = caption;
}

function game_set_vsync() {
    // enable vsync
    
    global.windowXPrev = window_get_x();
    global.windowYPrev = window_get_y();
    global.windowWidthPrev = window_get_width();
    global.windowHeightPrev = window_get_height();
    
    display_reset(0, global.vsyncMode);
    
    with (objWorld) {
        alarm[1] = 1;
    }
}

function game_set_camera() {
    // set camera
    
    with (objPlayer) {
        if (global.roomCameraMode == CameraMode.SNAPPED) {
            var xFollow = x;
            var yFollow = y;
        
            var viewWidth = camera_get_view_width(view_camera[0]);
            var viewHeight = camera_get_view_height(view_camera[0]);
            camera_set_view_pos(view_camera[0], floor(xFollow / viewWidth) * viewWidth, floor(yFollow / viewHeight) * viewHeight);
        } else if (global.roomCameraMode == CameraMode.SMOOTH) {
            global.roomCameraX += (x - global.roomCameraX) / 4;
            global.roomCameraY += (y - global.roomCameraY) / 4;
            var viewWidth = camera_get_view_width(view_camera[0]);
            var viewHeight = camera_get_view_height(view_camera[0]);
            camera_set_view_pos(view_camera[0], median(0, global.roomCameraX - viewWidth / 2, room_width - viewWidth), median(0, global.roomCameraY - viewHeight / 2, room_height - viewHeight));
        }
    }
}

function game_reset_window_size() {
    window_set_size(global.windowWidth, global.windowHeight);
}