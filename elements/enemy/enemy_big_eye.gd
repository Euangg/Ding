extends Enemy

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
