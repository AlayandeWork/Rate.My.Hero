extends Button


func _ready():
	"res://Nodes/Options Menu/Back_Button.gd"


func _on_pressed():
	get_tree().change_scene_to_file("res://Nodes/Main Menu/Main_Menu.tscn")
