extends Node2D


var canInteract = false


func closeMinigame():
	# fecha o minigame, desligando a indicação e limpando a instância da cena
	Global.minigameRunning = false
	queue_free()
	
func _input(event):
	if event.is_action_pressed('ui_cancel'):
		# tecla ESC fecha o minigame
		closeMinigame()
	
func _on_continueButton_pressed():
	closeMinigame()

func _on_Parking_body_entered(body):
	if body.name == "Empilhadeira":
		$WinScreen.visible = true

func _ready():
	# desabilita a visibilidade da tela de vencedor
	$WinScreen.visible = false
