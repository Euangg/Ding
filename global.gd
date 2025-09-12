extends Node

const ENEMY_BIG_EYE = preload("res://elements/enemy/enemy_big_eye.tscn")
const ENEMY_BAT = preload("res://elements/enemy/enemy_bat.tscn")
const ENEMY_FROG = preload("res://elements/enemy/enemy_frog.tscn")
var enemies:Array=[ENEMY_BIG_EYE,ENEMY_BAT,ENEMY_FROG]

var player_view:Node2D
var player_sing:Node2D
var players:Array
