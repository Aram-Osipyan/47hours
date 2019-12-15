extends Node2D

export var count = 1


func _on_Area2D_body_entered(body):
	if(body.name == "Player"):
		get_tree().get_root().get_node("Main/CanvasLayer/ColorRect").set_frame_color(count)
		
		
		
		
		