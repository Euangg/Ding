extends Node

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

var player_view:Node2D
var player_sing:Node2D
var players:Array
