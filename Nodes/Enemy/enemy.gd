extends CharacterBody2D

var speed=40
var friction=20
var acceleration=30
var player=null
var isChasing=false


func _physics_process(delta):
	if isChasing:
		position=position.move_toward(player.position, speed * delta)
	else:
		


func _on_detection_area_2d_body_entered(body):
	player==body
	isChasing=true
	print("Entered")


func _on_detection_area_2d_body_exited(body):
	player==null
	isChasing=false
	print("Exit")
