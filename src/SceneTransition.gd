extends CanvasLayer

func change_scene(new_scene):
	$AnimationPlayer.play("dissolve")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(new_scene)
	$AnimationPlayer.play_backwards("dissolve")
