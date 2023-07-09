extends StaticBody2D


@export var unique_key = ""

var open = true

func _ready():
	if Globals.data.has(unique_key):
		open = Globals.data.get(unique_key)
	update()
	
	

func update():
	if open:
		$ClamOpenCollision.set_deferred("disabled",false)
		$ClamClosedCollision.set_deferred("disabled",true)
		$ClamOpen.set_deferred("visible",true)
		$ClamClosed.set_deferred("visible",false)
		$Pearl.set_deferred("visible",false)
		
	else:
		$ClamOpenCollision.set_deferred("disabled",true)
		$ClamClosedCollision.set_deferred("disabled",false)
		$ClamOpen.set_deferred("visible",false)
		$ClamClosed.set_deferred("visible",true)
		$Pearl.set_deferred("visible",true)
		


func _on_area_2d_body_entered(body):
	if not open: return
	if Engine.is_editor_hint(): return
	if not body.is_in_group("Player"): return
	if not body.has_pearl: return
	open = false
	body.has_pearl = false
	Globals.data[unique_key] = false
	update()
