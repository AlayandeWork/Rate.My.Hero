extends CharacterBody2D

var player = null
var isChasingPlayer = false
var enemySpeed = 20
@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(_delta):
	if isChasingPlayer:
		position += (player.position - position)/enemySpeed
		animated_sprite_2d.play("run")
		
		if (player.position.x - position.x)<0:
			animated_sprite_2d.flip_h=true
		else:
			animated_sprite_2d.flip_h=false
	else:
		animated_sprite_2d.play("idle")

func enemy():
	pass


func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		player=body
		isChasingPlayer=true
		print("player has entered enemy body")

func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		player = null
		isChasingPlayer=false
		print("player has left enemy body")
