extends Control

@onready var pause_menu = $"."
var pausedstate = false

func _physics_process(delta):
	if Input.is_action_just_pressed("Escape"):
		PauseMenuShow()
		
func PauseMenuShow():
	if pausedstate:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
		
	pausedstate = !pausedstate




func _on_resume_button_pressed():
	PauseMenuShow()


func _on_quit_button_pressed():
	get_tree().quit()
