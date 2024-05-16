extends CharacterBody2D

var player = null
var isChasingPlayer = false
var enemySpeed = 10
var enemyalive=true
var playerattacking = false
var enemyhealth=100
var playerattackcooldown=true
var enemy_push_back_when_hit=100


@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var enemy_cool_down = $enemyCoolDown

func _physics_process(_delta):
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

func enemy():
	pass


func _on_area_2d_body_entered(body):
	if body.has_method("player"):
		player=body
		isChasingPlayer=true
		#print("player has entered enemy body")

func _on_area_2d_body_exited(body):
	if body.has_method("player"):
		player = null
		isChasingPlayer=false
		#print("player has left enemy body")


func _on_enemy_hit_box_body_entered(body):
	if body.has_method("player"):
		playerattacking=true


func _on_enemy_hit_box_body_exited(body):
	if body.has_method("player"):
		playerattacking=false
		
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
