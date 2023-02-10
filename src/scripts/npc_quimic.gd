extends Area2D

# diálogos dos personagens
var dialogues = [
	{'name': 'Químico', 'text': 'Olá! Tudo bem? Eu sou o seu gerente. Você deve ser o novo funcionário da Unipar, correto? Seja bem-vindo!'},
	{'name': 'Operador', 'text': 'Olá! Sou eu mesmo. O novo funcionário! Estou aqui para aprender sobre o dia a dia na empresa e quais protocolos devo seguir para manter a minha segurança.'},
	{'name': 'Químico', 'text': 'Certo! Você já pode conhecer as áreas da nossa fábrica e suas regras. Mas antes, pegue os EPI\'s e fique seguro! Ocorreu um acidente em uma fábrica de uma de nossas concorrentes aqui em Camaçari e não queremos que o mesmo aconteça aqui! Vamos lá! Você tem muito a fazer!'},
	{'name': 'Operador', 'text': 'Pode deixar! Estou super confiante para o primeiro dia!.'}
]

# flag para indicar se o jogador está na área de interação com o NPC
var can_interact = false

# representa o diálogo atual (índice na lista)
var current_dialog = 0


func _on_npc_quimico_body_entered(_body):
	# quando o player se aproximar, destaca o NPC e liga a interação
	$Stroke.visible = true
	can_interact = true


func _on_npc_quimico_body_exited(_body):
	# quando o player se aproximar, destaca o NPC e liga a interação
	$Stroke.visible = false
	can_interact = false


func load_dialogue():
	# inicia o diálogo
	$dialog.visible = true
	next_dialogue()


func close_dialogue():
	# finaliza o diálogo
	$dialog.visible = false
	current_dialog = 0


func next_dialogue():
	# passa para a próxima frase do diálogo
	if current_dialog >= len(dialogues):
		# se acabaram as frases, finaliza o diálogo
		close_dialogue()
		return

	# altera o nome do personagem para o da fala atual
	$dialog/name.text = dialogues[current_dialog].get('name')
	# altera o texto para a fala atual
	$dialog/RichTextLabel.text = dialogues[current_dialog].get('text')
	# atualiza o índice do diálogo atual
	current_dialog += 1


func _on_Button_pressed():
	# ao pressionar o botão invisível, avança o diálogo
	next_dialogue()


func _input(event):
	if ($dialog.visible and event.is_action_released('skip')):
		# ao pressionar um botão de skip, avança o diálogo
		next_dialogue()

	if (not $dialog.visible and can_interact and event.is_action_pressed('interact')):
		# estando na área de interação e apertando o botão de interação, inicia o diálogo
		load_dialogue()
