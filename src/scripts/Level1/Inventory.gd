extends Node

func _ready():
	for PPE in get_children():
		PPE.visible = true
		PPE.get_node('Animation').seek(0.5, true)
		PPE.get_node('Animation').stop()

func _process(_delta):
	for PPE in get_children():
		if PPE.PPEName in $"../../../Player".PPEs:
			PPE.modulate = Color(1, 1, 1, 1)
