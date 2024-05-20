extends CharacterBody2D

var player = null
var isChasingPlayer = false
var enemySpeed = 10
var enemyalive=true
var playerattacking = false
var enemyhealth=100
var playerattackcooldown=true
var enemy_push_back=Vector2.ZERO


@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var enemy_cool_down = $enemyCoolDown


func _physics_process(delta):

	player_attacking()
	if isChasingPlayer:
		position += (player.position - position)/enemySpeed
		animated_sprite_2d.play("run")
		
		if (player.position.x - position.x)<0:
			animated_sprite_2d.flip_h=true
		else:
			animated_sprite_2d.flip_h=false
	else:
		animated_sprite_2d.play("idle")

#func _on_area_2d_body_entered(body):
	#if body.is_in_group("player"):
		#player=body
		#isChasingPlayer=true
#
#func _on_area_2d_body_exited(body):
	#if body.is_in_group("player"):
		#player = null
		#isChasingPlayer=false
#
#func _on_enemy_hit_box_body_entered(body):
	#if body.is_in_group("player"):
		#playerattacking=true
#
#func _on_enemy_hit_box_body_exited(body):
	#if body.is_in_group("player"):
		#playerattacking=false
		
func player_attacking():
	if playerattacking and GameManager.player_is_attacking and playerattackcooldown==true:

		enemyhealth=enemyhealth-10
		playerattackcooldown=false
		enemy_cool_down.start()
		print("enemy health = ", enemyhealth)
		if enemyhealth<=0:
			enemyalive=false
			enemyhealth=0
			queue_free()
			
	
func _on_enemy_cool_down_timeout():
	playerattackcooldown=true
