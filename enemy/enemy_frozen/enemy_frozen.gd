class_name EnemyFrozen
extends Enemy


var target:Player=null
var awaken:bool=false

func _ready() -> void:
	modulate=Color(0,0,0,0)

func _physics_process(delta: float) -> void:
	if awaken:
		if target:
			velocity=(target.position-position).normalized()*400
		move_and_slide()
		
		#碰撞伤害
		var hit_areas:Array[Area2D]=%HurtBox.get_overlapping_areas()
		for a in hit_areas:
			var p:Player=a.get_parent()
			p.try_get_damage(5)

func awake():
	awaken=true
	%HurtBox.monitorable=true
	%HurtBox.monitoring=true

func _on_range_awake_body_entered(body: Node2D) -> void:
	if target:pass
	else: 
		target=body
		%AnimationPlayer.play("awake")
