extends Player

func _physics_process(delta: float) -> void:
	var vector_input=Input.get_vector("a","d","w","s")
	if Input.is_action_just_pressed("space"):
		%HitBox.monitoring=true
		%CollisionShape2D.debug_color=Color(Color.RED,0.5)
		%CPUParticles2D.emitting=true
	if Input.is_action_just_released("space"):
		%HitBox.monitoring=false
		%CollisionShape2D.debug_color=0x0099b36b
		%CPUParticles2D.emitting=false
	if %HitBox.monitoring:
		var arr_enemy:Array[Area2D]=%HitBox.get_overlapping_areas()
		for a in arr_enemy:
			var e:Enemy= a.get_parent()
			e.add_hp(-400*delta,delta)
		
	if vector_input.is_zero_approx():pass
	else:%HitBox.rotation=vector_input.angle()
	
	if %HitBox.monitoring:velocity=Vector2.ZERO
	else:velocity=vector_input.normalized()*speed
	
	if velocity.is_zero_approx():%AnimationPlayer.play("idle")
	else:%AnimationPlayer.play("walk")
	
	move_and_slide()
