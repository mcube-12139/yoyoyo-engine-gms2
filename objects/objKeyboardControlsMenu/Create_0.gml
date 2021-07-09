select = 0;
xSelector = 120;
ySelector = 48;
xSeperation = 560;
ySeperation = 40;

settingKey = false;
resetPrompt = false;

strSelect = [
    "Left Button",
    "Right Button",
    "Up Button",
    "Down Button",
    "Jump Button",
    "Shoot Button",
    "Restart Button",
    "Skip Button",
    "Suicide Button",
    "Pause Button",
    "Reset Controls"
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