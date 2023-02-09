extends Area2D



var dialogues = [
	{'name': 'Químico', 'text': "Olá! Tudo bem? Eu sou o seu gerente. Você deve ser o novo funcionário da Unipar, correto? Seja bem-vindo!"},
	{'name': 'Operador', 'text': "Olá! Sou eu mesmo. O novo funcionário! Estou aqui para aprender sobre o dia a dia na empresa e quais protocolos devo seguir para manter a minha segurança."},
	{'name': 'Químico', 'text': "Certo! Você já pode conhecer as áreas da nossa fábrica e suas regras. Mas antes, pegue os EPI's e fique seguro! Ocorreu um acidente em uma fábrica de uma de nossas concorrentes aqui em Camaçari e não queremos que o mesmo aconteça aqui! Vamos lá! Você tem muito a fazer!"},
	{'name': 'Operador', 'text': "Pode deixar! Estou super confiante para o primeiro dia!."}
]

var can_interact = false
var current = 0

func _on_npc_quimico_body_entered(_body): # essa função detecta a entrada do player
	$Stroke.visible = true
	can_interact = true

func _on_npc_quimico_body_exited(_body):
	$Stroke.visible = false
	can_interact = false
	
func load_dialogue():
	$dialog.visible = true
	_on_Button_pressed()
	
func close_dialogue():
	$dialog.visible = false
	current = 0

func next_dialogue():
	if current >= len(dialogues):
		close_dialogue()
		return
	$dialog/name.text = dialogues[current].get('name')
	$dialog/RichTextLabel.text = dialogues[current].get('text')
	current += 1

func _on_Button_pressed():
	next_dialogue()

func _input(event):
	if ($dialog.visible and event.is_action_released('skip')):
		next_dialogue()

	if (not $dialog.visible and can_interact and event.is_action_pressed("interact")):
		load_dialogue()
