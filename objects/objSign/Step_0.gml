if (place_meeting(x, y, objPlayer)) {
    if (control_check_pressed(global.upButton)) {
        showText = true;
    }
} else {
    showText = false;
}