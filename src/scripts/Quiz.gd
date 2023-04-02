extends Node2D


onready var question = Locales.quiz.questions[randi() % Locales.quiz.questions.size()]
var rightBox = load('res://assets/Minigames/PhTest/rightBox.png')
var wrongBox = load('res://assets/Minigames/PhTest/wrongBox.png')
var questionCounter = 0


func _ready():
	for answer in get_tree().get_nodes_in_group('answer'):
		answer.connect('pressed', self, 'on_answer_pressed', [answer])

	load_new_question()


func load_new_question():
	print('new')
	# carrega uma nova questao
	randomize()
	question = Locales.quiz.questions[randi() % Locales.quiz.questions.size()]
	$Question.text = question.question
	$Tip.text = question.tip

	var counter = 0
	for answer in get_tree().get_nodes_in_group('answer'):
		answer.get_node('Label').text = question.answers[counter]
		answer.disabled = false
		answer.modulate.a = 1
		answer.get_node('Box').texture = rightBox
		counter += 1

	questionCounter += 1


func on_answer_pressed(chosen):
	for answer in get_tree().get_nodes_in_group('answer'):
		answer.disabled = true
		if answer != chosen:
			answer.modulate.a = 0.5

		if answer.get_node('Label').text == question.correctAnswer:
			answer.get_node('Box').texture = rightBox
			answer.modulate.a = 1
		else:
			answer.get_node('Box').texture = wrongBox


	if chosen.get_node('Label').text == question.correctAnswer:
		Global.score += 1
	else:
		Global.score -= 1

	yield(get_tree().create_timer(3), 'timeout')
	load_new_question()
