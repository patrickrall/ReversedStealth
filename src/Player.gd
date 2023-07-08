extends CharacterBody2D

const SPEED = 300.0



func _physics_process(_delta):

	var dx = Input.get_axis("ui_left", "ui_right")
	if dx: velocity.x = dx * SPEED
	else: velocity.x = move_toward(velocity.x, 0, SPEED)

	var dy = Input.get_axis("ui_up", "ui_down")
	if dy: velocity.y = dy * SPEED
	else: velocity.y = move_toward(velocity.y, 0, SPEED)


	move_and_slide()

