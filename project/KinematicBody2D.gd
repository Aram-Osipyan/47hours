extends KinematicBody2D
const UP = Vector2(0,-1)
const GRAVITY = 20
const MAX_SPEED = 100
const ACCELERATION = 25
const MAX_JUMP_HEIGHT = -500
var motion = Vector2()
export var speed : float = 300
onready var joystick_move = $Camera2D/UI/Joystick


func _physics_process(delta):
	motion.y +=GRAVITY
	var dir = joystick_move.output
	var friction = false
	#if Input.is_action_pressed("ui_right"):
	#	motion.x = min(motion.x + ACCELERATION,MAX_SPEED)
	#elif Input.is_action_pressed("ui_left"):
	#	motion.x = max(motion.x - ACCELERATION,-MAX_SPEED)
	#else:
	#	friction = true
	#	motion.x = lerp(motion.x,0,0.2)
	if dir.x > 0:
			motion.x = min(motion.x + ACCELERATION,MAX_SPEED)
			$Sprite.flip_h = false
			$Sprite.play("run")
	elif dir.x < 0:
		motion.x = max(motion.x - ACCELERATION,-MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play("run")		
	else:
		if $Light2D.is_visible():
			$Sprite.play("torch")
		else:
			$Sprite.play("idle")	
		friction = true
		motion.x = lerp(motion.x,0,0.2)		
	if is_on_floor():
		#print("ON_FLOOR")
		if dir.y < 0:

			motion.y = MAX_JUMP_HEIGHT
			
			if friction:
				motion.x = lerp(motion.x,0,0.2)
		else:
			
			if friction:
				
				motion.x = lerp(motion.x,0,0.2)
	else:
		$Sprite.play("jump")
	motion = move_and_slide(motion,UP)
	#print(joystick_move.)
		