extends Node2D


func _ready():
	# carrega os textos do termo de responsabilidade
	$Title.text = Locales.others.responsabilityTerm.title
	$Term.text = Locales.others.responsabilityTerm.term
	$Signature.text = Locales.others.responsabilityTerm.signature
	$Name.grab_focus()


func closeMinigame():
	# fecha o minigame, desligando a indicação e limpando a instância da cena
	Global.playerPaused = false
	Global.alreadyPlayed.append(Global.currentLevel)
	Global.currentLevel = 'Level1'
	queue_free()


func _input(event):
	if event.is_action_pressed('ui_cancel') or event.is_action_pressed('ui_accept'):
		if $ID.text != '':
			Global.playerId = $Name.text + '#' + $ID.text
			print(Global.playerId)
			closeMinigame()
		else:
			$Name.release_focus()
			$ID.grab_focus()
