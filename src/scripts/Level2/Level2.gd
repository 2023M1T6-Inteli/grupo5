extends Node2D


func canPlayMinigame():
	return true

func _ready():
	$HUD/Clipboard.slideToScreen()
