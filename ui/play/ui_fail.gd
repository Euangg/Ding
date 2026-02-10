extends Control

func _ready() -> void:
	hide()
	visibility_changed.connect(
		func ():get_tree().paused=visible
	)

func _on_button_pressed() -> void:
	hide()
	Global.switch_scene(Global.UI_PLAY)

func _on_button_2_pressed() -> void:
	hide()
	Global.switch_scene(Global.UI_THEME)
