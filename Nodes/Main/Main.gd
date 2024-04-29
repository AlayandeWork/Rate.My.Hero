extends Node2D
@onready var pause_menu = $Pause_Menu
var pausedstate = false
func _ready():
	AudioPlayer._stop_music()

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
