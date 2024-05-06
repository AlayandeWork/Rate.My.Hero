extends CharacterBody2D

var SPEED = 15
var CHASING_PLAYER = false
var PLAYER = null


func _physics_process(delta):
	if CHASING_PLAYER:
		position += (PLAYER.position - position)/SPEED
		

func _on_detection_body_entered(body):
	PLAYER = body
	CHASING_PLAYER = true


func _on_detection_body_exited(body):
	PLAYER = null
	CHASING_PLAYER = false
