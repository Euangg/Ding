extends Control

func _on_button_bell_pressed() -> void:
	Global.mode_player=0
	Global.switch_scene(Global.UI_INTERLUDE)

func _on_button_lens_pressed() -> void:
	Global.mode_player=1
	Global.switch_scene(Global.UI_INTERLUDE)
