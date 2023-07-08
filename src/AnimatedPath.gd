extends Path2D


@export var speed : float = 50

var t := 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for pathfollow in get_children():
		pathfollow.progress += delta * speed * 10
