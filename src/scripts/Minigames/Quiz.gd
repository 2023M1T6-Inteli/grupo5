extends Node2D

onready var question = Locales.quiz.questions[randi() % Locales.quiz.questions.size()]
var rightBox = load('res://assets/Minigames/PhTest/rightBox.png')
var wrongBox = load('res://assets/Minigames/PhTest/wrongBox.png')
var questionCounter = 0

var quizScore = 5


func closeMinigame():
	Global.playerPaused = false
	get_parent().get_node('Clipboard').visible = true
	Global.alreadyPlayed.append(Global.currentLevel)
	Global.currentLevel = 'Level4'
	queue_free()


func load_new_question():
	# carrega uma nova questao
	randomize()
	question = Locales.quiz.questions[randi() % Locales.quiz.questions.size()]
	Locales.quiz.questions.erase(question)
	$Question.text = question.question
	$Tip.text = question.tip

	var counter = 0
	for answer in get_tree().get_nodes_in_group('answer'):
		answer.get_node('Label').text = question.answers[counter]
		answer.disabled = false
		answer.get_node('Box').modulate.a = 1
		answer.get_node('Box').texture = rightBox
		counter += 1

	questionCounter += 1


func _input(event):
	if event.is_action_pressed('ui_cancel'):
		# tecla ESC fecha o minigame
		closeMinigame()


func on_answer_pressed(chosen):
	for answer in get_tree().get_nodes_in_group('answer'):
		answer.disabled = true
		if answer != chosen:
			answer.get_node('Box').modulate.a = 0.5

		if answer.get_node('Label').text == question.correctAnswer:
			answer.get_node('Box').texture = rightBox
			answer.get_node('Box').modulate.a = 1
		else:
			answer.get_node('Box').texture = wrongBox


	if chosen.get_node('Label').text == question.correctAnswer:
		quizScore += 5
	else:
		quizScore -= 1

	yield(get_tree().create_timer(3), 'timeout')

	if questionCounter < 5:
		load_new_question()
	else:
		Global.score += quizScore
		closeMinigame()


func _ready():
	for answer in get_tree().get_nodes_in_group('answer'):
		answer.connect('pressed', self, 'on_answer_pressed', [answer])

	load_new_question()
