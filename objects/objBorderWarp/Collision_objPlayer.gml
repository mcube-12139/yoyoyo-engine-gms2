if (other.x < 0 || other.x > room_width || other.y < 0 || other.y > room_height) {
    if (!smoothTransition) {
        event_inherited();
    } else {
        if (other.x < 0) {
            other.x += room_width;
        }
        if (other.x > room_width) {
            other.x -= room_width;
        }
        if (other.y < 0) {
            other.y += room_height;
        }
        if (other.y > room_height) {
            other.y -= room_height;
        }
        
        room_goto(roomTo);
    }
}