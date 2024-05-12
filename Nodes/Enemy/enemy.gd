extends CharacterBody2D

var speed=10
var friction=20
var acceleration=30
var player=null
var isChasing=false
@onready var animated_sprite_2d = $AnimatedSprite2D


func _physics_process(delta):
	if isChasing:
		position += (player.position - position)/speed
		animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("idle")

func _on_detection_area_2d_body_entered(body):
	player=body
	isChasing=true
	print("Entered")

func _on_detection_area_2d_body_exited(body):
	player=null
	isChasing=false
	print("Exit")


func _on_hitbox_enemy_body_entered(body):
	pass # Replace with function body.


func _on_hitbox_enemy_body_exited(body):
	pass # Replace with function body.
