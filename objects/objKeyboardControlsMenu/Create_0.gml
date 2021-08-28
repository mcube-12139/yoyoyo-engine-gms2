select = 0;
xSelector = 120;
ySelector = 48;
xSeperation = 560;
ySeperation = 40;

settingKey = false;
resetPrompt = false;

strSelect = [
    global.texts.leftButton,
    global.texts.rightButton,
    global.texts.upButton,
    global.texts.downButton,
    global.texts.jumpButton,
    global.texts.shootButton,
    global.texts.restartButton,
    global.texts.skipButton,
    global.texts.suicideButton,
    global.texts.pauseButton,
    global.texts.resetControls
];

strKey = [
    control_get_key_name(global.leftButton[0]),
    control_get_key_name(global.rightButton[0]),
    control_get_key_name(global.upButton[0]),
    control_get_key_name(global.downButton[0]),
    control_get_key_name(global.jumpButton[0]),
    control_get_key_name(global.shootButton[0]),
    control_get_key_name(global.restartButton[0]),
    control_get_key_name(global.skipButton[0]),
    control_get_key_name(global.suicideButton[0]),
    control_get_key_name(global.pauseButton[0]),
    "",
];

playerIndex = 0;