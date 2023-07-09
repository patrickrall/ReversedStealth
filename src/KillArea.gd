extends Area2D

func _on_body_entered(body):
	if Engine.is_editor_hint(): return
	if body.is_in_group("Player"):
		print(get_tree().get_current_scene().respawn_player())
