extends Control

func _ready() -> void:
	Global.play_music(Global.MUSIC_THEME)
	%ButtonSingle.pressed.connect(func():Global.switch_scene(Global.SCENE_SELECT_CHARACTER))
	%ButtonDouble.pressed.connect(func():
		Global.mode_player=2
		Global.switch_scene(Global.SCENE_PLAY))
	%ButtonSetting.pressed.connect(func():Global.switch_scene(Global.SCENE_SETTINGS))
	%ButtonStaff.pressed.connect(func():Global.switch_scene(Global.SCENE_STAFF))
	%ButtonQuit.pressed.connect(func():get_tree().quit())
