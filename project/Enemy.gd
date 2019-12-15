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
signal atack;

func _ready():
	self.connect("atack",get_parent().get_node("Player"),"on_atack")
func movement():
	var jump_cond = true

	velocity.x = Player.get_global_position().x - get_global_position().x
	
	if velocity.x <0:
		$Sprite.flip_h = true
		$Sprite.play("move")
	else:
		$Sprite.flip_h = false
		$Sprite.play("move")
	
	
	if abs(get_global_position().x - last_vel.x) <0.14:
		jump_cond = false
		$Sprite.play("idle")

	if is_on_wall() and is_on_floor() and jump_cond :
		velocity.y = MAX_JUMP_HEIGHT
		
	last_vel.x = get_global_position().x
	
	if(velocity.x <0):
		Ray.rotation = -PI
	else:
		Ray.rotation = 0
	
	

func _physics_process(delta):
	velocity.y += GRAVITY

	if flag:
		movement()
		
	velocity = move_and_slide(velocity,UP)
	if velocity and get_slide_count()!=0:
		for i in get_slide_count():
			var collision = get_slide_collision(i)
			if collision and collision.get_collider().name == "Player":
				#$Sprite.play("die")
				queue_free()


func _on_Area_body_entered(body):
	if(body.name == "Player"):
		$noice.play()
		flag = true
		emit_signal("atack")	
