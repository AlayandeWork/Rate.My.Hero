extends CharacterBody2D


# DECLARING VARIBALES FOR THE PLAYER MOVEMENT 
var Speed: int = 150
var Friction: int = 600
var Acceleration: int = 800

# DECLARING VARIABLES TO CHECK THE DEATH OR ALIVE STATE
var enemy_is_inside = false
var player_is_alive = true
var attack_enemy_cooldown = true
var player_health = 100

# DECLARING AN ENUMERATION TO DEFINE THE POSSIBLE STATES OF OUR PLAYER
enum {
	MOVE,
	ATTACK,
}

# DECLARING A VARIABLE TO SET OUR DEFAULT STATE AS 'MOVE'
var state = MOVE

# REFERENCES TO VARIOUS NODES IN THE SCENE AND ATTACHING THEM TO A CUSTOM VARIABLE
@onready var animation_player = $AnimationPlayer
@onready var animation_tree = $AnimationTree
@onready var animationState = animation_tree.get("parameters/playback")
@onready var player_cooldown = $Player_Cooldown

# THE READY FUNCTION STARTS WHEN THE SCENE IS INITIALIZED (STARTS WHATEVER IS IN THE FUNCTION FIRST)
func _ready():
	animation_tree.active = true
	
func _physics_process(delta):
	#CONSTANTLY CHECKING FOR THESE FUNCTIONS
	enemy_is_attacking()
	player_is_dead()
	
		
	# CHECKS THE STATE VARIABLE AND CALLS THE APPROPRIATE STATE WHEN NEEDED	
	match state:
		MOVE:
			move_state(delta)
		ATTACK:
			attack_state(delta)
			
			
# MOVE STATE FUNCTION, WITH MOVE STATE ANIMATIONS INCLUDING IDLE IF THERE IS NO MOVEMENT		
func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	input_vector.y = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		animation_tree.set("parameters/Idle/blend_position", input_vector)
		animation_tree.set("parameters/Run/blend_position", input_vector)
		animation_tree.set("parameters/Attack/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * Speed, Acceleration * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, Friction * delta)
	
	set_velocity(velocity)
	move_and_slide()
	velocity = velocity
	
	if Input.is_action_pressed("Attack"):
		#GameManager.player_is_attacking=true
		state = ATTACK
		
		
# WHEN THE ATTACK ANIMATION IS FINISHED, THIS FUNCTION RETURNS THE PLAYER TO THE MOVE STATE		
func attack_animation_finished():
	state = MOVE
		
# ATTACK STATE FUNCTION WITH ANIMATIONS		
func attack_state(_delta):
	velocity = Vector2.ZERO
	animationState.travel("Attack")
	
		
# THE FUNCTION FOR WHEN THE ENEMY IS ATTACKING THE PLAYER 
func enemy_is_attacking():
	if enemy_is_inside and attack_enemy_cooldown:
		player_health -= 10
		attack_enemy_cooldown=false
		player_cooldown.start()
		print("Player Health is " + str(player_health))

# THE FUNCTION FOR WHEN THE PLAYER IS DEAD OR PLAYER HEALTH IS ZERO	
func player_is_dead():
	if player_health <= 0:
		player_is_alive = false
		player_health = 0
		print("The Player is Dead")
		queue_free() # RESTART THE GAME OR QUIT
			

#func _on_area_2d_body_entered(body):
	#if body.is_in_group("enemy"):
		#enemyinside=true

#func _on_area_2d_body_exited(body):
	#if body.is_in_group("enemy"):
		#enemyinside=false

#func _on_god_mode_timeout():
	#enemyattackcooldown=true
