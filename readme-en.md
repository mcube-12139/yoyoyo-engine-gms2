# YoYoYo Engine GMS2
An "I Wanna" engine for GameMaker Studio 2.3.x.
## Latest Stable Version
null
## Latest Version
1.0.1
## Version 1.0.0
**This version is not available**  
Original version.  
Almost a full replica of the YoYoYo Engine for GameMaker: Studio.
### Traits
* Fixed the bug that Kid can touch the water when a block and a water overlap.
* No way to realize bow delaying.
* No way to do secure saving previously implemented by `ds_map_secure_save`.
* Other same as original YoYoYo Engine.
### Notes
* It should be ensured that all rooms have instance layer `world`.
* It should be ensured that all level rooms have instance layer `player`.
* It is recommended to place instances on a proper layer in the room. Generally,
    * The Kid's start point should be on `player` layer.
    * Waters should be on `above_player` layer.
    * Triggers should be on `trigger` layer.
    * Block tiles should be on `tile` layer.
    * Background tiles should be on `tile_background` layer.
    * Other instances should be on `below_player` layer.

    These layers are sort from shallow to deep to: `world` > `above_player` > `player` > `below_player` > `tile` > `trigger` > `tile_background`.
* It is unnecessary to put `objPlayMusic`,  `objCamera` or `objSmoothCamera` in rooms. Instead, set room properties in `scrOther` - `room_get_property` function.
    * Add new `case` segment to add new rooms.
    * Assign to `cameraMode` to set the camera mode of the room. Its value should be one of the enumeration values of `CameraMode`.
        * `NONE` means no processing.
        * `SNAPPED` means that the room is snapped.
        * `SMOOTH` means that the camera follows Kid smoothly.
* The value of `global.deathMusicMode` should be one of the enumeration values of `DeathMusicMode`.
    * `NONE` means death music is not played.
    * `PAUSE` means pausing current music when playing death music.
    * `FADE` means fading out current music when playing death music.
