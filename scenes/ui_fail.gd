extends Control

func _ready() -> void:
	pass

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/scene_play.tscn")

func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/scene_main.tscn")
