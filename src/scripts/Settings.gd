extends Node2D

func _ready():
	pass # Replace with function body.


func _on_FullScreenButton_toggled(button_pressed):
	OS.window_fullscreen = !OS.window_fullscreen
