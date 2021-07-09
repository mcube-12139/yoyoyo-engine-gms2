# GMS2的YoYoYo引擎
这是一个用于GameMaker Studio 2.3.x的"I Wanna"引擎。  
## 最新稳定版本
无
## 最新版本
1.0.0
## 版本1.0.0
**此版本可能不稳定**  
最初版本。  
几乎是用于GameMaker: Studio的那个YoYoYo引擎的完全复制品。
### 版本特性
* 修正了砖、水重叠时，kid贴砖碰水的bug。
* 没有办法实现蝴蝶结延迟。
* 没有办法进行原先由`ds_map_secure_save`实现的安全存档。
* 其他同原版YoYoYo引擎。
### 使用注意
* 应该保证所有房间有实例层`world`。
* 应该保证所有关卡房间有实例层`player`。
* 建议在房间中合适的图层上摆放实例。通常：
    * kid开始点应该在`player`层上。
    * 水应该在`above_player`上。
    * 机关应该在`trigger`上。
    * 图块应该在`tile`上。
    * 图块背景应该在`tile_background`上。
    * 其他实例应该在`below_player`上。
    
    这些层由浅到深排序为：`world` > `above_player` > `player` > `below_player` > `tile` > `trigger` > `tile_background`。
* 不需要摆放`objPlayMusic`, `objCamera` 和 `objSmoothCamera`。在`scrOther` - `room_get_property`函数中设置房间的属性。
    * 增加新的`case`段来增加新的房间。
    * 对`cameraMode`赋值来决定房间的相机模式。它的值应该是`CameraMode`的枚举值之一。
        * `NONE`表示不做处理。
        * `SNAPPED`表示分面跟随kid。
        * `SMOOTH`表示平滑跟随kid。
* `global.deathMusicMode`的值应该是`DeathMusicMode`的枚举值之一。
    * `NONE`表示不播放死亡音乐。
    * `PAUSE`表示播放死亡音乐并暂停当前音乐。
    * `FADE`表示播放死亡音乐并淡出当前音乐。
