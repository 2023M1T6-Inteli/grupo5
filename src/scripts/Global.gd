extends Node

var characterName = 'Gabriel'

signal update_score()

# load das cenas dos minigames
var minigames = {
	'Stack': load('res://scenes/Minigames/Stack/Stack.tscn'),
	'Pallets': load('res://scenes/Minigames/Pallets/Pallets.tscn'),
	'Maze': load('res://scenes/Minigames/Maze/Maze.tscn'),
	'PhTest': load('res://scenes/Minigames/Ph/PhTest.tscn'),
	'ResponsabilityTerm': load("res://scenes/Minigames/ResponsabilityTerm/ResponsabilityTerm.tscn")
}

var playerPaused = false
var currentLevel = 'Tutorial'
var score = 0 setget setScore


func setScore(newScore):
	if newScore < 0:
		newScore = 0

	score = newScore
	emit_signal('update_score')
