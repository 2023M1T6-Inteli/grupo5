extends Area2D

# flag para indicar se o jogador está na área de interação com o NPC
var canInteract = false

# representa o diálogo atual (índice na lista)
var currentDialog = 0

# flag para indicar se a frase atual foi finalizada
var phraseFinished = false


func _on_npc_quimico_body_entered(_body):
	# quando o player se aproximar, destaca o NPC e liga a interação
	$Stroke.visible = true
	canInteract = true
	get_parent().get_node("HUD/Gamepad/interact").modulate = Color(1, 1, 0.4)


func _on_npc_quimico_body_exited(_body):
	# quando o player se aproximar, destaca o NPC e liga a interação
	$Stroke.visible = false
	canInteract = false
	get_parent().get_node("HUD/Gamepad/interact").modulate = Color(1, 1, 1)


func loadDialog():
	# inicia o diálogo
	$"../HUD/Clipboard".visible = false
	$"../HUD/Dialog".visible = true
	get_parent().get_node("HUD/Gamepad").hide()
	nextDialog()


func closeDialog():
	# finaliza o diálogo
	$"../HUD/Clipboard".visible = true
	$"../HUD/Dialog".visible = false
	get_parent().get_node("HUD/Gamepad").show()
	currentDialog = 0


func nextDialog():
	# passa para a próxima frase do diálogo
	if currentDialog >= len(Locales.dialogs):
		# se acabaram as frases, finaliza o diálogo
		closeDialog()
		return

	# altera o nome do personagem para o da fala atual
	var characterName = Locales.characters.get(Locales.dialogs[currentDialog].character)
	$"../HUD/Dialog/Name".bbcode_text = '[center]' + characterName + '[/center]'
	# altera o texto para a fala atual
	$"../HUD/Dialog/DialogText".text = Locales.dialogs[currentDialog].text

	# reseta a flag
	phraseFinished = false
	# deixa o texto invisível
	$"../HUD/Dialog/DialogText".visible_characters = 0

	while $"../HUD/Dialog/DialogText".visible_characters < len($"../HUD/Dialog/DialogText".text):
		# incrementa os caracteres visíveis: efeito de escrever
		$"../HUD/Dialog/DialogText".visible_characters += 1

		# espera um tempo para o próximo caracter
		$Timer.start()
		yield($Timer, 'timeout')

	# ao finalizar, liga a flag de finalizado
	phraseFinished = true

	# atualiza o índice do diálogo atual
	currentDialog += 1


func _on_Button_pressed():
	# ao pressionar o botão invisível, avança o diálogo
	if phraseFinished:
		# se a frase já está finalizada, avança o diálogo
		nextDialog()
	else:
		# senão, finaliza a frase
		$"../HUD/Dialog/DialogText".visible_characters = len($"../HUD/Dialog/DialogText".text)


func _input(event):
	if event.is_action_released('interact'):
		if $"../HUD/Dialog".visible:
			# se o diálogo já está ativo, avança o diálogo
			if phraseFinished:
				# se a frase já está finalizada, avança o diálogo
				nextDialog()
			else:
				# senão, finaliza a frase
				$"../HUD/Dialog/DialogText".visible_characters = len($"../HUD/Dialog/DialogText".text)
		elif canInteract:
			# se o diálogo não está ativo e o personagem está na área de interação, carrega o diálogo
			loadDialog()