* 其他改变见修改清单。
* 其他同原版YoYoYo引擎。
### 修改清单
* 增加了精灵：`sprMegaManBack`, `sprStarsBack`，分别代表洛克人背景和星星背景，对应原版的背景`bMegaman`和`bStars`，因为GameMaker Studio 2没有背景资源类型。它们在`background`文件夹中。
* 增加了精灵：`sprAllTiles`，代表所有砖图块，对应原版的背景`bAllTiles`，因为GameMaker Studio 2没有背景资源类型。它们在`tile set`文件夹中。
* 删除了精灵：`sprCamera`, `sprPlayMusic`，因为物体`objCamera`, `objSmoothCamera`, `objPlayMusic`已经被删除。
* 移动了精灵：`sprPlayerStart`。现在它在`player`文件夹中。
* 移动了精灵：`sprGameOver`。现在它在`world`文件夹中。
* 删除了精灵：`sprPlayerKiller`，因为它是无用的。
* 删除了精灵：`sprPlayerMaskFlip`，因为新的重力翻转处理方式不需要它。
* 修改了精灵：`sprPlayerSliding`，因为爬墙处理方式改变了。现在它是镜像翻转的。
* 重命名了精灵：`sprBlockMask`。现在它的名称是`sprBlock`。
* 重命名了精灵：`sprMiniBlockMask`。现在它的名称是`sprMiniBlock`。
* 重命名了精灵：`sprSlipBlockMask`。现在它的名称是`sprSlipBlock`。
* 移动了精灵：`sprKillerBlock`。现在它在`killer`文件夹中。
* 删除了精灵：`sprBlock`, `sprBlock2`。
* 增加了精灵：`sprBossBlock`, `sprFakeBlock`, `sprHiddenBlock`, `sprRiseBlock`, `sprFallBlock`，分别代表BOSS砖、假砖、隐藏砖、升砖、降砖。它们在`block`文件夹中。
* 删除了精灵：`sprPlatform`，因为它很少被使用。
* 修改了精灵：`sprMovingPlatform`。现在它的名称是`sprPlatform`，在`block`文件夹中。
* 删除了精灵文件夹`slopes`和其所有子资源，因为它们很少被使用。
* 重命名了精灵：`sprCherryWhite`。现在它的名称是`sprWhiteCherry`。
* 增加了精灵：`sprRefreshWater`，代表二段水。它在`misc`文件夹中。
* 重命名了精灵：`sprWalljumpR`。现在它的名称是`sprVineRight`。
* 重命名了精灵：`sprWalljumpL`。现在它的名称是`sprVineLeft`。
* 增加了精灵：`sprTree`，代表树。它在`misc`文件夹中。
* 重命名了精灵：`sprTriggerMask`。现在它的名称是`sprTrigger`。
* 重命名了精灵：`sprButton`。现在它的名称是`sprButtonLeft`。
* 增加了精灵：`sprButtonDown`, `sprButtonRight`, `sprButtonUp`，分别代表向下、向右、向左的按钮。它们在`trigger`文件夹中。
* 删除了精灵：`sprSpikeTriggerDown`, `sprSpikeTriggerLeft`, `sprSpikeTriggerRight`, `sprSpikeTriggerUp`，因为新的机关设计方式不需要它们。
* 增加了精灵：`sprMoveTrigger`，代表移动的机关。它在`trigger`文件夹中。
* 删除了精灵：`sprSaveMask`，因为它的功能可以被存档点精灵代替。
* 修改了精灵：`sprSaveMedium`, `sprSave`, `sprSaveVHard`, `sprSaveMediumFlip`, `sprSaveFlip`, `sprSaveVHardFlip`。现在它们的碰撞区是整个图像，并且`sprSaveVHard`被重命名为`sprSaveVeryHard`，`sprSaveVHardFlip`被重命名为`sprSaveVeryHardFlip`。
* 重命名了声音`sndDJump`。现在它的名称是`sndDoubleJump`。
* 重命名了声音`sndDeath`。现在它的名称是`sndDie`。
* 没有背景资源。
* 所有脚本资源被转换成函数并分开在几个脚本中。
    | 新脚本 | 函数 | 旧脚本 |
    | ---- | ---- | ---- |
    | `scrPlayer` | `player_jump` | `scrPlayerJump` |
    | `scrPlayer` | `player_release_jump` | `scrPlayerVJump` |
    | `scrPlayer` | `player_shoot` | `scrPlayerShoot` |
    | `scrPlayer` | `player_die` | `scrKillPlayer` |
    | `scrPlayer` | `player_flip` | `scrFlipGrav` |
    | `scrInitializing` | 立即执行 | `scrInitializeGlobals` |
    | `scrInitializing` | 立即执行 | `scrSetGlobalOptions` |
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
* 增加了枚举`MenuMode`, `DeathMusicMode`, `Difficulty`, `CameraMode`，分别代表菜单模式、死亡音乐模式、难度模式、相机模式。它们在脚本`scrInitializing`中。
* 修改了函数`scrPlayerJump`的函数体，因为板子不再是砖的实例了。现在它分别检查是否与砖和板子碰撞，来决定能否一段跳。
* 修改了函数`scrPlayerShoot`的参数，因为爬墙处理方式改变了。现在它的参数`mirror`表示是否朝反方向射击。
* 修改了函数`scrFlipGrav`的函数体。现在它不再执行`scrSetPlayerMask`，`y`坐标的翻转调整值从`4`变成`3`，并且翻转`image_yscale`的值。
* 删除了脚本`scrSetPlayerMask`，因为新的处理方式不需要它。
* 修改了函数`scrSaveGame`。现在它：
    * 保存kid的实际位置而不floor它们。
    * 不对存档位置卡砖的情况进行处理，因为这不可能发生。
    * 使用结构体和`json_stringify`，而非`ds_map`和`json_encode`保存数据。
    * 不使用`ds_map_secure_save`保存数据。
* 删除了脚本`scrGetMusic`。现在对房间音乐和相机模式进行设置，应该修改函数`room_get_property`。
* 增加了函数`room_get_property`，用来设置房间音乐和相机模式。它在脚本`scrOther`中。
* 重命名了字体：`fDefault30`, `fDefault24`, `fDefault18`, `fDefault12`。现在它们的名称分别是`fArialBold_30`, `fArialBold_24`, `fArialBold_18`, `fArialBold_12`。
* 修改了物体：`objWorld`。现在它实现改变音乐和改变摄像机位置的功能。
* 删除了物体：`objCamera`, `objSmoothCamera`, `objPlayMusic`。现在它们的功能由`objWorld`实现。
* 移动了物体：`objGameOver`。现在它在`world`文件夹中。
* 修改了物体：`objPlayer`。
    * 变量`jump2`被重命名为`airJump`。
    * 变量`djump`被重命名为`doubleJump`。
    * 变量`maxVspeed`被重命名为`maxFallSpeed`。
    * 变量`xScale`被删除。
    * 直接使用`image_xscale`和`image_yscale`存储其水平和竖直拉伸比例。当kid面向左边时，`image_xscale`的值是`-1`；当kid的重力翻转时，`image_yscale`的值是`-1`。
    * 不再创建物体`objBow`，因为它已经被删除。现在kid在绘制事件中绘制蝴蝶结以显示它。
    * 没有摧毁事件，因为没有蝴蝶结需要被摧毁。
    * 没有与斜面砖的碰撞处理程序，因为斜面砖已经被删除。
    * 进行射击处理后，使`objBullet`所有实例发生`objBullet`的0号用户事件。这个事件中处理子弹与存档点、按钮的碰撞。这是为了确保子弹与存档点的碰撞在kid与砖的碰撞之前发生，防止卡砖死档。
    * 增加了与重力翻转箭头和水的碰撞处理程序。
    * 与`objPlayerKiller`的碰撞处理被转移到步结束事件中。
    * 绘制事件中，不在绘制自身时进行`y`坐标修正，因为GameMaker Studio 2没有这个bug。
    * 绘制事件中，绘制可能存在的蝴蝶结。
