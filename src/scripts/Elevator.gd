extends Area2D

var canInteract = false


func _on_Elevator_body_entered(_body):
	# quando o player se aproxima do elevador executa a animação de abertura
	$Animation.play('open')
	canInteract = true
	# muda a cor do botão de interagir
	get_parent().get_node('HUD/Gamepad/interact').modulate = Color(1, 1, 0.4)


func _on_Elevator_body_exited(_body):
	$Animation.play('close')
	canInteract = false
	get_parent().get_node('HUD/Gamepad/interact').modulate = Color(1, 1, 1)


func _input(event):
	if event.is_action_released('interact') and canInteract:
		Global.currentLevel = 'Level2'
		if get_tree().change_scene('res://scenes/Level2.tscn') != OK:
			print ('An unexpected error occured when trying to switch to next scene')
