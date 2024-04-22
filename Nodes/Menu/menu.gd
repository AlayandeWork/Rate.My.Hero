extends Control

func _ready():
	pass

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Nodes/Main/Main.tscn")


func _on_options_menu_pressed():
	pass # Replace with function body.


func _on_exit_button_pressed():
	get_tree().quit()
