class_name EnemyGodAngry
extends Enemy
const AMMO = preload("uid://dufgry06r2tu0")

enum State{
	NULL,
	IDLE,
	ATTACK
}
var state:State=State.NULL
var battle_mode=false

var target_position:Vector2
var target:Node2D=null
var target_dir:float=0

func _physics_process(delta: float) -> void:
	if battle_mode:
		#1/3.状态判断
		var next_state=state
		match state:
			State.NULL:next_state=State.IDLE
			State.IDLE:
				if %TimerIdle.is_stopped():next_state=State.ATTACK
			State.ATTACK:
				if %TimerAttack.is_stopped():next_state=State.IDLE
		#2/3.状态切换
		if next_state==state:pass
		else:
			match state:
				State.ATTACK:
					if target:
						var dir=(target.position-position).angle()
						for offset in [-0.5,0,0.5]:
							var a=AMMO.instantiate()
							a.position=position
							a.velocity=Vector2.from_angle(dir+offset).normalized()*600
							a.rotation=a.velocity.angle()
							add_sibling(a)
			match next_state:
				State.IDLE:
					velocity=Vector2.ZERO
					%TimerIdle.start()
				State.ATTACK:
					target=Global.node_players.get_children().pick_random()
					velocity=(target.position-position).normalized()*700
					%TimerAttack.start()
		state=next_state
		#3/3.状态运行
		match state:
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
		p.try_get_damage(10)

func _on_dead() -> void:Global.switch_scene(Global.UI_PASS)
