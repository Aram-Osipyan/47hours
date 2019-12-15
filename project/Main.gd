extends Node2D
#export

var resource = 0;
#var big_resourcesa = 0
var big_resources:Array

onready var bar = $CanvasLayer/Control/ProgressBar

func _ready():
	$AnimatedSprite.play("1")


func add_resource(is_big,color_id):
	print("add resource")
	resource += 1
	bar.value = resource
	if is_big:
		big_resources.append(color_id)
	else:
		resource+=1
	if resource>=3:	
		$CanvasLayer/Control/CanvasLayer/Button.show()
	
func to_kraft():	
	resource-=3
	bar.value = resource
	$Player/Light2D.show()
	$Player.call("fakel_set",true)
	
	if resource<3:
		$CanvasLayer/Control/CanvasLayer/Button.hide()
	#$CanvasLayer/Control/light_lifebar.show()
		
func timeout():
	$Player/Light2D.hide()
	$CanvasLayer/Control/light_lifebar.hide()
	$Player.call("fakel_set",false)
func get_colors(arr):
	var lamp = $AnimatedSprite	
	var sum =0 
	for i in big_resources:
		sum+=i
	lamp.play(String(sum+1))
	print(String(sum))