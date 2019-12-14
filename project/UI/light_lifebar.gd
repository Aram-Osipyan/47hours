extends ProgressBar

func _ready():
	value = $Timer.wait_time* 10
	max_value = value 
	pass

func _process(delta):
	value = $Timer.time_left * 10
	
func my_init():
	print("INIT")
	$Timer.wait_time = 10	
	$Timer.start()
	#max_value = value 
	print(value)
	
func _on_Timer_timeout():
	#$Timer.hide()
	get_tree().get_root().get_node("Main").timeout()