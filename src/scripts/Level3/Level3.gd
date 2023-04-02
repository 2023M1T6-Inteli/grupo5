extends Node2D

onready var startScore = Global.score

func canPlayMinigame():
	return true


func _on_DeadZone_body_entered(body:Node):
	if not body.name == 'Player':
		return

	# quando o player cair no deadzone, ele vai ser teleportado para o spawnpoint (morre)
	yield(get_tree().create_timer(0.3), "timeout")
	Global.score = startScore
	if get_tree().reload_current_scene() != OK:
		print ('An unexpected error occured when trying to reload current scene')


func _ready():
	print(startScore)
	Music.change('Level3')
	$Acid/Animation.play("acid")
	$Acid2/Animation.play("acid")
