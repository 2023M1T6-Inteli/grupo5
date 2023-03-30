extends CanvasLayer

var is_paused = false


func _ready():
	# warning-ignore:return_value_discarded
	Global.connect('update_score', self, 'update_score')
	update_score()


func pauseGame():
	if is_paused:
		return
	var pause = load('res://scenes/Interface/Pause.tscn')
	pause = pause.instance()
	add_child(pause)


func update_score():
	$Score.text = str(Global.score)
	$ScoreLabel.modulate = Color(0.95, 0.98, 0.04, 1)
	$Score.modulate = Color(0.95, 0.98, 0.04, 1)
	yield(get_tree().create_timer(0.5), 'timeout')
	$ScoreLabel.modulate = Color(1, 1, 1, 1)
	$Score.modulate = Color(1, 1, 1, 1)


func _on_PauseButton_pressed():
	pauseGame()


func _input(event):
	if event.is_action_pressed('pause'):
		pauseGame()
