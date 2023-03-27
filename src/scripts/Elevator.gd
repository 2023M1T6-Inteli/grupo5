extends Area2D

var canInteract = false


func showE():
	# mostra o E na tela, em cima do químico
	$E.visible = true
	$Tween.interpolate_property(
		$E,
		'position:y',
		-235,
		-260,
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
	# esconde o E na tela, de cima do químico
	$Tween.interpolate_property(
		$E,
		'position:y',
		-260,
		-235,
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


func _on_Elevator_body_entered(_body):
	# quando o player se aproxima do elevador executa a animação de abertura
	$Animation.play('open')
	canInteract = true
	# muda a cor do botão de interagir
	get_parent().get_node('HUD/Gamepad/interact').modulate = Color(1, 1, 0.4)
	showE()


func _on_Elevator_body_exited(_body):
	$Animation.play('close')
	canInteract = false
	get_parent().get_node('HUD/Gamepad/interact').modulate = Color(1, 1, 1)
	hideE()


func changeLevel():
	if get_tree().change_scene('res://scenes/' + Global.currentLevel + '.tscn') != OK:
		print('An unexpected error occured when trying to switch to next scene')


func _input(event):
	if not canInteract:
		return

	if not event.is_action_pressed('interact'):
		return

	# faz a troca de cena baseada na variável global do nível
	if Global.currentLevel == 'Tutorial':
		Global.currentLevel = 'Level1'
		changeLevel()

	elif Global.currentLevel == 'Level1':
		Global.currentLevel = 'Level2'
		changeLevel()

	elif Global.currentLevel == 'Level2':
		Global.currentLevel = 'Level3'
		changeLevel()
