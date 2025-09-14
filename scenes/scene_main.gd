extends Control

func _ready() -> void:
	Global.play_music(Global.MUSIC_THEME)

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/scene_play.tscn")


func _on_button_2_pressed() -> void:
	get_tree().quit()


func _on_button_3_pressed() -> void:
	pass # Replace with function body.
