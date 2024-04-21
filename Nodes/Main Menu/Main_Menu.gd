extends Control

func _ready():
	$VBoxContainer/StartButton.grab_focus()


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Nodes/Main/Main.tscn")
 

func _on_quit_button_pressed():
	get_tree().quit() 


func _on_option_button_pressed():
	get_tree().change_scene_to_file("res://Nodes/Options Menu/Options_Menu.tscn")