* Other same as original YoYoYo Engine.
### Change List
* Add sprite: `sprMegaManBack`, `sprStarsBack`, which represents Mega Man and star background. They were `bMegaman` and `bStars` in the original version. This change is made because there is no background resource type in GameMaker Studio 2.
* Add sprite: `sprAllTiles`. It was `bAllTiles` in the original version. It is in the `tile set` folder.
* Delete sprite: `sprCamera`, `sprPlayMusic`. This change is made because `objCamera`, `objSmoothCamera`, and `objPlayMusic` is useless in this version.
* Move sprite: `sprPlayerStart`. Now it's in the `player` folder.
* Move sprite: `sprGameOver`. Now it's in the `world` folder.
* Delete sprite: `sprPlayerKiller`, because it's useless.
* Delete sprite: `sprPlayerMaskFlip`, because it's useless in new gravity flipping system.
* Modify sprite: `sprPlayerSliding`, because the wall jumping system has changed. Now it's mirrored.
* Rename sprite: `sprBlockMask`. Now it's named `sprBlock`.
* Rename sprite: `sprMiniBlockMask`. Now it's named `sprMiniBlock`.
* Rename sprite: `sprSlipBlockMask`. Now it's named `sprSlipblock`.
* Move sprite: `sprKillerBlock`. Now it's in the `killer` folder.
* Delete sprite: `sprBlock`, `sprBlock2`.
* Add sprite: `sprBossBlock`, `sprFakeBlock`, `sprHiddenBlock`, `sprRiseBlock`, and `sprFallBlock`, representing boss blocks, fake blocks, hidden blocks, rising blocks and falling blocks. They are in the `block` folder.
* Delete sprite: `sprPlatform`, because it's rarely used.
* Modify sprite: `sprMovingPlatform`. Now it's named `sprPlatform`, in the `block` folder.
* Delete sprite folder: `slopes` and all its child resources, because they are rarely used.
* Rename sprite: `sprCherryWhite`. Now it's named `sprWhiteCherry`.
* Add sprite: `sprRefreshWater`, representing waters that refreshes Kid's double jump chance. It's in the `misc` folder.
* Rename sprite: `sprWalljumpR`. Now it's named `sprVineRight`.
* Rename sprite: `sprWalljumpL`. Now it's named `sprVineLeft`.
* Add sprite: `sprTree`, representing the tree. It's in the `misc` folder.
* Rename sprite: `sprTriggerMask`. Now it's named `sprTrigger`.
* Rename sprite: `sprButton`. Now it's named `sprButtonLeft`.
* Add sprite: `sprButtonDown`, `sprButtonRight`, and `sprButtonUp`, representing down, right, and left buttons. They are in the `trigger` folder.
* Delete sprite: `sprSpikeTriggerDown`, `sprSpikeTriggerLeft`, `sprSpikeTriggerRight`, and `sprSpikeTriggerUp`, because they are useless.
* Add sprite: `sprMoveTrigger`, representing the dynamic trigger killer. It's in the `trigger` folder.
* Delete sprite: `sprSaveMask`, because its function can be replaced by setting save point sprites' collision mask to the full image.
* Modify sprite: `sprSaveMedium`, `sprSave`, `sprSaveVHard`, `sprSaveMediumFlip`, `sprSaveFlip`, and `sprSaveVHardFlip`. Now their collision masks are the full image, and `sprSaveVHard` is renamed to `sprSaveVeryHard`, `sprSaveVHardFlip` is renamed to `sprSaveVeryHardFlip`.
* Rename sound: `sndDJump`. Now it's named `sndDoubleJump`.
* Rename sound: `sndDeath`. Now it's named `sndDie`.
* Backgrounds no longer exist.
* All script resources are converted to functions and seperated in several scripts.
    | New Script | Function | Old Script |
    | ---- | ---- | ---- |
    | `scrPlayer` | `player_jump` | `scrPlayerJump` |
    | `scrPlayer` | `player_release_jump` | `scrPlayerVJump` |
    | `scrPlayer` | `player_shoot` | `scrPlayerShoot` |
    | `scrPlayer` | `player_die` | `scrKillPlayer` |
    | `scrPlayer` | `player_flip` | `scrFlipGrav` |
    | `scrInitializing`**(changed into `scrGame` in new versions)** | Executed Immediately **(changed into `game_init` in new versions)** | `scrInitializeGlobals` |
    | `scrInitializing`**(changed into `scrGame` in new versions)** | Executed Immediately **(changed into `game_init` in new versions)** | `scrSetGlobalOptions` |
    | `scrGame` | `game_save_config` | `scrSaveConfig` |
    | `scrGame` | `game_load_config` | `scrLoadConfig` |
    | `scrGame` | `game_saves` | `scrSaveGame` |
    | `scrGame` | `game_loads` | `scrLoadGame` |
    | `scrGame` | `game_set_caption` | `scrSetRoomCaption` |
    | `scrGame` | `game_restarts` | `scrRestartGame` |
    | `scrGame` | `game_set_vsync` | `scrSetVsync` |
    | `scrGame` | `game_reset_window_size` | `scrResetWindowSize` |
    | `scrControl` | `control_get_key_name` | `scrGetKeyBind` |
    | `scrControl` | `control_get_controller_button_name` | `scrGetControllerBind` |
    | `scrControl` | `control_get_controller_button` | `scrAnyControllerButton` |
    | `scrControl` | `control_check` | `scrButtonCheck` |
    | `scrControl` | `control_check_pressed` | `scrButtonCheckPressed` |
    | `scrControl` | `control_check_released` | `scrButtonCheckReleased` |
    | `scrMusic` | `music_toggle` | `scrToggleMusic` |
    | `scrMusic` | `music_play` | `scrPlayMusic` |
    | `scrMusic` | `music_stop` | `scrStopMusic` |
    | `scrOther` | `draw_button_info` | `scrDrawButtonInfo` |
    | `scrOther` | `draw_text_outline` | `scrDrawTextOutline` |
    | `scrOther` | `make_shapes` | `scrMakeShapes` |
    | `scrOther` | `make_circle` | `scrMakeCircle` |
