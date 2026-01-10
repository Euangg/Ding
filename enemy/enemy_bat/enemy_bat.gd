class_name EnemyBat
extends Enemy

var target:Node2D=null

func _physics_process(delta: float) -> void:
	velocity=Vector2.ZERO
	if target:
		velocity=(target.position-position).normalized()*200
	move_and_slide()
	var hit_areas:Array[Area2D]=%HurtBox.get_overlapping_areas()
	for a in hit_areas:
		var p:Player=a.get_parent()
		p.try_get_damage(5)

func _on_area_2d_body_entered(body: Node2D) -> void:
	target=body
