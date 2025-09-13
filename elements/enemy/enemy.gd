class_name Enemy
extends CharacterBody2D
@export var id:Global.EnemyId=0

var hp:float=100
var target:Node2D

func _ready() -> void:
	if Global.players.is_empty():pass
	else:target=Global.players.pick_random()

func _physics_process(delta: float) -> void:
	if target:
		velocity=(target.global_position-global_position).normalized()*80
		
	move_and_slide()
