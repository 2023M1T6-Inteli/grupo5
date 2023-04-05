extends Node2D

func canPlayMinigame():
	return true

func _ready():
	Music.change('Quiz')
	Global.currentLevel = 'Level4'
