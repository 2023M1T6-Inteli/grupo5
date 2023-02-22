extends Node2D

var score = 0
# indica se o jogador está jogando
var playing = true
# box que está sendo manipulada
onready var currentBox = $Box
# posição da última box
var lastBoxPosition = Vector2(630, 615)
# tamanho da última box
var lastScale = 1
# diferença de posição entre a última box e a atual
var deltaPosition = 0


func duplicateBox():
	# corta e atualiza escala e posição a box atual
	cropBox()
	updateBox()
	lastBoxPosition = currentBox.position
	
	# carrega e instancia uma nova box na cena
	currentBox = load('res://scenes/minigames/stack/Box.tscn')
	currentBox = currentBox.instance()

	# configura a nova box com as configurações atuais 
	updateBox()
	# adiciona o node na cena
	add_child_below_node($Box, currentBox)


func cropBox():
	# calcula a diferença de posição
	deltaPosition = (lastBoxPosition.x - currentBox.position.x) * -1
	# calcula a porcentagem do tamanho que deve ser reduzida
	var percentage = abs(deltaPosition)/(500*lastScale)
	# aplica a nova escala
	lastScale = lastScale * (1-percentage)


func updateBox():
	currentBox.position.x -= deltaPosition/2
	currentBox.scale.x = lastScale


func win():
	# desativa o jogo
	playing = false
	# pinta a box atual de verde
	currentBox.get_node('ColorRect').modulate = Color(0, 1, 0, 1)
	$WinScreen.visible = true
	

func lose():
	# desativa o jogo
	playing = false
	# pinta a box atual de vermelho
	currentBox.get_node('ColorRect').modulate = Color(1, 0, 0, 1)
	$LoseScreen.visible = true


func _on_RestartButton_pressed():
	if get_tree().reload_current_scene() != OK:
		print('An unexpected error occured when trying to reload stack scene')

func _on_ContinueButton_pressed():
	queue_free()


func _ready():
	$LoseScreen.visible = false
	$WinScreen.visible = false


func _process(_delta):
	if playing:
		# se o jogo está ativo
		if currentBox.position.y >= lastBoxPosition.y:
			# se a box atual passou da anterior, o jogador perde
			lose()
			return

		if currentBox.is_on_floor():
			# se a box atual colide com a anterior
			# aumenta o score
			score += 1
			if score == 10:
				# ganha ao atingir 10 caixas
				win()
				return
			# cria uma nova box
			duplicateBox()

	# atualiza a pontuação na tela
	$ScoreLabel.text = str(score)
