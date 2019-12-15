extends Node2D

export var count = 1


func _on_Area2D_body_entered(body):
	if(body.name == "Player"):
		get_parent().get_node("ColorRect").set_frame_color(count)
		
		
		
		
		