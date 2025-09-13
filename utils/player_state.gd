extends CanvasLayer

@onready var bar_1_e: TextureProgressBar = $TextureProgressBarEased
@onready var bar_1_c: TextureProgressBar = $TextureProgressBar
@onready var bar_2_e: TextureProgressBar = $TextureProgressBarEased2
@onready var bar_2_c: TextureProgressBar = $TextureProgressBar2
	

func _process(delta: float) -> void:
	bar_1_c.value=Global.player_view.hp
	if bar_1_e.value==bar_1_c.value:pass
	else:bar_1_e.value=move_toward(bar_1_e.value,bar_1_c.value,100*delta)
	
	bar_2_c.value=Global.player_sing.hp
	if bar_2_e.value==bar_2_c.value:pass
	else:bar_2_e.value=move_toward(bar_2_e.value,bar_2_c.value,100*delta)
