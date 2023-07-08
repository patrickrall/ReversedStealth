@tool

extends StaticBody2D


@export var opaque: bool = true :
	set(value):
		opaque = value
		if opaque: $ColorRect.color = Color.html("#000")
		else: $ColorRect.color = Color.html("#00F")
		$LightOccluder2D.visible = value

func _ready():
	if opaque: $ColorRect.color = Color.html("#000")
	else: $ColorRect.color = Color.html("#00F")
