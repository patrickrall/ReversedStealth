extends StaticBody2D


var open = true

func _ready():
	update()

func update():
	if open:
		$ClamOpenCollision.disabled = false
		$ClamClosedCollision.disabled = true
		$ClamOpen.visible = true
		$ClamClosed.visible = false
		$Pearl.visible = false
	else:
		$ClamOpenCollision.disabled = true
		$ClamClosedCollision.disabled = false
		$ClamOpen.visible = false
		$ClamClosed.visible = true
		$Pearl.visible = true
	


func _on_area_2d_body_entered(body):
	if not open: return
	if Engine.is_editor_hint(): return
	if not body.is_in_group("Player"): return
	if not body.has_pearl: return
	open = false
	body.has_pearl = false
	update()
