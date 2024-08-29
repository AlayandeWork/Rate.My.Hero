extends CharacterBody2D

# DECLARING VARIBALES FOR THE ENEMY MOVEMENT 
var player = null
var Enemy_Chasing_Player = false
var Enemy_Speed = 70
var Enemy_Alive=true
var Player_is_Attacking = false
var Enemy_Health=100
var Attack_Player_Cooldown=true
#var enemy_push_back=Vector2.ZERO # PUSH BACK WHEN ENEMY IS HIT FOR LATER
uu

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var enemy_cooldown = $Enemy_Cooldown


func _physics_process(delta):
	
# CHASE THE PLAYER IF "ENEMY CHASING PLAYER" IS TRUE
	player_attack()
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


func _on_enemy_follow_area_body_entered(body):
	if body.is_in_group("player"):
		player = body
		Enemy_Chasing_Player = true
		print("Player has Entered")


func _on_enemy_follow_area_body_exited(body):
	if body.is_in_group("player"):
		player = null
		Enemy_Chasing_Player = false
		print("Player has Exited")


func _on_enemy_hitbox_area_body_entered(body):
	if body.has_method("weapon"):
		print ("weapon")
		#Player_is_Attacking = true


func _on_enemy_hitbox_area_body_exited(body):
	if body.is_in_group("weapon"):
		Player_is_Attacking = false
		
		
	
func player_attack():
	if Player_is_Attacking:
		Enemy_Health = Enemy_Health - 10
		#enemy_cooldown = false
		#enemy_cooldown.start()
		print ("Enemy Health = ", Enemy_Health)
		if Enemy_Health <= 0:
			Enemy_Alive = false
			Enemy_Health = 0
			queue_free()

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
func _on_enemy_cooldown_timeout():
	enemy_cooldown = true
