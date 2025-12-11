extends Node2D


const ENEMY_BAT = preload("uid://gmnrfjnd6wf6")
@onready var player_lens: CharacterBody2D = $PlayerLens


func _on_timer_timeout() -> void:
	var b:Enemy=ENEMY_BAT.instantiate()
	b.position=get_viewport_rect().size/2+Vector2.from_angle(randf_range(-3.14,3.14))*1000
	b.target=player_lens
	add_child(b)
