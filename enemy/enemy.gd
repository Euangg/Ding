class_name Enemy
extends CharacterBody2D
@export var hp:Vector2=Vector2(100,100)

signal dead

func add_hp(demo:float,flesh:float):
	hp+=Vector2(demo,flesh)
	if min(hp.x,hp.y)<=0:
		dead.emit()
		queue_free()
