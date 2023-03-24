extends Area2D

var selected = false
var active = true

signal tapeInserted(type)

var types = [
	'Right',
	'Wrong',
	'Wrong2'
]


func _process(_delta):
	if not active:
		return

	# se a fita estiver selecionada, ela segue o mouse
	if selected:
		position = get_global_mouse_position()


func _on_area_entered(area: Area2D):
	if not active:
		return

	if area.get_node('Tape').visible:
		# se a fita estiver num becker, não faz nada
		return

	# quando a fita entrar no becker

	active = false

	# gera cores aleatórias para o resultado do teste
	randomize()
	var type = types[randi() % types.size()]
	$Sprite.texture = load('res://assets/Minigames/PhTest/phTape' + type + '.png')
	area.get_node('Tape').texture = load('res://assets/Minigames/PhTest/phTape' + type + '.png')
	area.get_node('Tape').visible = true
	emit_signal('tapeInserted', type)
	queue_free()
