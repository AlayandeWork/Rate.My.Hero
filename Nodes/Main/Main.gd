extends Node2D

var targetScale = Vector2(2.0, 2.0)

func _ready():
	set_scale(targetScale)

func changeScale(newScale: Vector2):
	targetScale = newScale
	set_scale(targetScale)

