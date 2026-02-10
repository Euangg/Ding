class_name Player
extends CharacterBody2D

var hp:float=100
var restore:float=5

var is_atk:bool=false
var is_dead:bool=false

signal dead;

var speed:float=300

@onready var timer_invincible: Timer = $TimerInvincible
@onready var graphic: Node2D = $Graphic

func try_get_damage(v:float):
	if hp<=0:return
	if timer_invincible.is_stopped():
		hp-=v
		if hp>0:
			timer_invincible.start()
			graphic.modulate.a=0.5
			Global.play_sfx(Global.SFX_HUMAN_HURT)
		else:
			is_dead=true
			dead.emit()

func _on_timer_invincible_timeout() -> void:
	graphic.modulate.a=1


func turn_on_light():%PointLight2D.visible=true
func turn_off_light():%PointLight2D.visible=false
