extends CharacterBody2D

var player = null
var isChasingPlayer = false
var enemySpeed = 20
@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta):
	if isChasingPlayer:
		position += (player.position - position)/enemySpeed
		animated_sprite_2d.play("run")
		
		if (player.position.x - position.x)<0:
			animated_sprite_2d.flip_h=true
		else:
			animated_sprite_2d.flip_h=false
	else:
		animated_sprite_2d.play("idle")
		
func _on_enemy_detection_area_body_entered(body):
	player=body
	isChasingPlayer = true


func _on_enemy_detection_area_body_exited(body):
	player=null
	isChasingPlayer = false
		
func enemy():
	pass
