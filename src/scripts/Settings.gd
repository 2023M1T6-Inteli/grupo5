extends Node2D

func _ready():
	$VolumeSlider.value = Music.volume_db
	Global.playerPaused = true
	$FullScreenButton.pressed = OS.window_fullscreen


func _on_FullScreenButton_toggled(button_pressed):
	OS.window_fullscreen = button_pressed


func _on_Return_pressed():
	Global.playerPaused = false
	queue_free()


func _on_VolumeSlider_value_changed(value):
	Music.volume_db = value
