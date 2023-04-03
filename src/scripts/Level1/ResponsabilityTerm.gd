extends Node2D


func _ready():
	# carrega os textos do termo de responsabilidade
	$characterName.text = Global.characterName
	$Title.text = Locales.others.responsabilityTerm.title
	$Term.text = Locales.others.responsabilityTerm.term
	$Signature.text = Locales.others.responsabilityTerm.signature


func closeMinigame():
	# fecha o minigame, desligando a indicação e limpando a instância da cena
	Global.playerPaused = false
	Global.alreadyPlayed.append(Global.currentLevel)
	Global.currentLevel = 'Level1'
	queue_free()


func _on_Signature_pressed():
	# função confirma a assinatura do usuário no termo de responsabilidade fazendo-o retornar ao jogo.
	$characterName.visible = true
	yield(get_tree().create_timer(1), "timeout")
	closeMinigame()
