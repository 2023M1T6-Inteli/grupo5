extends Area2D

# flag para indicar se o jogador está na área de interação com o NPC
var canInteract = false

# representa o diálogo atual (índice na lista)
var currentDialog = 0

onready var locales = $"../Locales"


func _on_npc_quimico_body_entered(_body):
	# quando o player se aproximar, destaca o NPC e liga a interação
	$Stroke.visible = true
	canInteract = true


func _on_npc_quimico_body_exited(_body):
	# quando o player se aproximar, destaca o NPC e liga a interação
	$Stroke.visible = false
	canInteract = false


func loadDialogue():
	# inicia o diálogo
	$Dialog.visible = true
	nextDialogue()


func closeDialogue():
	# finaliza o diálogo
	$Dialog.visible = false
	currentDialog = 0


func nextDialogue():
	# passa para a próxima frase do diálogo
	if currentDialog >= len(locales.dialogs):
		# se acabaram as frases, finaliza o diálogo
		closeDialogue()
		return

	# altera o nome do personagem para o da fala atual
	$Dialog/Name.text = locales.characters.get(locales.dialogs[currentDialog].get('character'))
	# altera o texto para a fala atual
	$Dialog/RichTextLabel.text = locales.dialogs[currentDialog].get('text')
	# atualiza o índice do diálogo atual
	currentDialog += 1


func _on_Button_pressed():
	# ao pressionar o botão invisível, avança o diálogo
	nextDialogue()


func _input(event):
	if ($Dialog.visible and event.is_action_released('skip')):
		# ao pressionar um botão de skip, avança o diálogo
		nextDialogue()

	if (not $Dialog.visible and canInteract and event.is_action_pressed('interact')):
		# estando na área de interação e apertando o botão de interação, inicia o diálogo
		loadDialogue()
