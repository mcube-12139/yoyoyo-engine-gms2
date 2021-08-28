select = 0;
xSelector = 120;
ySelector = 24;
xSeperation = 560;
ySeperation = 40;

settingButton = false;
resetPrompt = false;

strSelect = [
    global.texts.controllerIndex,
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

strButton = [
    string(global.controllerIndex),
    control_get_controller_button_name(global.leftButton[1]),
    control_get_controller_button_name(global.rightButton[1]),
    control_get_controller_button_name(global.upButton[1]),
    control_get_controller_button_name(global.downButton[1]),
    control_get_controller_button_name(global.jumpButton[1]),
    control_get_controller_button_name(global.shootButton[1]),
    control_get_controller_button_name(global.restartButton[1]),
    control_get_controller_button_name(global.skipButton[1]),
    control_get_controller_button_name(global.suicideButton[1]),
    control_get_controller_button_name(global.pauseButton[1]),
    ""
];

if (global.controllerIndex == -1) {
    strButton[0] = "Disabled";
}

playerIndex = 0;