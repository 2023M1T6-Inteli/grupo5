extends Node2D

func _ready():
	pass # Replace with function body.


func _on_FullScreenButton_toggled(_button_pressed):
	OS.window_fullscreen = !OS.window_fullscreen


func _on_Return_pressed():
	queue_free()


func _on_VolumeSlider_value_changed(value):
	pass
