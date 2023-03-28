extends Node2D

func loadMenuLanguage():
	# configura os textos dos botões de acordo com o idiomas escolhida
	$PlayButton.text = Locales.buttons.play
	$QuitButton.text = Locales.buttons.quit
	$SettingsButton.text = Locales.buttons.settings


func changeLanguage(id):
	# muda o idioma de acordo com a escolha
	Locales.language = Locales.getAvailableLanguages()[id]
	Locales.loadLanguage()
	# atuailza o menu
	loadMenuLanguage()


func _on_PlayButton_pressed():
	# ao apertar start, abre a escolha de personagem
	if get_tree().change_scene('res://scenes/Character.tscn') != OK:
		print ('An unexpected error occured when trying to switch to next scene')


func _on_SettingsButton_pressed():
		var settings = load('res://scenes/Interface/Settings.tscn')
		settings = settings.instance()
		$"..".add_child(settings)


func _on_QuitButton_pressed():
	# ao apertar sair, fecha o jogo
	get_tree().quit()


func _ready():
	loadMenuLanguage()
	# pega a referência do menu de opções
	#var popup = $LanguageButton.get_popup()
	# limpa as opções
	#popup.clear()

	# conecta a seleção de um idioma com a função de mudar o idiomas
	#popup.connect('id_pressed', self, 'changeLanguage')

	# adiciona os idiomas disponíveis nas opções
	#for language in Locales.getAvailableLanguages():
	#	popup.add_item(language)

	$PlayButton.grab_focus()
