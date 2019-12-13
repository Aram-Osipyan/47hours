extends KinematicBody2D
const UP = Vector2(0,-1)
const GRAVITY = 20
const MAX_SPEED = 100
const ACCELERATION = 50
const MAX_JUMP_HEIGHT = -400
var velocity = Vector2()
onready var Player = get_tree().get_root().get_node("Main/Player")
var last_vel = Vector2()
var jump_cond = true
func _physics_process(delta):
	last_vel.x = velocity.x
	velocity.y += GRAVITY
	velocity.x = Player.get_global_position().x - get_global_position().x
	print(velocity.x,"   ", last_vel.x)
	if abs(velocity.x - last_vel.x) < 0.01:
		jump_cond = false
	#velocity.normalized()
	if is_on_wall() and is_on_floor() and jump_cond :
		velocity.y = MAX_JUMP_HEIGHT
		
	
	velocity = move_and_slide(velocity,UP)
		
