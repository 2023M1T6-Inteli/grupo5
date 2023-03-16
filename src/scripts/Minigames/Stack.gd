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
	currentBox = Global.stackBox.instance()

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
	# atualiza escala e posição da box atual
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


func closeMinigame():
	Global.minigameRunning = false
	get_parent().get_node('Clipboard').visible = true
	queue_free()


func _on_RestartButton_pressed():
	# recarrega a cena na tela
	var newScene = Global.minigames.Stack.instance()
	get_node("/root/Level1/HUD").add_child(newScene)
	queue_free()


func _on_ContinueButton_pressed():
	closeMinigame()


func _input(event):
	if event.is_action_pressed('ui_cancel'):
		# tecla ESC fecha o minigame
		closeMinigame()


func _ready():
	# desabilita a visualização da tela de vencedor e perdedor
	$LoseScreen.visible = false
	$WinScreen.visible = false
	# carrega os textos da tela de vitória e derrota do mingame
	$LoseScreen/Background2/Lose.text = Locales.others.lose
	$LoseScreen/Background2/RestartButton.text = Locales.others.restart
	$WinScreen/Background2/Lose.text = Locales.others.win
	$WinScreen/Background2/ContinueButton.text = Locales.others.continue
	get_parent().get_node('Clipboard').visible = false
	$Clipboard.slideToScreen()


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



func _on_ButtonX_pressed():
	# Botão de fechar com o X
	closeMinigame()
