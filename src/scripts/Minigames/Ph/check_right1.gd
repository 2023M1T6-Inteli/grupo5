extends Area2D

func _ready():
	$CollisionShape2D2/Sprite.visible = false

func _on_Area2D_input_event(viewport, event, shape_idx):	
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed and PhGlobal.checked ==6:
			$CollisionShape2D2/Sprite.visible = true
			PhGlobal.points +=1



