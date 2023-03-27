extends Node2D

func canPlayMinigame():
	return true


func _on_DeadZone_body_entered(body:Node):
	if not body.name == 'Player':
		return

	# quando o player cair no deadzone, ele vai ser teleportado para o spawnpoint (morre)

	yield(get_tree().create_timer(1), "timeout")
	if get_tree().reload_current_scene() != OK:
		print ('An unexpected error occured when trying to reload current scene')


func _ready():
	$Acid/Animation.play("acid")
	$Acid2/Animation.play("acid")
