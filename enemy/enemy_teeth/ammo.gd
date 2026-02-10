extends Node2D


var velocity:Vector2

func _physics_process(delta: float) -> void:
	position+=velocity*delta


func _on_area_2d_body_entered(body: Player) -> void:
	body.try_get_damage(5)
	queue_free()

func _on_timer_timeout() -> void:
	queue_free()
