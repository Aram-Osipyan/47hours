extends KinematicBody2D
const UP = Vector2(0,-1)
const GRAVITY = 20
const MAX_SPEED = 200
const ACCELERATION = 50
const MAX_JUMP_HEIGHT = -500
var motion = Vector2()

func _physics_process(delta):
	motion.y +=GRAVITY
	var friction = false
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + ACCELERATION,MAX_SPEED)
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - ACCELERATION,-MAX_SPEED)
	else:
		friction = true
		motion.x = lerp(motion.x,0,0.2)
	if is_on_floor():
		print("ON_FLOOR")
		if Input.is_action_just_pressed("ui_up"):
			motion.y = MAX_JUMP_HEIGHT
			if friction:
				motion.x = lerp(motion.x,0,0.2)
		else:
			if friction:
				motion.x = lerp(motion.x,0,0.2)
	motion = move_and_slide(motion,UP)
		