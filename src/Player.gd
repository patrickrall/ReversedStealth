extends CharacterBody2D

const SPEED = 300.0
const DY_DRAG = 0.76
const TILT_ANGLE = 15.0

var has_pearl = false : 
	set(value):
		has_pearl = value
		$Pearl.visible = has_pearl

var last_spawn = "PlayerSpawn":
	set(value):
		last_spawn = value

func _physics_process(_delta):
	
	var fade_player = SceneTransition.get_node("AnimationPlayer") as AnimationPlayer
	if fade_player.is_playing():
		return

	var dx = Input.get_axis("ui_left", "ui_right")
	if dx: velocity.x = dx * SPEED
	else: velocity.x = move_toward(velocity.x, 0, SPEED)

	var dy = Input.get_axis("ui_up", "ui_down")
	if dy: velocity.y = dy * SPEED * DY_DRAG
	else: velocity.y = move_toward(velocity.y, 0, SPEED)

	if dx > 0: 
		$Sprite2D.scale.x = abs($Sprite2D.scale.x)
		$CollisionPolygon2D.scale.x = abs($CollisionPolygon2D.scale.x)
	if dx < 0: 
		$Sprite2D.scale.x = -abs($Sprite2D.scale.x)
		$CollisionPolygon2D.scale.x = -abs($CollisionPolygon2D.scale.x)

	if dy > 0:
		if $Sprite2D.scale.x > 0:
			$Sprite2D.rotation_degrees = TILT_ANGLE
			$CollisionPolygon2D.rotation_degrees = TILT_ANGLE
		else:
			$Sprite2D.rotation_degrees = -TILT_ANGLE
			$CollisionPolygon2D.rotation_degrees = -TILT_ANGLE
	else: 
		if dy < 0:
			if $Sprite2D.scale.x > 0:
				$Sprite2D.rotation_degrees = -TILT_ANGLE
				$CollisionPolygon2D.rotation_degrees = -TILT_ANGLE
			else:
				$Sprite2D.rotation_degrees = TILT_ANGLE
				$CollisionPolygon2D.rotation_degrees = TILT_ANGLE
		else:
			$Sprite2D.rotation_degrees = 0.0
			$CollisionPolygon2D.rotation_degrees = 0.0

	move_and_slide()

