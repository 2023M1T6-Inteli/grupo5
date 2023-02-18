extends Node2D

var score = 0
var playing = true
onready var currentBox = $Box
var lastBoxPosition = Vector2(630, 615)
var lastScale = 1
var deltaPosition = 0


func duplicateBox():
	cropBox()
	updateBox()
	lastBoxPosition = currentBox.position
	currentBox = load('res://scenes/minigames/stack/Box.tscn')
	currentBox = currentBox.instance()
	currentBox.set_script(load('res://scripts/minigames/Box.gd'))
	updateBox()
	add_child(currentBox)


func cropBox():
	deltaPosition = (lastBoxPosition.x - currentBox.position.x) * -1
	var percentage = abs(deltaPosition)/(500*lastScale)
	lastScale = lastScale * (1-percentage)
	print(lastScale)


func updateBox():
	currentBox.position.x -= deltaPosition/2
	currentBox.scale.x = lastScale


func win():
	playing = false
	currentBox.get_node('ColorRect').modulate = Color(0, 1, 0, 1)
	print('ganhou oba')
	

func lose():
	playing = false
	currentBox.get_node('ColorRect').modulate = Color(1, 0, 0, 1)
	print('perdeu af')


func _process(_delta):
	if playing:
		if currentBox.position.y >= lastBoxPosition.y:
			lose()
			return

		if currentBox.is_on_floor():
			score += 1
			if score == 10:
				win()
				return
			duplicateBox()

	$ScoreLabel.text = str(score)
