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
    "Music",
    "Volume Level",
    "Screen Mode",
    "Smoothing Mode",
    "Vsync",
    "Set Keyboard Controls",
    "Controller Options"
];

playerIndex = 0;