extends Area2D

func _ready():
	$CollisionShape2D2/ok.visible = false

func _on_check_wrong2_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed and PhGlobal.checked ==6:
			$CollisionShape2D2/ok.visible = true
			PhGlobal.error +=1
