extends Node

var language = 'pt-BR'

var locale = {}
var characters = {}
var dialogs = {}


func loadLanguage():
	var file = File.new()
	file.open('res://locales/' + language + '.json', File.READ)
	var data = parse_json(file.get_as_text())
	locale = data


func _ready():
	loadLanguage()
	characters = locale.get('characters')
	dialogs = locale.get('dialogs')
