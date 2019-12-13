extends KinematicBody2D
const UP = Vector2(0,-1)
const GRAVITY = 20
const MAX_SPEED = 100
const ACCELERATION = 50
const MAX_JUMP_HEIGHT = -300
var velocity = Vector2()
onready var Player = get_tree().get_root().get_node("Main/Player")
# velocity = Vector2()
func _physics_process(delta):
	velocity.y +=GRAVITY

	if is_on_floor():
		velocity.x = Player.get_global_position().x - get_global_position().x
		velocity.normalized()
	velocity = move_and_slide(velocity,UP)
		