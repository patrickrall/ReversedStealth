@tool

extends Area2D

@export var next_scene : String = "res://levels/Level0.tscn"


func _on_body_entered(body):
	if next_scene == null: return
	if Engine.is_editor_hint(): return
	if body.is_in_group("Player"):
		SceneTransition.change_scene(next_scene, "PlayerSpawn")
