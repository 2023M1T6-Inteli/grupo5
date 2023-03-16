extends Area2D

var rotating = false


func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if not event is InputEventMouseButton:
		return

	if not event.pressed:
		return
	
	if rotating==true:
		return

	$Tween.interpolate_property(
		self,
		"rotation_degrees",
		rotation_degrees,
		rotation_degrees+90,
		0.3
	)

	$Tween.start()
	rotating = true
	
func _on_Tween_tween_completed(event, _key):
	rotating = false
