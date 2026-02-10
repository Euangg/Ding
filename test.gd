extends Node2D


const ENEMY_BAT = preload("uid://gmnrfjnd6wf6")

func _ready() -> void:
	Global.node_ammo=self
	%PlayerLens.node_ammo=self
	Global.node_players=%NodePlayers
	%EnemyGodAngry.target_position=%Marker2D.position


func _on_timer_timeout() -> void:
	#var b:Enemy=ENEMY_BAT.instantiate()
	#b.position=get_viewport_rect().size/2+Vector2.from_angle(randf_range(-3.14,3.14))*1000
	#b.target=player_lens
	#add_child(b)
	pass
