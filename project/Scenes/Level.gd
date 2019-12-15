extends Node2D
var resource
#var big_resourcesa = 0
var big_resources:Array

onready var bar = $CanvasLayer/Control/ProgressBar

func _ready():	
	resource = 0


func add_resource(is_big,color_id):
	print("add resource")
	$get_paint.play()
	bar.value = resource
	if is_big:
		big_resources.append(color_id)
	else:
		resource+=1
	if resource>=3:	
		$CanvasLayer/Control/CanvasLayer/Button.show()
	bar.value = resource	
	
func to_kraft():	
	resource-=3
	bar.value = resource
	$Player/Light2D.show()
	$Player.call("fakel_set",true)
	
	if resource<3:
		$CanvasLayer/Control/CanvasLayer/Button.hide()
	#$CanvasLayer/Control/light_lifebar.show()
		
func timeout():
	print("timeout")
	$Player/Light2D.hide()
	$CanvasLayer/Control/light_lifebar.hide()
	$Player.call("fakel_set",false)
	
func get_colors(arr):
	var lamp = $AnimatedSprite	
	var sum =0 
	for i in big_resources:
		sum+=i
	lamp.play(String(sum+1))
	
	if sum >= 3:
		UI.fade_transition_scene("res://Scenes/Win.tscn")
		#get_tree().change_scene()
	print(String(sum))
func madness_full():
	get_tree().change_scene("res://Scenes/Chapter1.tscn")