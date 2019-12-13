extends Camera2D

#onready var screen_size()
onready var Player = get_node("Main/Player")
onready var last_p_pos = Player.get_global_position()

func _ready():
	var canvas_transform = get_viewport().get_canvas_transform()
	