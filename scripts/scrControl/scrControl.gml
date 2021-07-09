function control_get_controller_button() {
    // get pressed controller button
    
    var list = [
        gp_face1,
        gp_face2,
        gp_face3,
        gp_face4,
        gp_padu,
        gp_padd,
        gp_padl,
        gp_padr,
        gp_stickr,
        gp_stickl,
        gp_select,
        gp_start,
        gp_shoulderr,
        gp_shoulderrb,
        gp_shoulderl,
        gp_shoulderlb
    ];
    
    for (var i = 0, sz = array_length(list); i != sz; ++i) {
        var button = list[i];
        if (gamepad_button_check_pressed(global.controllerIndex, button)) {
            return button;
        }
    }
    
    return -1;
}

function control_check(buttonArray) {
    // get the button is held?
    // buttonArray: [real, real] - the button
    
    if (!global.controllerMode) {
        return keyboard_check(buttonArray[0]);
    }
    
    return gamepad_button_check(global.controllerIndex, buttonArray[1]);
}

function control_check_pressed(buttonArray) {
    // get the button is pressed?
    // buttonArray: [real, real] - the button
    
    if (!global.controllerMode) {
        return keyboard_check_pressed(buttonArray[0]);
    }
    
    return gamepad_button_check_pressed(global.controllerIndex, buttonArray[1]);
}

function control_check_released(buttonArray) {
    // get the button is released?
    // buttonArray: [real, real] - the button
    
    if (!global.controllerMode) {
        return keyboard_check_released(buttonArray[0]);
    }
    
    return gamepad_button_check_released(global.controllerIndex, buttonArray[1]);
}

function control_get_key_name(key) {
    // get key name
    
    switch (key) {
    // functional keys
    case vk_space:
        return "Space";
    case vk_shift:
        return "Shift";
    case vk_control:
        return "Control";
    case vk_alt:
        return "Alt";
    case vk_enter:
        return "Enter";
    case vk_up:
        return "Up";
    case vk_down:
        return "Down";
    case vk_left:
        return "Left";
    case vk_right:
        return "Right";
    case vk_backspace:
        return "Backspace";
    case vk_tab:
        return "Tab";
    case vk_insert:
        return "Insert";
    case vk_delete:
        return "Delete";
    case vk_pageup:
        return "Page Up";
    case vk_pagedown:
        return "Page Down";
    case vk_home:
        return "Home";
    case vk_end:
        return "End";
    case vk_escape:
        return "Escape";
    case vk_printscreen:
        return "Print Screen";
    case vk_f1:
        return "F1";
    case vk_f2:
        return "F2";
    case vk_f3:
        return "F3";
    case vk_f4:
        return "F4";
    case vk_f5:
        return "F5";
    case vk_f6:
        return "F6";
    case vk_f7:
        return "F7";
    case vk_f8:
        return "F8";
    case vk_f9:
        return "F9";
    case vk_f10:
        return "F10";
    case vk_f11:
        return "F11";
    case vk_f12:
        return "F12";
    case vk_lshift:
        return "Left Shift";
    case vk_rshift:
        return "Right Shift";
    case vk_lcontrol:
        return "Left Control";
    case vk_rcontrol:
        return "Right Control";
    case vk_lalt:
        return "Left Alt";
    case vk_ralt:
        return "Right Alt";
    // numpad keys
    case vk_numpad0:
        return "Numpad 0";
    case vk_numpad1:
        return "Numpad 1";
    case vk_numpad2:
        return "Numpad 2";
    case vk_numpad3:
        return "Numpad 3";
    case vk_numpad4:
        return "Numpad 4";
    case vk_numpad5:
        return "Numpad 5";
    case vk_numpad6:
        return "Numpad 6";
    case vk_numpad7:
        return "Numpad 7";
    case vk_numpad8:
        return "Numpad 8";
    case vk_numpad9:
        return "Numpad 9";
    case vk_multiply:
        return "Numpad *";
    case vk_add:
        return "Numpad +";
    case vk_subtract:
        return "Numpad -";
    case vk_decimal:
        return "Numpad .";
    case vk_divide:
        return "Numpad /";
    // misc keys
    case 186:
        return ";";
    case 187:
        return "=";
    case 188:
        return ",";
    case 189:
        return "-";
    case 190:
        return ".";
    case 191:
        return "/";
    case 192:
        return "`";
    case 219:
        return "[";
    case 220:
        return "\\";
    case 221:
        return "]";
    case 222:
        return "'";
    }
    
    // character
    return chr(key);
}

function control_get_controller_button_name(buttonIndex) {
    // get controller button name
    
    switch (buttonIndex) {
    case gp_face1:
        return "A/Cross";
    case gp_face2:
        return "B/Circle";
    case gp_face3:
        return "X/Square";
    case gp_face4:
        return "Y/Triangle";
    case gp_shoulderl:
        return "Left Bumper";
    case gp_shoulderlb:
        return "Left Trigger";
    case gp_shoulderr:
        return "Right Bumper";
    case gp_shoulderrb:
        return "Right Trigger";
    case gp_select:
        return "Select/Touch-Pad";
    case gp_start:
        return "Start/Options";
    case gp_stickl:
        return "Left Stick (pressed)";
    case gp_stickr:
        return "Right Stick (pressed)";
    case gp_padu:
        return "D-Pad Up";
    case gp_padd:
        return "D-Pad Down";
    case gp_padl:
        return "D-Pad Left";
    case gp_padr:
        return "D-Pad Right";
    }
    
    return "Unknown";
}