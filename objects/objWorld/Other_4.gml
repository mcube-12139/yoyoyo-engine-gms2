/// @desc set music & caption & view

room_get_property();
game_set_caption();
if (global.roomCameraMode == CameraMode.SNAPPED) {
    game_set_camera();
} else {
    with (objPlayer) {
        global.roomCameraX = x;
        global.roomCameraY = y;
    }
    var viewWidth = camera_get_view_width(view_camera[0]);
    var viewHeight = camera_get_view_height(view_camera[0]);
    camera_set_view_pos(view_camera[0], median(0, global.roomCameraX - viewWidth / 2, room_width - viewWidth), median(0, global.roomCameraY - viewHeight / 2, room_height - viewHeight));
}
autotile_update();