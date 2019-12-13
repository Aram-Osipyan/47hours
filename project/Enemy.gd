extends KinematicBody2D
const UP = Vector2(0,-1)
const GRAVITY = 20
const MAX_SPEED = 100
const ACCELERATION = 50
const MAX_JUMP_HEIGHT = -200
var velocity = Vector2()
var vel = Vector2()
onready var Player = get_tree().get_root().get_node("Main/Player")
# velocity = Vector2()
func _physics_process(delta):
	velocity.y +=GRAVITY

	
	velocity.x = Player.get_global_position().x - get_global_position().x
	velocity.normalized()
	#print("1",velocity.x, "          ",Player.get_global_position().x)
	if is_on_wall():
		#print(velocity.x, "          ",Player.get_global_position().x)
		velocity.y = MAX_JUMP_HEIGHT
	velocity = move_and_slide(velocity,UP)
		