* Add enumeration: `MenuMode`, `DeathMusicMode`, `Difficulty`, and `CameraMode`, representing menu mode, death music mode, difficulty mode, and camera mode. They are in script `scrInitializing`.**(Enumeration `Difficulty` is replaced by macros in new versions.)**
* Modify function: `scrPlayerJump`, because platforms are no longer blocks. Now it checks collision with blocks and platforms to decide whether single jump is enabled.
* The parameters of function `scrPlayerShoot` were modified, because the wall jumping process changed. Now its parameter `mirror` indicates whether to shoot to the opposite direction.
* The body of function `scrFlipGrav` was modified. Now it no longer performs `scrSetPlayerMask`, and the flip adjustment value of `y` changes from `4` to `3`, and it flips `image_yscale` value.
* Delete script: `scrSetPlayerMask`, because it's useless in new processing.
* Modify function: `scrSaveGame`. Now it:
    * Saves Kid's actual position without "flooring" them.
    * Doesn't handle the case where Kid is stuck in blocks, because it's impossible.
    * Uses structures and `json_stringify` instead of `ds_map` and `json_encode` to save data.
    * Doesn't use `ds_map_secure_save` to save data.
* Delete script: `scrGetMusic`. Now room music and camera mode should be set by modifying function `room_get_property`.
* Add function: `room_get_property`, used to set room music and camera mode. It's in script `scrOther`.
* Rename font: `fDefault30`, `fDefault24`, `fDefault18`, and `fDefault12`. Now they are named `fArialBold_30`, `fArialBold_24`, `fArialBold_18`, and `fArialBold_12`.
* Modify object: `objWorld`. Now it changes music and camera position.
* Delete object: `objCamera`, `objSmoothCamera`, and `objPlayMusic`. Now their functions are implemented by `objWorld`.
* Move object: `objGameOver`. Now it's in the `world` folder.
* Modify object: `objPlayer`.
    * The variable `jump2` is renamed to `airJump`.
    * The variable `djump` is renamed to `doubleJump`.
    * The variable `maxVspeed` is renamed to `maxFallSpeed`.
    * The variable `xScale` is deleted.
    * It uses `image_xscale` and `image_yscale` directly stored its xscale and yscale. When Kid is facing the left, `image_xscale` is `-1`, and when it is facing the right, `image_yscale` is `-1`.
    * Object `objBow` is no longer created because it has been deleted. Now Kid draws a bow in the Draw Event to show it.
    * It has no Destroy Event, because no bows need to be destroyed.
    * It doesn't process collision with slopes because they are deleted.
    * After shooting, it makes all instances of `objBullet` happen User Event 0 of `objBullet`. That event processes collision with save points and buttons. This change is made to ensure that bullets and save points' collision happens before Kid's collision event with blocks does, and prevent Kid being stucked in blocks.
    * It processes collision with gravity arrows and waters in Step Event.
    * In Draw Event, it draws a possible bow.
