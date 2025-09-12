extends Player
@onready var sprite: Sprite2D = $Sprite2D

@onready var collision_shape: CollisionPolygon2D = $AreaView/CollisionShape2D

func _draw() -> void:
	draw_polygon(collision_shape.polygon,[Color.YELLOW])

func control(delta:float):
	rotation=(get_global_mouse_position()-global_position).angle()
	
	var vector_input=Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity=100*vector_input.normalized()
	if velocity.is_zero_approx():animation_player.play("idle")
	else:animation_player.play("walk")
	move_and_slide()
