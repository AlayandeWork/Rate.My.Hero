extends CharacterBody2D

# DECLARING VARIBALES FOR THE ENEMY MOVEMENT 
var player = null
var Enemy_Chasing_Player = false
var Enemy_Speed = 10
var Enemy_Alive=true
var Player_is_Attacking = false
var Enemy_Health=100
var Attack_Player_Cooldown=true
#var enemy_push_back=Vector2.ZERO # PUSH BACK WHEN ENEMY IS HIT FOR LATER


@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var enemy_cooldown = $Enemy_Cooldown


func _physics_process(delta):
	
# CHASE THE PLAYER IF "ENEMY CHASING PLAYER" IS TRUE
	#player_attacking()
	if Enemy_Chasing_Player == true:
		position += (player.position - position)/Enemy_Speed # LOOK FOR BETTER WAY
		animated_sprite_2d.play("run")
		
		# CHANGE ENEMY ANIMATION DIRECTION BASED ON THE ENEMY MOVEMENT
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
		
#func player_attacking():
	#if playerattacking and GameManager.player_is_attacking and playerattackcooldown==true:
#
		#enemyhealth=enemyhealth-10
		#playerattackcooldown=false
		#enemy_cool_down.start()
		#print("enemy health = ", enemyhealth)
		#if enemyhealth<=0:
			#enemyalive=false
			#enemyhealth=0
			#queue_free()
			
	
#func _on_enemy_cool_down_timeout():
	#playerattackcooldown=true
