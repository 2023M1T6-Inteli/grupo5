extends Node2D

var score = 0
var playing = true
onready var currentBox = $Box
var lastBoxPosition = Vector2(630, 610)
var currentRectSize = Vector2(500, 50)
var currentRectPosition = -250
var currentCollisionShape = Vector2(250, 25)
var currentCollisionPosition = 0


func duplicateBox():
	cropBox()
	lastBoxPosition = currentBox.position
	currentBox = preload('res://scenes/minigames/stack/Box.tscn')
	currentBox = currentBox.instance()
	currentBox.set_script(load('res://scripts/minigames/Box.gd'))
	add_child(currentBox)
	updateBox()


func cropBox():
	var deltaPosition = (lastBoxPosition.x - currentBox.position.x) * -1
	currentRectSize = Vector2(currentRectSize.x-abs(deltaPosition), 50)

	if deltaPosition < 0:
		currentRectPosition -= deltaPosition

	currentCollisionShape = Vector2((currentCollisionShape.x-abs(deltaPosition)/2), 25)
	currentCollisionPosition -= (deltaPosition/2)
	updateBox()

func updateBox():
	currentBox.get_node('ColorRect').rect_size = currentRectSize
	currentBox.get_node('ColorRect').rect_position.x = currentRectPosition

	currentBox.get_node('CollisionShape2D').shape.extents = currentCollisionShape
	currentBox.get_node('CollisionShape2D').position.x = currentCollisionPosition

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
