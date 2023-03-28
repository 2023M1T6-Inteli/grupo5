extends CanvasLayer


func _on_PauseButton_pressed():
	var settings = load('res://scenes/Interface/Settings.tscn')
	settings = settings.instance()
	add_child(settings)
	$Settings.position = Vector2(0, 0)
