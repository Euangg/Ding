extends Node2D
@onready var player_view: CharacterBody2D = $PlayerView
@onready var player_sing: CharacterBody2D = $PlayerSing
@onready var camera: Camera2D = $Camera2D

func _ready() -> void:
	Global.player_view=player_view
	Global.player_sing=player_sing
	Global.players=[player_view,player_sing]

func _physics_process(delta: float) -> void:
	camera.position=(player_view.position+player_sing.position)/2
	
	if Input.is_action_just_pressed("ui_accept"):
		var e=Global.enemies.pick_random().instantiate()
		add_child(e)
		

func _exit_tree() -> void:
	Global.player_view=null
	Global.player_sing=null
	Global.players.clear()
