extends Sprite2D

var picked_up = false

func _on_area_2d_body_entered(body):
	if picked_up: return
	if Engine.is_editor_hint(): return
	if not body.is_in_group("Player"): return
	if body.has_pearl: return
	picked_up = true
	visible = false
	body.has_pearl = true
