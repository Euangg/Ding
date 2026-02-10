class_name EnemyTeeth
extends Enemy

const AMMO = preload("uid://dufgry06r2tu0")

enum{
	IDLE,
	ATTACK
}

enum Stick{
	LEFT,RIGHT
}

@export var stick:Stick=Stick.LEFT

func _ready() -> void:
	if stick==Stick.RIGHT:%Graphic.scale.x=-1
	velocity.y=100

func _physics_process(delta: float) -> void:
	match stick:
		Stick.LEFT:velocity.x=-100
		Stick.RIGHT:velocity.x=100
	var need_turn=false
	if velocity.y>0:
		if %RayCastDown.is_colliding():pass
		else:need_turn=true
		if %RayCastBottom.is_colliding():need_turn=true
	else:
		if %RayCastUp.is_colliding():pass
		else:need_turn=true
		if %RayCastTop.is_colliding():need_turn=true
	if need_turn:velocity.y*=-1
	move_and_slide()
	
	#发射
	if %TimerAtkCd.is_stopped():
		var arr_target:Array=%AreaRange.get_overlapping_bodies()
		if arr_target.is_empty():pass
		else:
			var target:Node2D=arr_target.pick_random()
			if target:
				var a=AMMO.instantiate()
				a.position=position
				a.velocity=(target.position-position).normalized()*500
				a.rotation=a.velocity.angle()
				add_sibling(a)
				%TimerAtkCd.start()
	
	#碰撞伤害
	var hit_areas:Array[Area2D]=%HurtBox.get_overlapping_areas()
	for a in hit_areas:
		var p:Player=a.get_parent()
		p.try_get_damage(5)
