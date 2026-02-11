extends Player

enum State{
	NULL,
	STAND,
	WALK,
	ATTACK
}
var state:State=State.NULL

func _physics_process(delta: float) -> void:
	var vector_input=Input.get_vector("a","d","w","s")
	if(Input.is_action_just_pressed("v")):%HitBox.rotation-=PI/4
	if(Input.is_action_just_pressed("b")):%HitBox.rotation+=PI/4
	#if vector_input.is_zero_approx():pass
	#else:%HitBox.rotation=vector_input.angle()
	
	#1/3.状态判断
	var next_state=state
	match state:
		State.NULL:next_state=State.STAND
		State.STAND:
			if vector_input.is_zero_approx():pass
			else:next_state=State.WALK
			if Input.is_action_just_pressed("space"):next_state=State.ATTACK
		State.WALK:
			if vector_input.is_zero_approx():next_state=State.STAND
			if Input.is_action_just_pressed("space"):next_state=State.ATTACK
		State.ATTACK:
			if Input.is_action_just_released("space"):next_state=State.STAND
	#2/3.状态切换
	if next_state==state:pass
	else:
		match state:
			State.ATTACK:
				%HitBox.monitoring=false
				%CPUParticles2D.emitting=false
				%AnimationPlayerAtkWalk.stop()
		match next_state:
			State.STAND:
				%AnimationPlayer.play("idle")
				%SfxWalk.stop()
			State.WALK:
				%AnimationPlayer.play("walk")
				%SfxWalk.play()
			State.ATTACK:
				%AnimationPlayer.play("atk")
				%SfxWalk.stop()
				%HitBox.monitoring=true
				%CPUParticles2D.emitting=true
				%AnimationPlayerAtkWalk.play("walk")
		state=next_state
	#3/3.状态运行
	match state:
		State.STAND:
			velocity=vector_input.normalized()*speed
		State.WALK:
			velocity=vector_input.normalized()*speed
		State.ATTACK:
			if vector_input.is_zero_approx():%AnimationPlayerAtkWalk.pause()
			else:%AnimationPlayerAtkWalk.play()
			velocity=vector_input.normalized()*speed

			if %HitBox.monitoring:
				var arr_enemy:Array[Area2D]=%HitBox.get_overlapping_areas()
				for a in arr_enemy:
					var e:Enemy= a.get_parent()
					e.add_hp(-400*delta,delta)
	
	move_and_slide()

func _on_sfx_walk_finished() -> void:%SfxWalk.play()
