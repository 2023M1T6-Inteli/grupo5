extends Node2D


func loadMenuLanguage():
	# configura os textos dos botões de acordo com o idiomas escolhida
	$Title.text = Locales.settings.settings
	$Volume.text = Locales.settings.volume
	$Fullscreen.text = Locales.settings.fullscreen


func closeSettings():
	Global.playerPaused = false
	queue_free()


func _on_FullScreenButton_toggled(button_pressed):
	OS.window_fullscreen = button_pressed


func _on_Return_pressed():
	closeSettings()


func _on_VolumeSlider_value_changed(value):
	Music.volume_db = value


func _input(event):
	if event.is_action_pressed("ui_cancel"):
		closeSettings()


func _ready():
	$VolumeSlider.value = Music.volume_db
	$FullScreenButton.pressed = OS.window_fullscreen
	loadMenuLanguage()