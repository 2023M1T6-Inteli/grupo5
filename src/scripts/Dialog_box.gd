extends Control

onready var photo: TextureRect = $photo
onready var nome: Label = $name
onready var question: Label = $questions
onready var choices: VBoxContainer = $escolhas

var text_count = 1
var conversation_data := {}
var conversation_idx := 0
var data

func _ready() -> void:
	_setup(conversation_idx)

func _setup(section: int) -> void:
	data = conversation_data[section]
	nome.text = data.name
	question.text = data.question
	photo.texture = load("res://Assets/Photo/" + data.photo)

	for child in choices.get_children():
		child.queue_free()

	for option in data.options:
		var button = LinkButton.new()
		button.underline = LinkButton.UNDERLINE_MODE_ON_HOVER
		button.text = option.text
		button.connect("pressed", self, "on_button_pressed", [option.next])
		choices.add_child(button)



func _on_button_pressed(next) -> void:
	if next == -1: 
		queue_free()
	else: 
		_setup(next)
		
	


func _on_proximo_pressed():
	_setup(text_count)
