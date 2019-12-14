extends Node2D


var resource = [0,0,0]
var combination = [30,30,30]
onready var bars = $CanvasLayer/Control

func _ready():
	#pass 
	for i in range(3):
		bars.get_child(i).value = resource[i]

func _physics_process(delta):
	pass

func add_resource(x:int):
	resource[x] += 30
	for i in range(3):
		bars.get_child(i).value = resource[i]
	var full =true
	for i in range(3):
		full = full and resource[i]>=combination[i]	
	if full :
		#print("FULL")
		$CanvasLayer/Control/CanvasLayer/Button.show()
		
func to_kraft():
	for i in range(3):
		resource[i]-=combination[i]
	for i in range(3):
		bars.get_child(i).value = resource[i]	
	#$CanvasLayer/Control/light_lifebar.show()
		
