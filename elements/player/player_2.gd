extends Player

func control(delta:float):
	var vector_direction=Vector2.from_angle(rotation)
	var vector_input=Input.get_vector("a","d","w","s")
	velocity=100*vector_input.normalized()
	if velocity.is_zero_approx():animation_player.play("idle")
	else:
		animation_player.play("walk")
		var diff=vector_direction.angle_to(vector_input)
		if is_zero_approx(diff):pass
		else:
			var amountTickRotate=sign(diff)*min(abs(diff),30*delta)
			rotate(amountTickRotate)
	move_and_slide()