* Delete object: `objBow`, because it's useless in new display of bows.
* Modify object: `objBullet`. Now it handles collision with save points and buttons in User Event 0. This event is triggered by a program in `objPlayer` - `Step`.
* Modify object: `objBlockInvis`. Now it's named `objHiddenBlock`, and its sprite is `sprHiddenBlock`.
* Modify object: `objBlockFake`. Now it's named `objFakeBlock`, and its sprite is `sprFakeBlock`.
* Modify object: `objBossBlock`. Now its sprite is `sprBossBlock`.
* Modify object: `objMovingPlatform`, `objMovingPlatformNoBounce`, `objBlockRise`, and `objBlockFall`. Now their names are `objPlatform`, `objPlatformNoBounce`, `objRiseBlock`, and `objFallBlock`. They are in the `block` folder.
* The object folder `slopes` and all its child resources are deleted because they are rarely used.
* Delete object: `objPlatform`, because it's useless. Now `objMovingPlatform` has no parent object.
* Rename object: `objCherryBounceRandom`. Now it's named `objBounceRandomSpeedCherry`.
* Delete object: `objCherryBounceLat`, and `objCherryBounceVert`, because they are not used.
* Modify object: `objCherryEnemyTest`. Now it's named `objCherryBoss`, in the `killer/boss/cherry` folder.
* Delete object: `objCherryEnemyTest`, because it's not used.
* Add object: `objButtonDown`, `objButtonRight`, `objButtonUp`, representing down, right, and up buttons. The parent of `objButtonRight` and `objButtonUp` is `objButtonDown`.
* Modify object: `objTriggerButton`. Now it's named `objButtonLeft`, and its parent is `objButtonDown`, and it has no events.
* Modify object: `objKillerTrigger`. Now its name is `objMoveTrigger`, and its sprite is `sprMoveTrigger`. Its moving mode can be only set with horizontal and vertical speed.
* Delete object: `objSpikeTriggerUp`, `objSpikeTriggerRight`, `objSpikeTriggerLeft`, `objSpikeTriggerDown`, and `objCherryTrigger`, because their functions can be samely implemented by `objKillerTrigger`.
* Delete object: `objWater`, because it's rarely used.
* Modify object: `objWater2`. Now it's named `objWater`, and it has no Collision Event. Its function is taken over by a program in `objPlayer` - `Step` to fix a bug.
* Modify object: `objWater3`. Now it's named `objRefreshWater`, and it has no Collision Event. Its function is taken over by a program in `objPlayer` - `Step` to fix a bug.
* Rename object: `objWalljumpR`. Now it's named `objVineRight`.
* Rename object: `objWalljumpL`. Now it's named `objVineLeft`.
* Modify object: `objGravityUp`, and `objGravityDown`. Now they have no events. Their functions are taken over by a program in `objPlayer` - `Step` to fix a bug.
* Modify object: `objSave`. Now it has no Collision Events with `objPlayer` or `objBullet`, because these functions are taken over by `objBullet`.
* Rename object: `objSaveVHard`, and `objSaveVHardFlip`. Now they are named `objSaveVeryHard` and `objSaveVeryHardFlip`.
* Modify object: `objRoomChanger`.
    * Add variable `warpPosition`. Boolean, which represents whether to teleport by position. The original `warpX == 0 && warpY == 0` judgement are replaced.
* Rename object: `objOutsideRoomChanger`. Now it's named`objBorderWarp`.
* Delete object: `objSecretIndicator`, and`objBossIndicator`, because they are not used.
* Delete room: `rSampleRoom` and `rTest`.
* Add tile set: `tsAllTiles`, representing all block tiles. Autotiling is switched on.
* Without affecting semantics, the form of some code is modified. For example, `array_copy` is used to replace loop statements to copy arrays, and `?:` operator is used to replace short `if..else` statements for selection.
* Other unimportant changes.
## Version 1.0.1
**This version may be unstable**  
Fixed some bugs.
### Traits
* Fixed the bug of unable to set infinitely jumping and debug infinitely jumping.
* Fixed the bug that the difficulty of warp difficulty selecting cannot work normally.
* Fixed the bug that the game cannot returns to title screen properly.
* Fixed the bug that Kid will get stuck in blocks when it's against them and turns back.
* Fixed the bug that bullets are not destroyed when touching platforms.
* Bow delaying is realized.
### Change List
* Modify script: `scrPlayer`.
    * In function `player_jump`, infinitely jumping and debug infinitely jumping checking codes are added.
    * Add function `player_mirror` to realize Kid turning back.
* Modify script: `scrInitializing`. Macros `MEDIUM`, `HARD`, `VERY_HARD`, and `IMPOSSIBLE` are used to replace enumeration `Difficulty`. And corresponding modifications are made at all places it's used: `objSave*`, `objPlayer`, `objWarpStart`'s instances, `objWarpAutosaveNext`, and `objDifficultyMenu`.
* Modify script: `scrInitializing`, `scrGame`. The immediately executed code in the former is moved to function `game_init` in the latter.
* Modify object: `objWorld`. Add code to the Game Start Event to execute function `game_init`.
* Modify object: `objPlayer`.
    * Add code to the Draw Event to realize bow delaying.
    * Modify code in Step Event. Use function `player_mirror` instead of assigning to `image_xscale` directly to realize it turning back.
* Modify object: `objBullet`. Add Collision Event with `objPlatform` and action to destroy itself.