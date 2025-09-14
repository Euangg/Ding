extends Node

enum EnemyId{
	BAT,
	BIG_EYE,
	BIG_MOUTH,
	FLOAT_HEAD,
	FROG,
	HAND_EYE,
	MAN_WOMAN,
	TWO_MOUTH,
	WORM
}

const ENEMY_BAT = preload("res://elements/enemy/enemy_bat.tscn")
const ENEMY_BIG_EYE = preload("res://elements/enemy/enemy_big_eye.tscn")
const ENEMY_BIG_MOUTH = preload("res://elements/enemy/enemy_big_mouth.tscn")
const ENEMY_FLOAT_HEAD = preload("res://elements/enemy/enemy_float_head.tscn")
const ENEMY_FROG = preload("res://elements/enemy/enemy_frog.tscn")
const ENEMY_HAND_EYE = preload("res://elements/enemy/enemy_hand_eye.tscn")
const ENEMY_MAN_WOMAN = preload("res://elements/enemy/enemy_man_woman.tscn")
const ENEMY_MOUTH = preload("res://elements/enemy/enemy_mouth.tscn")
const ENEMY_WORM = preload("res://elements/enemy/enemy_worm.tscn")

var enemies:Array=[ENEMY_BAT,ENEMY_BIG_EYE,ENEMY_BIG_MOUTH,ENEMY_FLOAT_HEAD,
ENEMY_FROG,ENEMY_HAND_EYE,ENEMY_MAN_WOMAN,ENEMY_MOUTH,ENEMY_WORM]

const ENEMY_PIC_BAT = preload("res://elements/enemy/pic/enemy_pic_bat.tscn")
const ENEMY_PIC_BIG_EYE = preload("res://elements/enemy/pic/enemy_pic_big_eye.tscn")
const ENEMY_PIC_BIG_MOUTH = preload("res://elements/enemy/pic/enemy_pic_big_mouth.tscn")
const ENEMY_PIC_FLOAT_HEAD = preload("res://elements/enemy/pic/enemy_pic_float_head.tscn")
const ENEMY_PIC_FROG = preload("res://elements/enemy/pic/enemy_pic_frog.tscn")
const ENEMY_PIC_HAND_EYE = preload("res://elements/enemy/pic/enemy_pic_hand_eye.tscn")
const ENEMY_PIC_MAN_WOMAN = preload("res://elements/enemy/pic/enemy_pic_man_woman.tscn")
const ENEMY_PIC_MOUTH = preload("res://elements/enemy/pic/enemy_pic_mouth.tscn")
const ENEMY_PIC_WORM = preload("res://elements/enemy/pic/enemy_pic_worm.tscn")
var enemy_pics:Array=[ENEMY_PIC_BAT,ENEMY_PIC_BIG_EYE,ENEMY_PIC_BIG_MOUTH,ENEMY_PIC_FLOAT_HEAD,
ENEMY_PIC_FROG,ENEMY_PIC_HAND_EYE,ENEMY_PIC_MAN_WOMAN,ENEMY_PIC_MOUTH,ENEMY_PIC_WORM]

const EFFECT_DEFEAT_BLACK_1 = preload("res://elements/effect/effect_defeat_black_1.tscn")
const EFFECT_DEFEAT_BLACK_2 = preload("res://elements/effect/effect_defeat_black_2.tscn")
const EFFECT_DEFEAT_BLUE_1 = preload("res://elements/effect/effect_defeat_blue_1.tscn")
const EFFECT_DEFEAT_BLUE_2 = preload("res://elements/effect/effect_defeat_blue_2.tscn")
const EFFECT_DEFEAT_RED_1 = preload("res://elements/effect/effect_defeat_red_1.tscn")
const EFFECT_DEFEAT_RED_2 = preload("res://elements/effect/effect_defeat_red_2.tscn")

const UI_JUMP_SCARE = preload("res://scenes/ui_jump_scare.tscn")


const AMMO = preload("res://elements/projectile/Ammo.tscn")


var player_view:Player
var player_sing:Player
var players:Array
var node_ammo:Node2D
var node_effect:Node2D

var last_kill_enemy_id

@onready var node_sfx: Node = $NodeSfx
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

const SFX_ATK_1 = preload("res://elements/sfx/sfx_atk_1.tscn")
const SFX_ATK_2 = preload("res://elements/sfx/sfx_atk_2.tscn")
const SFX_ATK_3 = preload("res://elements/sfx/sfx_atk_3.tscn")
const SFX_ATK_4 = preload("res://elements/sfx/sfx_atk_4.tscn")
const SFX_ATK_5 = preload("res://elements/sfx/sfx_atk_5.tscn")
const SFX_HUMAN_DEAD = preload("res://elements/sfx/sfx_human_dead.tscn")
const SFX_HUMAN_HURT = preload("res://elements/sfx/sfx_human_hurt.tscn")
const SFX_MONSTER_HURT = preload("res://elements/sfx/sfx_monster_hurt.tscn")
const SFX_MONSTER_DEAD = preload("res://elements/sfx/sfx_monster_dead.tscn")
func play_sfx(sfx:PackedScene):node_sfx.add_child(sfx.instantiate())

const MUSIC_FAIL = preload("res://assets/music/fail.mp3")
const MUSIC_PLAY = preload("res://assets/music/play.mp3")
const MUSIC_THEME = preload("res://assets/music/theme.wav")
func play_music(music:AudioStream):
	audio_stream_player.stream=music
	audio_stream_player.play()
func _on_audio_stream_player_finished() -> void:
	audio_stream_player.play()
