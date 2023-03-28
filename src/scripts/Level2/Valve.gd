extends Area2D

export (String) var Valves = 'valve'
var canInteract = false
var active = false

signal valveActivated

func showE():
	# mostra o E na tela, em cima do químico
	$E.visible = true
	$Tween.interpolate_property(
		$E,
		'position:y',
		-100,
		-200,
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
		-200,
		-100,
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


func _on_Valve_body_entered(_body):
	# destaca a vávula ao se aproximar
	if active:
		# se já foi acionada, não faz nada
		return

	$Stroke.visible = true
	canInteract = true
	get_parent().get_node("HUD/Gamepad/interact").modulate = Color(1, 1, 0.4)
	showE()


func _on_Valve_body_exited(_body):
	if active:
		# se já foi acionada, não faz nada
		return

	$Stroke.visible = false
	canInteract = false
	get_parent().get_node("HUD/Gamepad/interact").modulate = Color(1, 1, 1)
	hideE()


func _input(event):
	if active:
		# se já foi acionada, não faz nada
		return

	if event.is_action_pressed('interact') and canInteract:
		hideE()
		$Stroke.visible = false
		get_parent().get_node("HUD/Gamepad/interact").modulate = Color(1, 1, 1)
		$Tween.interpolate_property(
			self,
			'rotation_degrees',
			0,
			90,
			0.5,
			Tween.TRANS_LINEAR,
			Tween.EASE_IN_OUT
		)

		$Tween.start()
		active = true
		emit_signal("valveActivated")
