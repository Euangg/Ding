extends Level
const BOSS = preload("uid://oq88a2lh5glg")

var boss_spawned=false

func _ready() -> void:
	Global.play_music(Global.MUSIC_PLAY)

func _on_area_boss_body_entered(body: Node2D) -> void:
	if boss_spawned:return
	var e:EnemyGodAngry=BOSS.instantiate()
	e.position=%MarkerBossSpawn.position
	e.target_position=%MarkerBossTarget.position
	%NodeEnemy.call_deferred("add_child",e)
	boss_spawned=true
