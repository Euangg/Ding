class_name Enemy
extends CharacterBody2D
@export var id:Global.EnemyId=0
@export var hp:float=100
@export var speed:float=100
@export var atk:float=50

var player_in_range:Array
var live_player_in_range:Array
var target:Player=null
@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _physics_process(delta: float) -> void:
	if target:pass
	else:
		live_player_in_range=player_in_range.filter(func(p:Player):return not p.dead)
		if live_player_in_range.is_empty():pass
		else:target=live_player_in_range.pick_random()
	
	if navigation_agent_2d.is_navigation_finished():velocity=Vector2.ZERO
	else:
		var direction=to_local(navigation_agent_2d.get_next_path_position()).normalized()
		velocity=direction*speed
		
	move_and_slide()


func _on_area_2d_range_body_entered(body: Node2D) -> void:
	player_in_range.push_back(body)

func _on_area_2d_range_body_exited(body: Node2D) -> void:
	player_in_range.erase(body)
	if target==body:target=null

func _on_timer_check_timeout() -> void:
	if target:
		if target.dead:
			target=null
			return
		navigation_agent_2d.target_position=target.position


func die()->void:
	animation_player.play("die")
