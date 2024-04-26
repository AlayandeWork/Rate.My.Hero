extends Control



func _ready():
	pass 


func _on_back_button_pressed():
	$SelectingMenu.play()
	get_tree().change_scene_to_file("res://Nodes/Menu/menu.tscn")



func _on_back_button_mouse_entered():
	$MovingMenu.play() 


func _on_back_button_focus_entered():
	$MovingMenu.play()
