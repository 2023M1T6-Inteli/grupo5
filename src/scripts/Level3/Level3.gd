extends Node2D

func canPlayMinigame():
	return true


func _on_DeadZone_body_entered(body:Node):
	if not body.name == 'Player':
		return

	yield(get_tree().create_timer(2), "timeout")
	if get_tree().reload_current_scene() != OK:
		print ('An unexpected error occured when trying to reload current scene')
