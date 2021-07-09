if (!warpPosition) {
    instance_destroy(other);
} else {
    with (other) {
        x = other.warpX;
        y = other.warpY;
    }
}

room_goto(roomTo);