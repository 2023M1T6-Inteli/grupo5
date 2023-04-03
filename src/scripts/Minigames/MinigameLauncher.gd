extends Area2D

export (String) var minigameName
export (Texture) var spriteTexture
export (Texture) var strokeTexture

# flag para indicar se o jogador está na área de interação
var canInteract = false


func showE():
	# mostra o E na tela, em cima do objeto
	$E.visible = true
	$Tween.interpolate_property(
		$E,
		'position:y',
		-55,
		-80,
		0.2
	)
	$Tween.interpolate_property(
		$E,
		'modulate:a',
		0,
		1,
		0.3
	)
	$Tween.start()


func hideE():
	# esconde o E na tela, de cima do objeto
	$Tween.interpolate_property(
		$E,
		'position:y',
		-80,
		-55,
		0.2
	)
	$Tween.interpolate_property(
		$E,
		'modulate:a',
		1,
		0,
		0.3
	)
	$Tween.start()


func _on_minigame_body_entered(_body):
	# ao entrar na área de interação, o stroke aparece, a flag é setada e a tecla E é destacada
	$Stroke.visible = true
	canInteract = true
	$"../HUD/Gamepad/interact".modulate = Color(1, 1, 0.4)
	showE()


func _on_minigame_body_exited(_body):
	# ao sair da área de interação, as configurações padrão de stroke, flag e gamepad são resetadas
	$Stroke.visible = false
	canInteract = false
	$"../HUD/Gamepad/interact".modulate = Color(1, 1, 1)
	hideE()

	if minigameName in Global.alreadyPlayed:
		set_deferred("monitoring", false)
		set_deferred("monitorable", true)


func _input(event):
	if Global.playerPaused:
		# se o minigame já está rodando, o input não é processado
		return

	if event.is_action_released('interact') and canInteract:
		# se o usuário está na área de interação e aperta uma tecla de interação
		if not $"..".canPlayMinigame():
			# se o player ainda não consegue rodar, retorna
			return

		# carrega o minigame na cena
		var minigame = Global.minigames.get(minigameName)
		Global.currentLevel = minigameName
		minigame = minigame.instance()
		$"../HUD".add_child(minigame)
		# indica que o minigame está rodando
		Global.playerPaused = true
		canInteract = false


func _ready():
	# carrega as sprites
	$Sprite.texture = spriteTexture
	$Stroke.texture = strokeTexture
