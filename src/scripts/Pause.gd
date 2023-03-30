extends Node2D

func closePause():
	get_tree().paused = false
	$'..'.is_paused = false
	queue_free()


func _on_Play_pressed():
	closePause()


func _on_Settings_pressed():
	var settings = load('res://scenes/Interface/Settings.tscn')
	settings = settings.instance()
	$"..".add_child(settings)


func _on_MainMenu_pressed():
	if get_tree().change_scene('res://scenes/Main.tscn') != OK:
		print ('An unexpected error occured when trying to switch to main scene')


func _input(event):
	if event.is_action_pressed("ui_cancel"):
		closePause()


func _ready():
	get_tree().paused = true
	$'..'.is_paused = true
	$Play.text = Locales.pause.play
	$Settings.text = Locales.pause.settings
	$MainMenu.text = Locales.pause.mainmenu
