extends Node

const UI_THEME = preload("uid://d240vmenul21x")
const UI_SELECT_CHARACTER = preload("uid://cm3g7buibyi17")
const UI_INTERLUDE = preload("uid://cv5ijf4j77ujk")
const UI_PLAY = preload("uid://csresjl4ikdxf")
const UI_INTRO = preload("uid://vjt0qytt7k78")
const UI_STAFF = preload("uid://b7fhlpox4xl8h")
const UI_SETTINGS = preload("uid://bssclqieuko1d")
const UI_PASS = preload("uid://bn4yccmfxnyro")
func switch_scene(packed_scene:PackedScene):
	get_tree().call_deferred("change_scene_to_packed",packed_scene)

const SFX_ATK_1 = preload("uid://cejb4dowqril")
const SFX_ATK_2 = preload("uid://uierf60waarl")
const SFX_ATK_3 = preload("uid://dtypldmxkpip6")
const SFX_ATK_4 = preload("uid://baq2by60fw5fb")
const SFX_ATK_5 = preload("uid://d3xkasxwi2tg")
const SFX_HUMAN_DEAD = preload("uid://d7q5gmoom7o7")
const SFX_HUMAN_HURT = preload("uid://bui7g8rewm5x1")
const SFX_MONSTER_DEAD = preload("uid://cluyct7nm6sse")
const SFX_MONSTER_HURT = preload("uid://c2fxqmd8qtga0")
const SFX_SHOOT = preload("uid://bww5o7ubuta1w")
func play_sfx(sfx:PackedScene):%Sfx.add_child(sfx.instantiate())

const MUSIC_FAIL = preload("uid://6qhqdheh1mkc")
const MUSIC_PLAY =preload("uid://bakru7uu2bhpy")
const MUSIC_THEME = preload("uid://uli5ueqagtk4")
func play_music(music:AudioStream):
	%Bgm.stream=music
	%Bgm.play()
func stop_bgm():%Bgm.stop()
func _on_audio_stream_player_finished() -> void:%Bgm.play()

var mode_player:int
var next_level:int
 
var node_ammo:Node2D
var node_effect:Node2D
var node_players:Node2D
var player_bell:Player
var player_lens:Player
var camera:Camera2D

func _ready() -> void:
	print("Global ready")
