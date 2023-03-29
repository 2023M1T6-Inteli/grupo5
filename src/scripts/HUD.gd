extends CanvasLayer

var is_paused = false


func pauseGame():
	var settings = load('res://scenes/Interface/Settings.tscn')
	settings = settings.instance()
	add_child(settings)

func _on_PauseButton_pressed():
	pauseGame()
	
func _input(event):
	if event.is_action_pressed('pause'):
		pauseGame()
