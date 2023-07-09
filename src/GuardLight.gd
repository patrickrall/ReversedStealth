@tool

extends PointLight2D

@export_range(30,300) var angle : int = 100 : 
	set(value):
		angle = value
		update_occluder()
	
@export_range(0,500) var vision_length : int = 100 :
	set(value):
		vision_length = value
		update_occluder()

		
func update_occluder():
	visible = (angle != 0)
	if $LightOccluder2D != null: 
		$LightOccluder2D.visible = (angle != 300) and (angle != 0)
		$LightOccluder2D.occluder.polygon[0] = Vector2(1,0).rotated(-PI*angle/360)
		$LightOccluder2D.occluder.polygon[3] = Vector2(1,0).rotated(PI*angle/360)
		$LightOccluder2D.occluder.polygon[6] = Vector2(5,0).rotated(-1.2*PI*angle/360)
		$LightOccluder2D.occluder.polygon[4] = Vector2(5,0).rotated(1.2*PI*angle/360)
		
	if $Area2D/CollisionPolygon2D != null:
		$Area2D.monitoring = vision_length != 0
		$Area2D/CollisionPolygon2D.polygon[0] = Vector2(vision_length,0).rotated(-PI*angle/360)
		$Area2D/CollisionPolygon2D.polygon[2] = Vector2(vision_length,0).rotated(PI*angle/360)
		
		$Area2D/CollisionPolygon2D.polygon[3] = Vector2(vision_length,0)
		
		$Polygon2D.polygon = $Area2D/CollisionPolygon2D.polygon


func _ready():
	update_occluder()


func _on_area_2d_body_entered(body):
	if Engine.is_editor_hint(): return
	if body.is_in_group("Player"):
		print(get_tree().get_current_scene().respawn_player())
