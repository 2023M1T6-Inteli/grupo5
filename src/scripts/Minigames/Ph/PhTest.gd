extends Node2D

var tapeSelected = false
var tapesTypes = []


func _on_Bowl_pressed():
	if tapeSelected:
		return

	tapeSelected = true
	var newTape = load("res://scenes/Minigames/Ph/Tape.tscn").instance()
	newTape.selected = true
	newTape.connect('tapeInserted', self, 'onTapeInserted')
	add_child(newTape)

	get_tree().get_nodes_in_group('TapeInsideBowl')[0].queue_free()


func onTapeInserted(type):
	tapeSelected = false
	tapesTypes.append(type)

	if len(tapesTypes) >= 6:
		yield(get_tree().create_timer(1), 'timeout')
		for child in get_children():
			child.queue_free()

		var validatePh = load('res://scenes/Minigames/Ph/ValidatePh.tscn').instance()
		call_deferred('add_child', validatePh)
