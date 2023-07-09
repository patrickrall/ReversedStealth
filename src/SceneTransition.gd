extends CanvasLayer

const ANIM_LEN = 0.5

func change_scene(new_scene, spawn_location):
	# start player rotation and scaling tween
	var player = get_tree().get_first_node_in_group("Player")
	var tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.tween_property(player, "rotation_degrees", 720, ANIM_LEN).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN)
	tween.tween_property(player, "scale", Vector2.ZERO, ANIM_LEN).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN)
	
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
	
	# start player rotation tween
	player = get_tree().get_first_node_in_group("Player")
	tween = get_tree().create_tween()
	tween.tween_property(player, "rotation_degrees", 720, ANIM_LEN).set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_OUT)

	player.position = spawn_node.position
