extends Node

var language = 'en-US'

var locale = {}
var characters = {}
var dialogs = {}
var buttons = {}
var availableLanguages = []


func getAvailableLanguages():
	availableLanguages = []
	var localesDirectory = Directory.new()
	localesDirectory.open('res://locales/')
	localesDirectory.list_dir_begin()
	var file = localesDirectory.get_next()

	while file != '':
		if (file != '.' and file != '..'):
			availableLanguages.append(file.replace('.json', ''))
		file = localesDirectory.get_next()

	return availableLanguages


func loadLanguage():
	var file = File.new()
	file.open('res://locales/' + language + '.json', File.READ)
	var data = parse_json(file.get_as_text())
	locale = data
	
	characters = locale.get('characters')
	dialogs = locale.get('dialogs')
	buttons = locale.get('buttons')


func _ready():
	loadLanguage()
