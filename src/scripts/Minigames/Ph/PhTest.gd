extends Node2D

var tapeSelected = false
var tapesTypes = []


func _ready():
	# torna a prancheta invisivel ao iniciar o jogo
	get_parent().get_node('Clipboard').visible = false


func closeMinigame():
	# fecha o minigame, desligando a indicação e limpando a instância da cena
	get_tree().paused = false
	get_parent().get_node('Clipboard').visible = true
	Global.currentLevel = 'Level3'
	queue_free()


func _input(event):
	if event.is_action_pressed('ui_cancel'):
		# tecla ESC fecha o minigame
		closeMinigame()


func _on_Bowl_pressed():
	if tapeSelected:
		return

	# ao clicar no bowl, cria uma nova fita e a adiciona na cena

	tapeSelected = true
	var newTape = load("res://scenes/Minigames/Ph/Tape.tscn").instance()
	newTape.selected = true
	newTape.connect('tapeInserted', self, 'onTapeInserted')
	add_child(newTape)

	# remove uma fita de dentro do bowl
	get_tree().get_nodes_in_group('TapeInsideBowl')[0].queue_free()


func onTapeInserted(type):
	# ao inserir uma fita, salva o tipo dela
	tapeSelected = false
	tapesTypes.append(type)

	if len(tapesTypes) >= 6:
		# se todas as fitas foram inseridas, inicia a validação
		yield(get_tree().create_timer(1), 'timeout')
		for child in get_children():
			child.queue_free()

		var validatePh = load('res://scenes/Minigames/Ph/ValidatePh.tscn').instance()
		call_deferred('add_child', validatePh)
