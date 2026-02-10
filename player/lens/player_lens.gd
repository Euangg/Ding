extends Player

enum State{
	NULL,
	STAND,
	WALK
}
var state:State=State.NULL

const AMMO = preload("uid://bm4gfjv3q1451")

var node_ammo:Node2D

func _ready() -> void:
	%TimerFire.timeout.connect(func():%Fire.visible=false)

func calculate_rotation_angle(B: Vector2, C: Vector2, A: Vector2, D: Vector2) -> float:
	var BC = C - B
	var BA = A - B
	var BD = D - B
	var theta = atan2(
		(BD.x*(BA.y - BC.y) - BD.y*(BA.x - BC.x)),
		(BD.x*(BA.x - BC.x) + BD.y*(BA.y - BC.y))
	) - atan2(BA.y - BC.y, BA.x - BC.x)
	return wrapf(theta,-PI, PI)
func _physics_process(delta: float) -> void:
	var vector_input=Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	var vector_mouse=get_global_mouse_position()
	var dir=vector_mouse-position
	if is_zero_approx(dir.x):pass
	else: %Graphic.scale.x=sign(dir.x)
	
	var angle=calculate_rotation_angle(%Gun.global_position,%MarkerAim.global_position,%MarkerFire.global_position,get_global_mouse_position())
	if %Graphic.scale.x>0:%Gun.rotation=-angle-0.02
	else :%Gun.rotation=PI+angle-0.02
	
	if Input.is_action_just_pressed("mouse_left"):
		if %TimerShootCd.is_stopped():
			%TimerShootCd.start()
			%Fire.visible=true
			%TimerFire.start()
			Global.play_sfx(Global.SFX_SHOOT)
			if node_ammo:
				var ammo:Node2D=AMMO.instantiate()
				ammo.position=%MarkerFire.global_position
				ammo.velocity=(vector_mouse-%MarkerFire.global_position).normalized()*3000
				ammo.rotation=ammo.velocity.angle()
				node_ammo.add_child(ammo)
	
	#1/3.状态判断
	var next_state=state
	match state:
		State.NULL:next_state=State.STAND
		State.STAND:
			if vector_input.is_zero_approx():pass
			else:next_state=State.WALK
		State.WALK:
			if vector_input.is_zero_approx():next_state=State.STAND
	#2/3.状态切换
	if next_state==state:pass
	else:
		match next_state:
			State.STAND:
				%AnimationPlayer.play("idle")
				%SfxWalk.stop()
			State.WALK:
				%AnimationPlayer.play("walk")
				%SfxWalk.play()
		state=next_state
	#3/3.状态运行
	match state:
		State.STAND:pass
		State.WALK:pass
	
	velocity=vector_input.normalized()*speed
	move_and_slide()


func _on_sfx_walk_finished() -> void:%SfxWalk.play()
