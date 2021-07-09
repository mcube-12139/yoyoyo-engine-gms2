/// @desc collision with bullet

if (canSave && global.grav == grav) {
    canSave = false;
    alarm[0] = 30;
    image_index = 1;
    image_speed = 0.017;
    game_saves(true);
}