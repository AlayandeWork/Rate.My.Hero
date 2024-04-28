extends Node2D

func _ready():
	AudioPlayer._stop_music()

func _physics_process(delta):
	if Input.is_action_just_pressed("Escape"):
		get_tree().change_scene_to_file("res://Nodes/Menu/menu.tscn")
