extends Area2D

var dialogues = [
	"Olá! Tudo bem? Eu sou o seu gerente. Você deve ser o novo funcionário da Unipar, correto? Seja bem-vindo!",
	"Olá! Sou eu mesmo. O novo funcionário! Estou aqui para aprender sobre o dia a dia na empresa e quais protocolos devo seguir para manter a minha segurança.",
	"Certo! Você já pode conhecer as áreas da nossa fábrica e suas regras. Mas antes, pegue os EPI's e fique seguro! Ocorreu um acidente em uma fábrica de uma de nossas concorrentes aqui em Camaçari e não queremos que o mesmo acnteça aqui! Vamos lá! Você tem muito a fazer!",
	"Pode deixar! Estou super confiante para o primeiro dia!."
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

func _process(_delta):
	if (not $dialog.visible and can_interact and Input.is_action_pressed("interact")):
		print('teste')
		load_dialogue()

func _on_Button_pressed():
	if current >= len(dialogues):
		close_dialogue()
		return
	$dialog/RichTextLabel.text = dialogues[current]
	current += 1
