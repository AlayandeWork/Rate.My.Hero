extends CharacterBody2D

var speed = 40
var friction = 100
var is_chasingPlayer = false

#func _physics_process(delta):


	


func _on_detection_area_2d_body_entered(body):
	print("Entered")


func _on_detection_area_2d_body_exited(body):
	print("Exit")
