extends CharacterBody2D

var speed = 40
var friction = 100
var acceleration = 100
var is_chasingPlayer = false
var player = null
var target_posiiton = player.position


func _physics_process(delta):
	if is_chasingPlayer:
		pass
	else:
		pass

func _on_detection_area_2d_body_entered(body):
	player = body
	is_chasingPlayer=true
	print("Entered")


func _on_detection_area_2d_body_exited(body):
	player=null
	is_chasingPlayer=false
	print("Exit")
