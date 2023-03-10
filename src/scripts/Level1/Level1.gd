extends Node2D


func canPlayMinigame():
	return (len($Player.PPEs) >= 6)


func _ready():
	Music.change('Level1')
	$HUD/Clipboard.slideToScreen()
