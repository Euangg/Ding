extends Control

const PLAYER_BELL = preload("uid://c0xxxwf6fo0lx")
const PLAYER_LENS = preload("uid://eodwrdvp6yak")

var failed:bool=false
var player_bell:Player
var player_lens:Player

signal fail_over

@onready var camera: Camera2D = $Camera2D
@onready var canvas_modulate: CanvasModulate = $CanvasModulate
@onready var node_for_scare: CanvasLayer = $NodeForScare
@onready var ui_fail: Control = $CanvasLayer/UiFail

var dict_level={
	"level_1_1":preload("uid://b6g84lv670ubp"),
	"level_1_2":preload("uid://ine5ls1mg6cq"),
	"level_2_1":preload("uid://bl8x41hl8y1tu"),
}
func switch_level(str_level:String):
	var old_level:Array=%Level.get_children()
	for l in old_level:l.queue_free()
	
	var new_level:Level=dict_level[str_level].instantiate()
	%Level.add_child(new_level)
	var marks:Array=new_level.enter_point.get_children()
	if player_bell:player_bell.position=marks[0].position
	if player_lens:player_lens.position=marks[1].position

func _ready() -> void:
	match Global.mode_player:
		0:player_bell=PLAYER_BELL.instantiate()	
		1:player_lens=PLAYER_LENS.instantiate()
		2:
			player_bell=PLAYER_BELL.instantiate()
			player_lens=PLAYER_LENS.instantiate()
	if player_bell:%NodePlayers.add_child(player_bell)
	if player_lens:
		%NodePlayers.add_child(player_lens)
		player_lens.node_ammo=%NodeElements
	#%HudPlayerState.set_players(player_bell,player_lens)
	
	switch_level("level_1_1")
	
	Global.play_music(Global.MUSIC_PLAY)
	fail_over.connect(show_fail_ui)

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):Global.switch_scene(Global.SCENE_THEME)
	
	if Input.is_action_just_pressed("h"):switch_level("level_1_1")
	if Input.is_action_just_pressed("j"):switch_level("level_1_2")
	if Input.is_action_just_pressed("k"):switch_level("level_2_1")
	
	var players:Array=%NodePlayers.get_children()
	var acc_position:Vector2=Vector2.ZERO
	for p:Player in players:acc_position+=p.position
	if players.is_empty():pass
	else:camera.position=acc_position/players.size()
	
	#if is_players_dead():
		#if failed:pass
		#else:
			#Global.play_music(Global.MUSIC_FAIL)
			#failed=true
			##canvas_modulate.visible=false
			##if player_bell:player_bell.timer_respawn.stop()
			##if player_lens:player_lens.timer_respawn.stop()#复活计时器
			#var ui=Global.UI_JUMP_SCARE.instantiate()
			#ui.enemy_id=Global.last_kill_enemy_id
			#node_for_scare.add_child(ui)

func show_fail_ui():
	ui_fail.visible=true
