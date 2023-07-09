extends CanvasLayer

func change_scene(new_scene, spawn_location):
	# fade out and wait for animation to finish
	$AnimationPlayer.play("dissolve")
	await $AnimationPlayer.animation_finished
	# load new scene, and fade in
	get_tree().change_scene_to_file(new_scene)
	$AnimationPlayer.play_backwards("dissolve")
	# wait a little bit before setting the player location
	await get_tree().create_timer(0.01).timeout
	var level_node = get_tree().get_root().get_node("Level")
	var spawn_node = level_node.get_node("Spawns").get_node(spawn_location)
	get_tree().get_first_node_in_group("Player").position = spawn_node.position
