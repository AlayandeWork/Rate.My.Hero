extends CharacterBody2D


# DECLARING VARIBALES FOR THE PLAYER MOVEMENT 
var Speed: int = 160
var Friction: int = 600
var Acceleration: int = 800

# DECLARING VARIABLES TO CHECK THE DEATH OR ALIVE STATE
var enemyinside=false
var playalive = true
var enemyattackcooldown=true
var health = 100

# DECLARING AN ENUMERATION TO DEFINE THE POSSIBLE STATES OF OUR PLAYER
enum {
	MOVE,
	ATTACK,
}

# DECLARING A VARIABLE TO SET OUR DEFAULT STATE AS 'MOVE'
var state = MOVE

# REFERENCES TO VARIOUS NODES IN THE SCENE AND ATTACHING THEM TO A CUSTOM VARIABLE
@onready var animationPlayer = $AnimationPlayer
@onready var animationTree = $AnimationTree
@onready var animationState = animationTree.get("parameters/playback")
@onready var player_cooldown = $Player_Cooldown

# THE READY FUNCTION STARTS WHEN THE SCENE IS INITIALIZED(ACTIVATING THE ANIMATION TREE
func _ready():
	animationTree.active = true
	
func _physics_process(delta):
	#enemyattacking()
	
	#if health<=0:
		#playalive=false
		#health=0
		#print("player is dead")
		#queue_free()
		
	# CHECKS THE STATE VARIABLE AND CALLS THE APPROPRIATE STATE WHEN NEEDED	
	match state:
		MOVE:
			move_state(delta)
		ATTACK:
			attack_state(delta)
			
			
# MOVE STATE FUNCTION, WITH MOVE STATE ANIMATIONS		
func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	input_vector.y = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * Speed, Acceleration * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, Friction * delta)
	
	set_velocity(velocity)
	move_and_slide()
	velocity = velocity
	
	#if Input.is_action_pressed("Attack"):
		#GameManager.player_is_attacking=true
		#state = ATTACK
		
		
# ATTACK STATE FUNCTION WITH ANIMATIONS		
func attack_state(_delta):
	velocity = Vector2.ZERO
	animationState.travel("Attack")
		
#func attack_animation_finished():
	#GameManager.player_is_attacking=false
	#state = MOVE
#
#func _on_area_2d_body_entered(body):
	#if body.is_in_group("enemy"):
		#enemyinside=true
#
#func _on_area_2d_body_exited(body):
	#if body.is_in_group("enemy"):
		#enemyinside=false
#
#func enemyattacking():
	#if enemyinside and enemyattackcooldown==true:
		#health = health - 10
		#enemyattackcooldown=false
		#player_cooldown.start()
		#print(health)
#
#func _on_god_mode_timeout():
	#enemyattackcooldown=true
