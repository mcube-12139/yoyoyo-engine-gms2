select = global.menuSelectPrev[1];

xSelector = 124;
ySelector = 132;
xSeperation = 550;
ySeperation = 48;

optionsNum = 7;

if (!global.controllerEnabled) {
    --optionsNum;
    ySelector += 32;
}

strSelect = [
    global.texts.music,
    global.texts.volumeLevel,
    global.texts.screenMode,
    global.texts.smoothingMode,
    global.texts.vsync,
    global.texts.setKeyboardControls,
    global.texts.controllerOptions
];

playerIndex = 0;