extends Node

# idioma escolhido e padrão
var language = OS.get_locale()
var defaultLanguage = 'pt_BR'

# configuração de idiomas
var locale = {}
var availableLanguages = []
# nomes de personagens
var characters = {}
# falas
var dialogs = {}
# textos de botões
var buttons = {}
# textos configuracao
var settings = {}
# nomes de levels
var levels = []
# textos da prancheta
var clipboard = {}
# textos do tutorial
var tutorial = {}
# outros textos
var others = {}


func getAvailableLanguages():
	# retorna os idiomas disponíveis
	# limpa a lista de idiomas disponíveis
	availableLanguages = []
	# verifica os arquivos disponíveis na pasta de idiomas
	var localesDirectory = Directory.new()
	localesDirectory.open('res://locales/')
	localesDirectory.list_dir_begin()
	var file = localesDirectory.get_next()
	
	# passa arquivo por arquivo dentro da pasta
	while file != '':
		if (file.ends_with('.json')):
			# se for um arquivo de json, adiciona como idioma disponível
			availableLanguages.append(file.replace('.json', ''))

		file = localesDirectory.get_next()

	return availableLanguages


func loadLanguage():
	# lê e carrega o arquivo de idioma
	var file = File.new()
	var localeAvailable = file.open('res://locales/' + language + '.json', File.READ)
	if localeAvailable != OK:
		# se o idioma não estiver disponível, carrega o padrão
		print(language + ' language not currently supported, switching to ' + defaultLanguage)
		file.open('res://locales/' + defaultLanguage + '.json', File.READ)
	locale = parse_json(file.get_as_text())
	file.close()

	# carrega os idiomas por categoria
	characters = locale.characters
	dialogs = locale.dialogs
	buttons = locale.buttons
	settings = locale.settings
	levels = locale.levels
	clipboard = locale.clipboard
	tutorial = locale.tutorial
	others = locale.others


func _ready():
	loadLanguage()
