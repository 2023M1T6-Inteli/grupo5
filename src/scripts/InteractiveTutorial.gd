extends Node2D

var move_right = false
var move_left = false
var move_up = false

var currentInstruction = 1


func _ready():
	$'Instruction3/Animation'.play('gif')


func _input(event):

	if currentInstruction == 3 and not Global.playerPaused:
		$'Instruction2/'.visible = false

	if currentInstruction > 2:
		return

	if event.is_action_pressed('interact'):
		currentInstruction += 1

	if currentInstruction > 1:
		return

	if event.is_action_pressed('move_right'):
		move_right = true
		$'Instruction1/Keys/D'.modulate = Color(0.5, 0.5, 0.5, 1)
		$'Instruction1/Arrows/Right'.modulate = Color(0.5, 0.5, 0.5, 1)

	if event.is_action_pressed('move_left'):
		move_left = true
		$'Instruction1/Keys/A'.modulate = Color(0.5, 0.5, 0.5, 1)
		$'Instruction1/Arrows/Left'.modulate = Color(0.5, 0.5, 0.5, 1)

	if event.is_action_pressed('jump'):
		move_up = true
		$'Instruction1/Keys/W'.modulate = Color(0.5, 0.5, 0.5, 1)
		$'Instruction1/Arrows/Up'.modulate = Color(0.5, 0.5, 0.5, 1)


func _process(_delta):

	if currentInstruction > 1:
		return

	if move_right and move_left and move_up:
		currentInstruction += 1
		yield(get_tree().create_timer(1), 'timeout')
		get_node('Instruction' + str(currentInstruction-1)).visible = false
