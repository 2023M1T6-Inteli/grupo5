extends Area2D

var canInteract = false


func _on_Elevator_body_entered(_body):
	$Animation.play('open')
	canInteract = true
	get_parent().get_node('HUD/Gamepad/interact').modulate = Color(1, 1, 0.4)


func _on_Elevator_body_exited(_body):
	$Animation.play('close')
	canInteract = false
	get_parent().get_node('HUD/Gamepad/interact').modulate = Color(1, 1, 1)


func _input(event):
	if event.is_action_released('interact') and canInteract:
		if get_tree().change_scene('res://scenes/Level2.tscn') != OK:
			print ('An unexpected error occured when trying to switch to next scene')


func _ready():
	pass # Replace with function body.




