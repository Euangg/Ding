extends Control

@onready var label: Label = $Label
func _ready() -> void:
	label.text="关卡"+str(Global.next_level)

func _on_timer_timeout() -> void:Global.switch_scene(Global.UI_PLAY)
