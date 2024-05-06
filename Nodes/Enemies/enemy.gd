extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D

var SPEED = 40
var CHASING_PLAYER = false
var PLAYER = null


func _physics_process(delta):
	if CHASING_PLAYER:
		position += (PLAYER.position - position)/SPEED
		animated_sprite_2d.play("enemy_run")
		
		if (PLAYER.position.x - position.x)<0:
			animated_sprite_2d.flip_h = true
		else:
			animated_sprite_2d.flip_h = false
	else:
		animated_sprite_2d.play("enemy_idle")

func _on_detection_body_entered(body):
	PLAYER = body
	CHASING_PLAYER = true


func _on_detection_body_exited(body):
	PLAYER = null
	CHASING_PLAYER = false
