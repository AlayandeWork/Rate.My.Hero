extends CharacterBody2D

var player = null
var isChasingPlayer = false
var enemySpeed = 20

func _physics_process(delta):
	if isChasingPlayer:
		position += (player.position - position)/enemySpeed
		#print("Chasing Player")
	else:
		#print("Not Chasing Player")
		pass
		
func _on_enemy_detection_area_body_entered(body):
	if body.is_in_group("player"):
		player=body
		isChasingPlayer = true


func _on_enemy_detection_area_body_exited(body):
	if body.is_in_group("player"):
		player=body
		isChasingPlayer = false
		
func enemy():
	pass