* 删除了物体：`objBow`，因为蝴蝶结的新显示方式不需要它。
* 修改了物体：`objBullet`。现在它在0号用户事件中处理与存档点和按钮的碰撞。这个事件由`objPlayer`-`Step`中的一段程序触发。
* 修改了物体：`objBlockInvis`。现在它的名称是`objHiddenBlock`，精灵是`sprHiddenBlock`。
* 修改了物体：`objBlockFake`。现在它的名称是`objFakeBlock`，精灵是`sprFakeBlock`。
* 修改了物体：`objBossBlock`。现在它的精灵是`sprBossBlock`。
* 修改了物体：`objMovingPlatform`, `objMovingPlatformNoBounce`, `objBlockRise`, `objBlockFall`。现在它们的名称分别是`objPlatform`, `objPlatformNoBounce`, `objRiseBlock`, `objFallBlock`，在`block`文件夹中。
* 删除了物体文件夹`slopes`及其所有子资源，因为它们很少被使用。
* 删除了物体：`objPlatform`，因为它是无用的。现在`objMovingPlatform`没有父物体。
* 重命名了物体：`objCherryBounceRandom`。现在它的名称是`objBounceRandomSpeedCherry`。
* 删除了物体：`objCherryBounceLat`, `objCherryBounceVert`。因为它们没有被使用。
* 修改了物体：`objCherryEnemyTest`。现在它的名称是`objCherryBoss`，在`killer/boss/cherry`文件夹中。
* 删除了物体：`objCherryEnemyTest`，因为它没有被使用。
* 增加了物体：`objButtonDown`, `objButtonRight`, `objButtonUp`，分别代表朝下、朝右、朝上的按钮。`objButtonDown`实现了`objTriggerButton`的功能，`objButtonRight`和`objButtonUp`的父物体是`objButtonDown`。
* 修改了物体：`objTriggerButton`。现在它的名称是`objButtonLeft`，父物体是`objButtonDown`，没有事件。
* 修改了物体：`objKillerTrigger`。现在它的名称是`objMoveTrigger`，精灵是`sprMoveTrigger`，只能用水平和竖直速度设置其实例的启动方式，不能用速度和方向设置。
* 删除了物体：`objSpikeTriggerUp`, `objSpikeTriggerRight`, `objSpikeTriggerLeft`, `objSpikeTriggerDown`, `objCherryTrigger`，因为它们的功能可以同样地被`objKillerTrigger`实现。
* 删除了物体：`objWater`，因为它很少被使用。
* 修改了物体：`objWater2`。现在它的名称是`objWater`，没有碰撞事件。它的功能由`objPlayer`-`Step`中的一段程序代替实现，以修复某个bug。
* 修改了物体：`objWater3`。现在它的名称是`objRefreshWater`，没有碰撞事件。它的功能由`objPlayer`-`Step`中的一段程序代替实现，以修复某个bug。
* 重命名了物体：`objWalljumpR`。现在它的名称是`objVineRight`。
* 重命名了物体：`objWalljumpL`。现在它的名称是`objVineLeft`。
* 修改了物体：`objGravityUp`和`objGravityDown`。现在它们没有事件。它们的功能由`objPlayer`-`Step`中的一段程序代替实现，以修复某个bug。
* 修改了物体：`objSave`。现在它没有与`objPlayer`和`objBullet`的碰撞事件，因为这些功能已经被`objBullet`代替实现。
* 重命名了物体：`objSaveVHard`和`objSaveVHardFlip`。现在它们的名称是`objSaveVeryHard`和`objSaveVeryHardFlip`。
* 修改了物体：`objRoomChanger`。
    * 增加了变量`warpPosition`。布尔型，代表是否按坐标进行转移。原先的`warpX == 0 && warpY == 0`判断方式已经被代替。
* 重命名了物体：`objOutsideRoomChanger`。现在它的名称是`objBorderWarp`。
* 删除了物体：`objSecretIndicator`和`objBossIndicator`，因为它们没有被使用。
* 删除了房间`rSampleRoom`和`rTest`。
* 增加了图块集：`tsAllTiles`，代表所有砖图块。它是启动了自动贴图的。
* 在不影响语义的前提下，修改了某些代码的写法。如使用`array_copy`代替循环语句来复制数组，使用`?:`运算符代替短小的`if..else`语句进行选择等。
* 在所有绘制事件动作执行后恢复默认绘制参数，即：黑色，完全不透明，文字左、上对齐等。
* 其他无关紧要的修改。