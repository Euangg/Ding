extends Enemy

var target:Node2D=null

func _physics_process(delta: float) -> void:
	velocity=Vector2.ZERO
	if target:
		velocity=(target.position-position).normalized()*200
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	target=body
