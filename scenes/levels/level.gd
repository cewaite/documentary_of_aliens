class_name Level extends Node2D

@export var player_spawn: Marker2D
@export var exit_area: Area2D
@export var camera_bound: Marker2D
@export var photo_areas: Array[PhotoArea]
const PLAYER_SCENE = preload("res://entities/player/player.tscn")
var player: Player

func _ready():
	#Spawn player
	spawn_player()
	#set camera bounds

func spawn_player():
	player = PLAYER_SCENE.instantiate()
	player.global_position = player_spawn.global_position
	add_child(player)
