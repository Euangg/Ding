extends Control

const PLAYER_BELL = preload("uid://c0xxxwf6fo0lx")
const PLAYER_LENS = preload("uid://eodwrdvp6yak")

var failed:bool=false
var player_bell:Player=null
var player_lens:Player=null

signal fail_over

@onready var canvas_modulate: CanvasModulate = $CanvasModulate
@onready var node_for_scare: CanvasLayer = $NodeForScare
@onready var ui_fail: Control = $CanvasLayer/UiFail

var dict_level={
	"level_1_1":preload("uid://b6g84lv670ubp"),
	"level_1_2":preload("uid://ine5ls1mg6cq"),
	"level_2_1":preload("uid://bl8x41hl8y1tu"),
	"level_1_1_new":preload("uid://kemeum84sb52"),
	"level_1_2_new": preload("uid://b66m3xf472twk")
}
func switch_level(str_level:String):
	var old_level:Array=%Level.get_children()
	for l in old_level:l.queue_free()
	
	var new_level:Level=dict_level[str_level].instantiate()
	%Level.add_child(new_level)
	var marks:Array=new_level.enter_point.get_children()
	if player_bell:player_bell.position=marks[0].position
	if player_lens:player_lens.position=marks[1].position
	
	%Camera.limit_left=new_level.lt.position.x
	%Camera.limit_top=new_level.lt.position.y
	%Camera.limit_right=new_level.rb.position.x
	%Camera.limit_bottom=new_level.rb.position.y
	
signal game_over;
func on_game_over():
	ui_fail.show()
	Global.play_music(Global.MUSIC_FAIL)
	print("game over")
func on_player_dead():
	print("player dead")
	if player_bell:if !player_bell.is_dead:return
	if player_lens:if !player_lens.is_dead:return
	game_over.emit()

func _ready() -> void:
	match Global.mode_player:
		0:player_bell=PLAYER_BELL.instantiate()	
		1:player_lens=PLAYER_LENS.instantiate()
		2:
			player_bell=PLAYER_BELL.instantiate()
			player_lens=PLAYER_LENS.instantiate()
	if player_bell:
		%NodePlayers.add_child(player_bell)
		player_bell.dead.connect(on_player_dead)
		Global.player_bell=player_bell
	if player_lens:
		%NodePlayers.add_child(player_lens)
		player_lens.dead.connect(on_player_dead)
		Global.player_lens=player_lens
		player_lens.node_ammo=%NodeElements
	Global.node_players=%NodePlayers
	Global.camera=%Camera
	%HudPlayerState.get_players()
	
	match Global.next_level:
		1:switch_level("level_1_1_new")
		2:switch_level("level_1_2_new")
	
	fail_over.connect(show_fail_ui)

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("esc"):Global.switch_scene(Global.UI_THEME)
	
	var players:Array=%NodePlayers.get_children()
	var acc_position:Vector2=Vector2.ZERO
	for p:Player in players:acc_position+=p.position
	if players.is_empty():pass
	else:%Camera.position=acc_position/players.size()
	
func show_fail_ui():
	ui_fail.visible=true
