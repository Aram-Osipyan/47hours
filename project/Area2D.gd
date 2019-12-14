extends Area2D
#enum Banks {RED =0 ,GREEN=1,BLUE=2}
signal my_signal(x)
export var is_big = true
export var color_id = 1

#<source_node>.connect(<signal_name>, <target_node>, <target_function_name>)
func _ready():
	self.connect("my_signal",get_parent(),"add_resource")
	
func _on_Area2D_body_entered(body):
	if(body.name == "Player"):
	
		#body.get_node("Light2D").set_visible(true)
		#emit_signal("my_signal",is_big)
		get_parent().call("add_resource",is_big,color_id)
		print("on_collide")
		queue_free()
		

