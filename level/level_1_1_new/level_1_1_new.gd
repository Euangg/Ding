extends Level

const ENEMY_BAT = preload("uid://gmnrfjnd6wf6")
const BOSS = preload("uid://cvplimo3ikauy")

var boss_spawned=false

func _ready() -> void:
	pass
	
func _physics_process(delta: float) -> void:
	pass

func _on_area_start_body_entered(body: Node2D) -> void:
	%TimerBat.start()

func _on_area_end_body_entered(body: Node2D) -> void:
	%TimerBat.stop()
	var enemies=%NodeEnemy.get_children()
	for e in enemies:e.queue_free()

func _on_area_boss_body_entered(body: Node2D) -> void:
	if boss_spawned:return
	var e:Boss=BOSS.instantiate()
	e.position=%MarkerBossSpawn.position
	e.target_position=%MarkerBossTarget.position
	%NodeEnemy.call_deferred("add_child",e)
	boss_spawned=true

func _on_timer_timeout() -> void:
	var e:EnemyBat=ENEMY_BAT.instantiate()
	e.position=Global.camera.position+1000*Vector2.from_angle(randf_range(-PI,PI))
	e.target=Global.node_players.get_children().pick_random()
	%NodeEnemy.add_child(e)
