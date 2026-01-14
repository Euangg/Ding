class_name Boss
extends Enemy

enum State{
	NULL,
	IDLE,
	MOVE,
	ATTACK
}
var current_state:State=State.NULL
var battle_mode=false

var target_position:Vector2
var target:Node2D=null
var target_dir:float=0

func _physics_process(delta: float) -> void:
	if battle_mode:
		#1/3.状态判断
		var next_state=current_state
		match current_state:
			State.NULL:next_state=State.IDLE
			State.IDLE:
				if %TimerIdle.is_stopped():
					next_state=State.MOVE
			State.MOVE:
				if %TimerMove.is_stopped():next_state=State.ATTACK
				if position.distance_to(target_position)<=10:next_state=State.ATTACK
			State.ATTACK:
				if %TimerAttack.is_stopped():next_state=State.IDLE
		#2/3.状态切换
		if next_state==current_state:pass
		else:
			match current_state:
				pass
			match next_state:
				State.IDLE:
					velocity=Vector2.ZERO
					%TimerIdle.start()
				State.MOVE:
					target=Global.node_players.get_children().pick_random()
					target_dir=randf_range(0,TAU)
					%TimerMove.start()
				State.ATTACK:
					velocity=(target.position-position).normalized()*600
					%TimerAttack.start()
		current_state=next_state
		#3/3.状态运行
		match current_state:
			State.MOVE:
				target_position=target.position+700*Vector2.from_angle(target_dir)
				velocity=(target_position-position).normalized()*300
				move_and_slide()
			State.ATTACK:
				move_and_slide()
	else:
		velocity=(target_position-position).normalized()*100
		move_and_slide()
		if position.distance_to(target_position)<=5:
			print("battle!")
			battle_mode=true
			%HurtBox.monitorable=true
	
	var hit_areas:Array[Area2D]=%HurtBox.get_overlapping_areas()
	for a in hit_areas:
		var p:Player=a.get_parent()
		p.try_get_damage(25)

func _on_area_2d_body_entered(body: Node2D) -> void:
	target=body


func _on_dead() -> void:Global.switch_scene(Global.SCENE_PASS)
