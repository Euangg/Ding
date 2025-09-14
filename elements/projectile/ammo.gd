extends Node2D

var velocity:Vector2

func _draw() -> void:
	draw_circle(position,10,Color.DARK_OLIVE_GREEN)

func _physics_process(delta: float) -> void:
	position+=velocity*delta

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		var p:Player=body
		p.hp-=20
		if p.hp<=0:Global.last_kill_enemy_id=Global.EnemyId.WORM
	queue_free()
