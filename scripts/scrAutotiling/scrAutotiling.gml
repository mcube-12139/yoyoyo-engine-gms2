function autotile_add_pos(_x, _y) {
    var pos = string(_x) + " " + string(_y);
    if (!ds_map_exists(global.autotileMap, pos)) {
        global.autotileMap[? pos] = id;
    }
}

function autotile_block_exists(blockX, blockY, blockWidth, blockHeight) {
    var pos = string(blockX) + " " + string(blockY);
    if (ds_map_exists(global.autotileMap, pos)) {
        return true;
    }
    if (blockX <= -blockWidth || blockX >= room_width || blockY <= -blockHeight || blockY >= room_height) {
        return true;
    }
    
    return false;
}

function autotile_get_index(_x, _y, width, height) {
    if (global.autotileMode == AutotileMode.NONE) {
        return 0;
    }

    var u = autotile_block_exists(_x, _y - height, width, height);
    if (global.autotileMode == AutotileMode._2) {
        return u;
    }

    var r = autotile_block_exists(_x + width, _y, width, height);
    var d = autotile_block_exists(_x, _y + height, width, height);
    var l = autotile_block_exists(_x - width, _y, width, height);
    var ur = autotile_block_exists(_x + width, _y - height, width, height);
    var dr = autotile_block_exists(_x + width, _y + height, width, height);
    var dl = autotile_block_exists(_x - width, _y + height, width, height);
    var ul = autotile_block_exists(_x - width, _y - height, width, height);

    var index = global.autotileIndices[(u << 7) | (ur << 6) | (r << 5) | (dr << 4) | (d << 3) | (dl << 2) | (l << 1) | ul];
    if (global.autotileMode == AutotileMode._4) {
        return global.autotile4dIndices[index];
    }

    return index;
}

function autotile_update() {
    if (room != global.autotileLastRoom) {
        global.autotileLastRoom = room;
        
        if (global.autotileMode != 0) {
            ds_map_clear(global.autotileMap);
            with (all) {
                if (object_index == objAutotiledBlock) {
                    var singleX = x;
                    for (var i = 0; i != image_xscale; i++) {
                        var singleY = y;
                        for (var j = 0; j != image_yscale; j++) {
                            autotile_add_pos(singleX, singleY);
                            singleY += 32;
                        }
                        singleX += 32;
                    }
                } else if (object_index == objAutotiledFakeBlock) {
                    autotile_add_pos(x, y);
                }
            }
        }
    }
    
    with (all) {
        if (object_index == objAutotiledBlock) {
            indices = [];
            var singleX = x;
            for (var i = 0; i != image_xscale; i++) {
                indices[i] = [];
                var column = indices[i];
                var singleY = y;
                for (var j = 0; j != image_yscale; j++) {
                    column[@ j] = autotile_get_index(singleX, singleY, 32, 32);
                    singleY += 32;
                }
                singleX += 32;
            }
        } else if (object_index == objAutotiledFakeBlock) {
            image_index = autotile_get_index(x, y, 32, 32);
        } else if (object_index == objAutotiledHiddenBlock) {
            image_index = image_number - 1;
        }
    }
}