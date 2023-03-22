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

	if selected:
		position = get_global_mouse_position()


func _on_area_entered(area: Area2D):
	if not active:
		return

	if area.get_node('Tape').visible:
		return

	active = false

	randomize()
	var type = types[randi() % types.size()]
	$Sprite.texture = load('res://assets/Minigames/PhTest/phTape' + type + '.png')
	area.get_node('Tape').texture = load('res://assets/Minigames/PhTest/phTape' + type + '.png')
	area.get_node('Tape').visible = true
	emit_signal('tapeInserted', type)
	queue_free()
