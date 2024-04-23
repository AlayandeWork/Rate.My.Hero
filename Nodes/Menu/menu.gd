extends Control

@onready var scene_timer: Timer = $SceneTimer

func _ready():
	$VBoxContainer/StartButton.grab_focus()
	
	
# PRESSED AREA
func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Nodes/Main/Main.tscn")
	$SelectingMenu.play()

func _on_options_menu_pressed():
	$SelectingMenu.play()
	# Replace with function body.

func _on_exit_button_pressed():
	get_tree().quit()
	$SelectingMenu.play()
	
	
# HOVER AREA
func _on_start_button_focus_entered():
	$MovingMenu.play()
	# Replace with function body.

func _on_options_menu_focus_entered():
	$MovingMenu.play()
	# Replace with function body.

func _on_exit_button_focus_entered():
	$MovingMenu.play()
	# Replace with function body.


func _on_background_menu_finished():
	$BackgroundMenu.play()


func _on_start_button_mouse_entered():
	$MovingMenu.play()


func _on_options_menu_mouse_entered():
	$MovingMenu.play()


func _on_exit_button_mouse_entered():
	$MovingMenu.play()
