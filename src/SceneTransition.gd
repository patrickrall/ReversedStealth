extends CanvasLayer

func change_scene(new_scene, spawn_location):
	$AnimationPlayer.play("dissolve")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(new_scene)
	$AnimationPlayer.play_backwards("dissolve")
	await get_tree().create_timer(0.01).timeout
	#print(spawn_location)
	var node = get_tree().get_root().get_node("Level").get_node(spawn_location)
	get_tree().get_first_node_in_group("Player").position = node.position
