extends Node2D

func closeMinigame():
	# fecha o minigame, desligando a indicação e limpando a instância da cena
	Global.minigameRunning = false
	get_parent().get_node('Clipboard').visible = true
	queue_free()


func _on_ContinueButton_pressed():
	closeMinigame()
	
func _ready():
	$WinScreen.visible = false

func _process(_delta):
	if PhGlobal.points ==6:
		$WinScreen.visible = true
