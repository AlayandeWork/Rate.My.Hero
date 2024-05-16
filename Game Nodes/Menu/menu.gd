extends Control

func _ready():
	AudioPlayer._play_background_music()
	#$VBoxContainer/StartButton.grab_focus()
	
	
# pressed AREA
func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Nodes/Main/Main.tscn")
	$SelectingMenu.play()

func _on_options_menu_pressed():
	$SelectingMenu.play()
	get_tree().change_scene_to_file("res://Nodes/Menu/options.tscn")
	# Replace with function body.

func _on_exit_button_pressed():
	get_tree().quit()
	$SelectingMenu.play()
	
	
# focus AREA
func _on_start_button_focus_entered():
	$MovingMenu.play()
	# Replace with function body.

func _on_options_menu_focus_entered():
	$MovingMenu.play()
	# Replace with function body.

func _on_exit_button_focus_entered():
	$MovingMenu.play()
	# Replace with function body.

# Entered
func _on_start_button_mouse_entered():
	$MovingMenu.play()


func _on_options_menu_mouse_entered():
	$MovingMenu.play()


func _on_exit_button_mouse_entered():
	$MovingMenu.play()

