extends KinematicBody2D
const UP = Vector2(0,-1)
const GRAVITY = 20
const MAX_SPEED = 200
const ACCELERATION = 50
const MAX_JUMP_HEIGHT = -300
var motion = Vector2()
onready var Player = get_tree().get_root().get_node("Main/Player")
func _physics_process(delta):
	motion.y +=GRAVITY
	
	motion = move_and_slide(motion,UP)
		