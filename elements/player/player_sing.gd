extends Player

var damage_correct:float=90
var damgae_error:float=50

@onready var area_damage: Area2D = $AreaDamage
@onready var timer_atk: Timer = $TimerAtk
func control(delta:float):
	var vector_direction=Vector2.from_angle(rotation)
	var vector_input=Input.get_vector("a","d","w","s")
	if dead:
		velocity=speed*2*vector_input.normalized()
		animation_player.play("RESET")
	else:
		velocity=speed*vector_input.normalized()
		if velocity.is_zero_approx():animation_player.play("idle")
		else:
			if timer_atk.is_stopped():animation_player.play("walk")
			#var diff=vector_direction.angle_to(vector_input)
			#if is_zero_approx(diff):pass
			#else:
				#var amountTickRotate=sign(diff)*min(abs(diff),30*delta)
				#rotate(amountTickRotate)
	
	move_and_slide()
	if dead:pass
	else:
		if area_damage.monitoring:area_damage.monitoring=false
		if Input.is_action_just_pressed("space"):
			area_damage.monitoring=true
			animation_player.play("atk")
			timer_atk.start()

func _on_area_damage_body_entered(body: Node2D) -> void:
	var e:Enemy=body
	e.hp-=damage_correct
	if e.hp<=0:e.queue_free()


func _on_timer_atk_timeout() -> void:
	if velocity.is_zero_approx():animation_player.play("idle")
	else :animation_player.play("walk")
