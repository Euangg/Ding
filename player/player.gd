class_name Player
extends CharacterBody2D

var hp:float=100
var restore:float=5
signal dead
var is_atk:bool=false

var speed:float=300

func _on_area_hurt_body_entered(body: Node2D) -> void:
	var e:Enemy=body
	hp-=e.atk
	if hp<=0:
		dead.emit()
		%HurtBox.set_deferred("monitoring",false)
		modulate.a=0.2
		Global.last_kill_enemy_id=e.id
		Global.play_sfx(Global.SFX_HUMAN_DEAD)
	else:
		#timer_invincible.start()
		%HurtBox.set_deferred("monitoring",false)
		modulate.a=0.5
		Global.play_sfx(Global.SFX_HUMAN_HURT)

func _on_timer_invincible_timeout() -> void:
	%HurtBox.monitoring=true
	modulate.a=1
