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


const UI_JUMP_SCARE = preload("res://scenes/ui_jump_scare.tscn")

var player_view:Node2D
var player_sing:Node2D
var players:Array

var last_kill_enemy_id
