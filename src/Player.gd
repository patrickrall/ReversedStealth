extends CharacterBody2D

const SPEED = 300.0

var has_pearl = false : 
	set(value):
		has_pearl = value
		$Pearl.visible = has_pearl



func _physics_process(_delta):

	var dx = Input.get_axis("ui_left", "ui_right")
	if dx: velocity.x = dx * SPEED
	else: velocity.x = move_toward(velocity.x, 0, SPEED)

	var dy = Input.get_axis("ui_up", "ui_down")
	if dy: velocity.y = dy * SPEED
	else: velocity.y = move_toward(velocity.y, 0, SPEED)

	if dx > 0: $Sprite2D.scale.x = abs($Sprite2D.scale.x)
	if dx < 0: $Sprite2D.scale.x = -abs($Sprite2D.scale.x)

	move_and_slide()

