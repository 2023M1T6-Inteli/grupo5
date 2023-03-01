extends Node2D


func canPlayMinigame():
	return (len($Player.PPEs) >= 6)
