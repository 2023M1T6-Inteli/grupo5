extends Area2D

export (String) var Valves = 'valve'
var canInteract = false
var active = false

signal valveActivated

func _on_Valve_body_entered(_body):
	# destaca a vávula ao se aproximar
	if active:
		# se já foi acionada, não faz nada
		return

	$Stroke.visible = true
	canInteract = true
	get_parent().get_node("HUD/Gamepad/interact").modulate = Color(1, 1, 0.4)


func _on_Valve_body_exited(_body):
	$Stroke.visible = false
	canInteract = false
	get_parent().get_node("HUD/Gamepad/interact").modulate = Color(1, 1, 1)


func _input(event):
	if active:
		# se já foi acionada, não faz nada
		return

	if event.is_action_pressed('interact') and canInteract:
		active = true
		emit_signal("valveActivated")