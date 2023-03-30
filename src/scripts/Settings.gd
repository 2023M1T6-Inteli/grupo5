extends Node2D


func loadMenuLanguage():
	# configura os textos dos botões de acordo com o idiomas escolhida
	$Title.text = Locales.settings.settings
	$Volume.text = Locales.settings.volume
	$Fullscreen.text = Locales.settings.fullscreen
	$LanguageButton.text = Locales.settings.language


func changeLanguage(id):
	# muda o idioma de acordo com a escolha
	Locales.language = Locales.getAvailableLanguages()[id]
	Locales.loadLanguage()
	# atuailza o menu
	loadMenuLanguage()


func closeSettings():
	get_tree().paused = false
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
	# pega a referência do menu de opções
	var popup = $LanguageButton.get_popup()
	# limpa as opções
	popup.clear()

	# conecta a seleção de um idioma com a função de mudar o idiomas
	popup.connect('id_pressed', self, 'changeLanguage')

	# adiciona os idiomas disponíveis nas opções
	for language in Locales.getAvailableLanguages():
		popup.add_item(language)
