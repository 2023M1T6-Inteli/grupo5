extends CanvasLayer

var is_paused = false


func _ready():
	# warning-ignore:return_value_discarded
	Global.connect('update_score', self, 'update_score')
	update_score()


func pauseGame():
	var settings = load('res://scenes/Interface/Settings.tscn')
	settings = settings.instance()
	add_child(settings)


func update_score():
	print(Global.score)
	$Score.text = str(Global.score)


func _on_PauseButton_pressed():
	pauseGame()


func _input(event):
	if event.is_action_pressed('pause'):
		pauseGame()
