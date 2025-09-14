class_name Player
extends CharacterBody2D

var hp:float=100
var restore:float=5
var dead:bool=false

@export var speed:float=100

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var timer_invincible: Timer = $TimerInvincible
@onready var timer_respawn: Timer = $TimerRespawn
@onready var area_hurt: Area2D = $AreaHurt
@onready var sfx_run: AudioStreamPlayer2D = $SfxRun

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	control(delta)
	if dead:sfx_run.stop()
	else:
		if hp<100:hp+=restore*delta
		if sfx_run.playing:
			if velocity.is_zero_approx():sfx_run.stop()
		else:
			if velocity.is_zero_approx():pass
			else:sfx_run.play()

func control(delta:float):pass
func on_dead():pass
func on_respawn():pass

func _on_area_hurt_body_entered(body: Node2D) -> void:
	var e:Enemy=body
	hp-=e.atk
	if hp<=0:
		dead=true
		timer_respawn.start()
		area_hurt.set_deferred("monitoring",false)
		modulate.a=0.2
		on_dead()
		Global.last_kill_enemy_id=e.id
	else:
		timer_invincible.start()
		area_hurt.set_deferred("monitoring",false)
		modulate.a=0.5

func _on_timer_invincible_timeout() -> void:
	area_hurt.monitoring=true
	modulate.a=1

func _on_timer_respawn_timeout() -> void:
	dead=false
	hp=100
	timer_invincible.start()
	modulate.a=0.5
	on_respawn()
