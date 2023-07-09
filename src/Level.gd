
extends Node2D

var player

func _ready():
	spawn_player()

func spawn_player():
	player = load("res://subscenes/Player.tscn").instantiate()
	player.position = $PlayerSpawn.position
	call_deferred("add_child", player)

func respawn_player():
	remove_child(player)
	spawn_player()


func _input(event):
	if event.is_action("ui_home"):
		respawn_player()
