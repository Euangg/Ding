extends Control

func _ready() -> void:
	Global.play_music(Global.MUSIC_THEME)
	%ButtonSingle.pressed.connect(func():
		start_game()
		Global.switch_scene(Global.UI_SELECT_CHARACTER))
	%ButtonDouble.pressed.connect(func():
		start_game()
		Global.mode_player=2
		Global.switch_scene(Global.UI_INTERLUDE))
	%ButtonSetting.pressed.connect(func():Global.switch_scene(Global.UI_SETTINGS))
	%ButtonStaff.pressed.connect(func():Global.switch_scene(Global.UI_STAFF))
	%ButtonQuit.pressed.connect(func():get_tree().quit())


func start_game():Global.next_level=1
