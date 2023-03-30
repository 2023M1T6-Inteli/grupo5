extends Node2D

var canInteract = false


func closeMinigame():
	# fecha o minigame, desligando a indicação e limpando a instância da cena
	get_tree().paused = false
	Global.currentLevel = 'Level2'
	queue_free()


func _on_continueButton_pressed():
	closeMinigame()


func _on_Parking_body_entered(body):
	if body.name == 'Forklift':
		$WinScreen.visible = true
		$WinScreen/continueButton.grab_focus()


func _input(event):
	if event.is_action_pressed('ui_cancel'):
		# tecla ESC fecha o minigame
		closeMinigame()


func _ready():
	# desabilita a visibilidade da tela de vencedor
	$WinScreen.visible = false
	$Clipboard.slideToScreen()


func _on_Button_pressed():
	# Fechar o minigame a partir do botão X
	closeMinigame()
