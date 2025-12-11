extends Node2D

var start_position:Vector2
var velocity:Vector2

func _ready() -> void:
	%RayCast2D.position=start_position

func _physics_process(delta: float) -> void:
	if %RayCast2D.enabled:
		%RayCast2D.target_position+=velocity*delta
		var area:Area2D=%RayCast2D.get_collider()
		if area:
			var e:Enemy=area.get_parent()
			e.add_hp(50,-50)
			print(e.hp)
			%RayCast2D.enabled=false


func _on_timer_timeout() -> void:
	%RayCast2D.enabled=false
