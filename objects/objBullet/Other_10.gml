/// @desc step

// check save & button meeting
// ensure this order: player step - (bullet meet save & bullet meet button)
with (objSave) {
    if (place_meeting(x, y, other)) {
        event_user(0);
    }
}
with (objButtonDown) {
    if (place_meeting(x, y, other)) {
        event_user(0);
    }
}