extends Area2D

var canInteract = false

export (String) var targetLevel = 'Level1'


func showE():
	# mostra o E na tela, em cima do objeto
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
	# esconde o E na tela, de cima do objeto
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


func _input(event):
	if not canInteract:
		return

	if not event.is_action_pressed('interact'):
		return

	Global.currentLevel = targetLevel

	# faz a troca de cena baseada na variável global do nível
	if get_tree().change_scene('res://scenes/' + targetLevel + '.tscn') != OK:
		print('An unexpected error occured when trying to switch to next scene')
