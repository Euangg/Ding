extends Node2D
@onready var player_1: CharacterBody2D = $Player1
@onready var player_2: CharacterBody2D = $Player2
@onready var camera: Camera2D = $Camera2D

func _physics_process(delta: float) -> void:
	camera.position=(player_1.position+player_2.position)/2	
