@tool

extends Area2D

@export_global_file("*.tscn") var next_scene 


func _on_body_entered(body):
	if next_scene == null: return
	if Engine.is_editor_hint(): return
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file(next_scene)
