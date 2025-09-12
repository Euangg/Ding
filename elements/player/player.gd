class_name Player
extends CharacterBody2D

var hp:float=100
var restore:float=5
var dead:bool=false

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var timer_invincible: Timer = $TimerInvincible
@onready var area_hurt: Area2D = $AreaHurt

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	if dead:pass
	else:
		control(delta)
		if hp<100:hp+=restore*delta

func control(delta:float):pass

func _on_area_hurt_body_entered(body: Node2D) -> void:
	hp-=50
	if hp<=0:dead=true
	timer_invincible.start()
	area_hurt.set_deferred("monitoring",false)
	modulate.a=0.5

func _on_timer_invincible_timeout() -> void:
	area_hurt.monitoring=true
	modulate.a=1
