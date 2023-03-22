extends Node2D


func closeMinigame():
	# fecha o minigame, desligando a indicação e limpando a instância da cena
	Global.minigameRunning = false
	queue_free()


# Função confirma a assinatura do usuário no termo de responsabilidade fazendo-o retornar ao jogo.
func _on_AssignButton_pressed():
	closeMinigame()
