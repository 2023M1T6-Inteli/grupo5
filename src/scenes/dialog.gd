extends Node2D
var dialog_box = preload("res://scenes/Dialog_box.tscn")
var inst = null
var on_screen = false
var current_dialog = 0

var dialogue := {
	0 : {
		"name"  : "Químico Experiente",
		"photo" : "velho_de_valeco.png",
		"question" : "Olá! Tudo bem? Eu sou o seu gerente. Você deve ser o novo funcionário da Unipar, correto? Seja bem-vindo!",
		"options"  : [
			{"text" : "Olá! Sou eu mesmo. O novo funcionário! Estou aqui para aprender sobre o dia a dia na empresa e quais protocolos devo seguir para manter a minha segurança .", "next": 1 },
		]
	},

	1 : {
		"name"  : "Químico Experiente",
		"photo" : "velho_de_valeco.png",
		"question" : "Certo! Você já pode conhecer as áreas da nossa fábrica e suas regras. Mas antes, pegue os EPI's e fique seguro! Ocorreu um acidente em uma fábrica de uma de nossas concorrentes aqui em Camaçari e não queremos que o mesmo acnteça aqui! Vamos lá! Você tem muito a fazer! ",
		"options"  : [
			{"text" : "Pode deixar! Estou super confiante para o primeiro dia!.", "next": -1 },
		]
	},
}

func start_dialog() -> void:
	on_screen = false
	inst = dialog_box.instance()
	inst.conversation_data = dialogue
	$ui_canvas/Control.add_child(inst)
	
func change_dialog():

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		inst = dialog_box.instance()
		inst.conversation_data = dialogue
		$ui_canvas/Control.add_child(inst)
