extends Area2D

export (String) var Valves = 'valve'
var canInteract = false

func _on_Valve_body_entered(_body):
	$Stroke.visible = true
	canInteract = true
	get_parent().get_node("HUD/Gamepad/interact").modulate = Color(1, 1, 0.4)


func _on_Valve_body_exited(_body):
	$Stroke.visible = false
	canInteract = false
	get_parent().get_node("HUD/Gamepad/interact").modulate = Color(1, 1, 1)


func _input(event):
	if event.is_action_pressed('interact') and canInteract:
		print('Válvula') # colocar som de valvula
