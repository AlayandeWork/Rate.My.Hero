extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_back_button_pressed():
	$SelectingMenu.play()
	get_tree().change_scene_to_file("res://Nodes/Menu/menu.tscn")



func _on_back_button_mouse_entered():
	$MovingMenu.play() # Replace with function body.


func _on_back_button_focus_entered():
	$MovingMenu.play()
