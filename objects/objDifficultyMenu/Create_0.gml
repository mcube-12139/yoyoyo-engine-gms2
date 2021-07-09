/// @desc initialize menu variables

difSelect = false;
select = global.menuSelectPrev[0];
select_2 = 0;
xSeperation = 239;
str[0] = "Save 1";
str[1] = "Save 2";
str[2] = "Save 3";
warnText = false;
warnSelect = true;

appleIndex = 0;
playerIndex = 0;

// load data
boss = [];
for (var i = 0; i != 3; ++i) {
    boss[i] = array_create(global.bossItemTotal, false);
    if (file_exists(@"Data\save-" + string(i))) {
        // data exist
        
        // todo: load securely
        var f = file_text_open_read(@"Data\save-" + string(i));
        var jso;
        try {
            jso = json_parse(base64_decode(file_text_read_string(f)));
            
            death[i] = jso.death;
            time[i] = jso.time;
            difficulty[i] = jso.difficulty;
            array_copy(boss[i], 0, jso.saveBossItem, 0, global.bossItemTotal);
            clear[i] = jso.saveGameClear;
            
            timeStr[i] = time_stringify(jso.time);
            
            exists[i] = true;
        } catch (e) {
            exists[i] = false;
        } finally {
            file_text_close(f);
        }
    } else {
        exists[i] = false;
    }
}