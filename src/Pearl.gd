extends Area2D


@export var unique_key = ""

var picked_up = false

func _ready():
	if Globals.data.has(unique_key):
		picked_up = Globals.data.get(unique_key)
	if picked_up: $Pearl.visible = false

func _on_area_2d_body_entered(body):
	if picked_up: return
	if Engine.is_editor_hint(): return
	if not body.is_in_group("Player"): return
	if body.has_pearl: return
	picked_up = true
	$Pearl.visible = false
	body.has_pearl = true
	Globals.data[unique_key] = true
