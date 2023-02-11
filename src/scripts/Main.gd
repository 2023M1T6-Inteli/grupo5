extends Node2D


func _ready():
	$PlayButton.text = Locales.buttons.play
	$QuitButton.text = Locales.buttons.quit
	$LanguageButton.text = Locales.buttons.selectLanguage

	var popup = $LanguageButton.get_popup()
	popup.clear()
	if popup.get_signal_connection_list('id_pressed').empty():
		popup.connect("id_pressed", self, "changeLanguage")

	for language in Locales.getAvailableLanguages():
		popup.add_item(language)


func changeLanguage(id):
	Locales.language = Locales.getAvailableLanguages()[id]
	Locales.loadLanguage()
	_ready()


func _on_PlayButton_pressed():
	if get_tree().change_scene("res://scenes/Level1.tscn") != OK:
		print ("An unexpected error occured when trying to switch to level 1 scene")


func _on_QuitButton_pressed():
	get_tree().quit()
