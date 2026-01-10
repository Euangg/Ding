class_name HudPlayerState
extends Control

const BELL_ATK = preload("uid://1ptasntuf1ch")
const BELL_DIE = preload("uid://dljihmvsihthj")
const BELL_IDLE = preload("uid://bw17ihgtcsxdi")
const LENS_ATK = preload("uid://ci863ja5ei585")
const LENS_DIE = preload("uid://dmskcndicj0c5")
const LENS_IDLE = preload("uid://dedlp87favxfu")


@onready var bell_bar_back: TextureProgressBar = $StateBell/BarBack
@onready var bell_bar: TextureProgressBar = $StateBell/BarBack/Bar
@onready var bell_head_pic: TextureRect = $StateBell/HeadPic
@onready var lens_bar_back: TextureProgressBar = $StateLens/BarBack
@onready var lens_bar: TextureProgressBar = $StateLens/BarBack/Bar
@onready var lens_head_pic: TextureRect = $StateLens/HeadPic

func get_players() -> void:
	if Global.player_bell==null:%StateBell.visible=false
	if Global.player_lens==null:%StateLens.visible=false

func _process(delta: float) -> void:
	if Global.player_bell:
		bell_bar.value=Global.player_bell.hp
		if bell_bar_back.value==bell_bar.value:pass
		else:bell_bar_back.value=move_toward(bell_bar_back.value,bell_bar.value,100*delta)
		if Global.player_bell.is_dead:bell_head_pic.texture=BELL_DIE
		else:
			if Global.player_bell.is_atk:bell_head_pic.texture=BELL_ATK
			else:bell_head_pic.texture=BELL_IDLE
	
	if Global.player_lens:
		lens_bar.value=Global.player_lens.hp
		if lens_bar_back.value==lens_bar.value:pass
		else:lens_bar_back.value=move_toward(lens_bar_back.value,lens_bar.value,50*delta)
		if Global.player_lens.is_dead:lens_head_pic.texture=LENS_DIE
		else:
			if Global.player_lens.is_atk:lens_head_pic.texture=LENS_ATK
			else:lens_head_pic.texture=LENS_IDLE
