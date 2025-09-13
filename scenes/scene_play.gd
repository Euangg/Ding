extends Node2D


var failed:bool=false

signal fail_over

@onready var player_view: Player = $PlayerView
@onready var player_sing: Player = $PlayerSing
@onready var camera: Camera2D = $Camera2D
@onready var canvas_modulate: CanvasModulate = $CanvasModulate
@onready var node_for_scare: CanvasLayer = $NodeForScare
@onready var ui_fail: Control = $CanvasLayer/UiFail

func _ready() -> void:
	Global.player_view=player_view
	Global.player_sing=player_sing
	Global.players=[player_view,player_sing]
	fail_over.connect(show_fail_ui)

func _physics_process(delta: float) -> void:
	camera.position=(player_view.position+player_sing.position)/2
	
	if Input.is_action_just_pressed("ui_accept"):
		var e=Global.enemies.pick_random().instantiate()
		add_child(e)
		
	if player_view.dead && player_sing.dead:
		if failed:pass
		else:
			failed=true
			#canvas_modulate.visible=false
			player_view.timer_respawn.stop()
			player_view.timer_respawn.stop()
			var ui=Global.UI_JUMP_SCARE.instantiate()
			ui.enemy_id=Global.last_kill_enemy_id
			node_for_scare.add_child(ui)

func _exit_tree() -> void:
	Global.player_view=null
	Global.player_sing=null
	Global.players.clear()

func show_fail_ui():
	print("show_fail_ui")
	ui_fail.visible=true
