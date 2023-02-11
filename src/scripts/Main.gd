extends Node2D


func _ready():
	# configura os textos dos botões de acordo com o idiomas escolhida
	$PlayButton.text = Locales.buttons.play
	$QuitButton.text = Locales.buttons.quit
	$LanguageButton.text = Locales.buttons.selectLanguage

	# pega a referência do menu de opções
	var popup = $LanguageButton.get_popup()
	# limpa as opções
	popup.clear()
	
	# se ainda não existe a conexão
	if popup.get_signal_connection_list('id_pressed').empty():
		# conecta a seleção de um idioma com a função de mudar o idiomas
		popup.connect("id_pressed", self, "changeLanguage")

	# adiciona os idiomas disponíveis nas opções
	for language in Locales.getAvailableLanguages():
		popup.add_item(language)


func changeLanguage(id):
	# muda o idioma de acordo com a escolha
	Locales.language = Locales.getAvailableLanguages()[id]
	Locales.loadLanguage()
	# atuailza o menu
	_ready()


func _on_PlayButton_pressed():
	# ao apertar start, abre o nível 1
	if get_tree().change_scene("res://scenes/Level1.tscn") != OK:
		print ("An unexpected error occured when trying to switch to level 1 scene")


func _on_QuitButton_pressed():
	# ao apertar sair, fecha o jogo
	get_tree().quit()
