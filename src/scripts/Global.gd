extends Node

var characterName = 'Gabriel'

# load das cenas dos minigames
var minigames = {
	'Stack': load('res://scenes/Minigames/Stack/Stack.tscn'),
	'Pallets': load('res://scenes/Minigames/Pallets/Pallets.tscn'),
	'Maze': load('res://scenes/Minigames/Maze/Maze.tscn'),
	'PhTest': load('res://scenes/Minigames/Ph/PhTest.tscn'),
	'ResponsabilityTerm': load("res://scenes/Minigames/ResponsabilityTerm/ResponsabilityTerm.tscn")
}

var playerPaused = false
var stackBox = load('res://scenes/Minigames/Stack/Box.tscn')
var currentLevel = 'Tutorial'
