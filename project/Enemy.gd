extends KinematicBody2D
const UP = Vector2(0,-1)
const GRAVITY = 20
const MAX_SPEED = 100
const ACCELERATION = 50
const MAX_JUMP_HEIGHT = -400
var velocity = Vector2()
onready var Player = get_tree().get_root().get_node("Main/Player")
onready var Ray = $RayCast2D
var last_vel = Vector2()
var flag = false

func movement():
	var jump_cond = true
	
	velocity.y += GRAVITY
	velocity.x = Player.get_global_position().x - get_global_position().x
	
	if velocity.x <0:
		$Sprite.flip_h = true
		$Sprite.play("move")
	else:
		$Sprite.flip_h = false
		$Sprite.play("move")
	
	
	if abs(get_global_position().x - last_vel.x) <0.14:
		jump_cond = false
		
	
	
	if is_on_wall() and is_on_floor() and jump_cond :
		velocity.y = MAX_JUMP_HEIGHT
		
	last_vel.x = get_global_position().x
	#velocity.x = velocity.x.normalized()
	
	if(velocity.x <0):
		Ray.rotation = -PI
	else:
		Ray.rotation = 0
	
	
	velocity = move_and_slide(velocity,UP)
	if velocity and get_slide_count()!=0:
		for i in get_slide_count():
			var collision = get_slide_collision(i)
			if collision and collision.get_collider().name == "Player":
				queue_free()
func _physics_process(delta):
	if flag:
		movement()
		#Ray.set_enabled(true)
	#else:
	#	Ray.set_enabled(false)
	#if Ray.is_colliding():
	#	if Ray.get_collider().name == "Player":
		#	queue_free()
	

func _on_Area_body_entered(body):
	if(body.name == "Player"):
		flag = true
