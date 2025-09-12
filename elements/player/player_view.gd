extends Player

var enemies_under_light:Array
var damage:float=10

@onready var sprite: Sprite2D = $Sprite2D
@onready var area_view: Area2D = $AreaView
@onready var collision_shape: CollisionPolygon2D = $AreaView/CollisionShape2D	

func control(delta:float):
	collision_shape.rotation=(get_global_mouse_position()-global_position).angle()
	queue_redraw()
	var vector_input=Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity=100*vector_input.normalized()
	if velocity.is_zero_approx():animation_player.play("idle")
	else:animation_player.play("walk")
	move_and_slide()
	
	for e:Enemy in enemies_under_light:
		e.hp-=damage*delta
		if e.hp<=0:e.queue_free()

func _on_area_view_body_entered(body: Node2D) -> void:
	var e:Enemy=body
	enemies_under_light.push_back(e)


func _on_area_view_body_exited(body: Node2D) -> void:
	var e:Enemy=body
	enemies_under_light.erase(e)
