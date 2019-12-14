extends Control
signal kraft
class_name resources

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("kraft",get_parent().get_parent(),"to_kraft")
	$ProgressBar.value = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	#get_node("CanvasLayer/Button").hide()	
	get_node("light_lifebar").call("my_init")
	get_node("light_lifebar").show()
	emit_signal("kraft")
