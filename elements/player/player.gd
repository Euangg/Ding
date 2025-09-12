class_name Player

extends CharacterBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	control(delta)

func control(delta:float):pass
