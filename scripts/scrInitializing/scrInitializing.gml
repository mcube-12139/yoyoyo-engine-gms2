// enumerations

// menu modes
enum MenuMode {
    WARP_ROOM,
    MENU
}

// death music mode
enum DeathMusicMode {
    NONE,
    PAUSE,
    FADE
}

// autotile mode
enum AutotileMode {
    NONE,
    _2,
    _4,
    _47
}

// difficulties
// Cannot be replaced by a enumeration, because enumeration values are integers so a bug will occur when they are saved and loaded.
#macro MEDIUM 0
#macro HARD 1
#macro VERY_HARD 2
#macro IMPOSSIBLE 3

// camera modes
enum CameraMode {
    NONE,
    SNAPPED,
    SMOOTH
}