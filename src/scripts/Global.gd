extends Node

var characterName = 'Gabriel'

# load das cenas dos minigames
var minigames = {
	'Stack': load("res://scenes/Minigames/Stack/Stack.tscn"),
	'Pallets': load("res://scenes/Minigames/Pallets/Pallets.tscn")
}

var minigameRunning = false
var stackBox = load("res://scenes/Minigames/Stack/Box.tscn")
var currentLevel = 'Level1'
