extends Area2D

func _ready():
	preload("res://UI.tscn")

func _on_fall_t_area_body_entered(body):
	
	if(body.name == "Player"):
		if(get_parent().get_node("f_tree_before") and get_parent().get_node("fallen_tree1") ):
			get_parent().get_node("ColorRect").set_frame_color(200)
			yield(get_tree().create_timer(2.0),"timeout")
			#get_parent().get_node("ColorRect").set_frame_color(200)
			get_parent().get_node("f_tree_before").queue_free()
			get_parent().get_node("ColorRect").set_frame_color(0)
			if(get_parent().get_node("fallen_tree1")):
				get_parent().get_node("fallen_tree1").show()
			queue_free()
	