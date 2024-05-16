extends CharacterBody2D

var speed = 160
var friction = 600
var acceleration = 800

var enemyinside=false
var playalive = true
var enemyattackcooldown=true
var health = 100

enum {
	MOVE,
	ATTACK,
}
var state = MOVE

@onready var animationPlayer = $AnimationPlayer
@onready var animationTree = $AnimationTree
@onready var animationState = animationTree.get("parameters/playback")
@onready var player_cooldown = $playerCoolDown

func _ready():
	animationTree.active = true
	
func _physics_process(delta):
	enemyattacking()
	
	if health<=0:
		playalive=false
		health=0
		print("player is dead")
		queue_free()
		
		
	match state:
		MOVE:
			move_state(delta)
		ATTACK:
			attack_state(delta)
			
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
		velocity = velocity.move_toward(input_vector * speed, acceleration * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	
	set_velocity(velocity)
	move_and_slide()
	velocity = velocity
	
	if Input.is_action_pressed("Attack"):
		GameManager.player_is_attacking=true
		state = ATTACK
		
func attack_state(_delta):
	velocity = Vector2.ZERO
	animationState.travel("Attack")
		
func attack_animation_finished():
	GameManager.player_is_attacking=false
	state = MOVE

func _on_area_2d_body_entered(body):
	if body.is_in_group("enemy"):
		enemyinside=true

func _on_area_2d_body_exited(body):
	if body.is_in_group("enemy"):
		enemyinside=false

func enemyattacking():
	if enemyinside and enemyattackcooldown==true:
		health = health - 10
		enemyattackcooldown=false
		player_cooldown.start()
		print(health)

func _on_god_mode_timeout():
	enemyattackcooldown=true
