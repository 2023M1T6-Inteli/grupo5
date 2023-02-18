extends Area2D

# flag para indicar se o jogador está na área de interação com o NPC
var canInteract = false

# representa o diálogo atual (índice na lista)
var currentDialog = 0

var touch_interact = false


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
	$'../Clipboard'.visible = false
	$Dialog.visible = true
	get_parent().get_node("HUD").hide()
	nextDialog()


func closeDialog():
	# finaliza o diálogo
	$'../Clipboard'.visible = true
	$Dialog.visible = false
	get_parent().get_node("HUD").show()
	currentDialog = 0


func nextDialog():
	# passa para a próxima frase do diálogo
	if currentDialog >= len(Locales.dialogs):
		# se acabaram as frases, finaliza o diálogo
		closeDialog()
		return

	# altera o nome do personagem para o da fala atual
	var characterName = Locales.characters.get(Locales.dialogs[currentDialog].character)
	$Dialog/Name.bbcode_text = '[center]' + characterName + '[/center]'
	# altera o texto para a fala atual
	$Dialog/DialogText.text = Locales.dialogs[currentDialog].text
	# atualiza o índice do diálogo atual
	currentDialog += 1


func _on_Button_pressed():
	# ao pressionar o botão invisível, avança o diálogo
	nextDialog()


func _input(event):
	if event.is_action_released('interact') or touch_interact:
		if $Dialog.visible:
			# se o diálogo já está ativo, avança o diálogo
			nextDialog()
		elif canInteract:
			# se o diálogo não está ativo e o personagem está na área de interação, carrega o diálogo
			loadDialog()


func _on_interact_pressed():
	touch_interact = true
	


func _on_interact_released():
	touch_interact = false
