
extends Node2D

var player

func _ready():
	spawn_player()

func spawn_player(position_node = null):
	player = load("res://subscenes/Player.tscn").instantiate()
	position_node = position_node if position_node else "PlayerSpawn"
	player.position = $Spawns.get_node(position_node).position
	player.last_spawn = position_node
	call_deferred("add_child", player)

func respawn_player():
	var last_spawn = player.last_spawn
	remove_child(player)
	spawn_player(last_spawn)


func _input(event):
	if event.is_action("ui_home"):
		respawn_player()
