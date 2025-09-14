extends CanvasLayer

@onready var bar_1_e: TextureProgressBar = $TextureProgressBarEased
@onready var bar_1_c: TextureProgressBar = $TextureProgressBar
@onready var bar_2_e: TextureProgressBar = $TextureProgressBarEased2
@onready var bar_2_c: TextureProgressBar = $TextureProgressBar2
@onready var head_pic: Sprite2D = $HeadPic
@onready var head_pic_2: Sprite2D = $HeadPic2

func _process(delta: float) -> void:
	bar_1_c.value=Global.player_view.hp
	if bar_1_e.value==bar_1_c.value:pass
	else:bar_1_e.value=move_toward(bar_1_e.value,bar_1_c.value,100*delta)
	if Global.player_view.dead:head_pic.region_rect=Rect2(30,938,346,417)
	else:
		if Global.player_view.is_atk:head_pic.region_rect=Rect2(30,485,346,417)
		else:head_pic.region_rect=Rect2(30,26,346,417)
	
	bar_2_c.value=Global.player_sing.hp
	if bar_2_e.value==bar_2_c.value:pass
	else:bar_2_e.value=move_toward(bar_2_e.value,bar_2_c.value,100*delta)
	if Global.player_sing.dead:head_pic_2.region_rect=Rect2(422,942,345,417)
	else:
		if Global.player_sing.is_atk:head_pic_2.region_rect=Rect2(422,489,345,417)
		else:head_pic_2.region_rect=Rect2(422,30,345,417)
