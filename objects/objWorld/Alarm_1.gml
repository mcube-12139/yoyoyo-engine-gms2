/// @desc window position & size returning

if (!window_get_fullscreen()) {
    window_set_position(global.windowXPrev, global.windowYPrev);
    window_set_size(global.windowWidthPrev, global.windowHeightPrev);
}
