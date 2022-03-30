extends Node2D


# TODO verify if the game is completed


var player_scn = load("res://Scenes/PlayerScene/Player.tscn")
var map_scn = load("res://Scenes/Maps/TestMap.tscn")


func _ready():

	var player = player_scn.instance()
	var map = map_scn.instance()
	player.map = map

	# player.set_location(map.initial_position)
	# player.set_position(map.initial_position)

	player.position = map.inital_position

	add_child(map)
	add_child(player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
