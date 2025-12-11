extends Node2D


var velocity:Vector2

func _physics_process(delta: float) -> void:
	position+=velocity*delta

func _on_area_2d_area_entered(area: Area2D) -> void:
	var e:Enemy=area.get_parent()
	e.add_hp(50,-50)
	queue_free()

func _on_timer_timeout() -> void:
	queue_free()
