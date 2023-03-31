extends Area2D

var canInteract = false
var verticalVelocity = 200


func _on_body_entered(body):
	if body.name != 'Player':
		return
	canInteract = true


func _on_body_exited(body):
	if body.name != 'Player':
		return
	canInteract = false


func _process(_delta):
	if not canInteract:
		Global.playerPaused = false
		return

	# Pausa o processamento padrão de movimentação do player
	Global.playerPaused = true
	$"../Player/Animation".play("reset" + Global.characterName)

	# Interpreta os inputs de movimentação
	if Input.is_action_pressed("climb_up"):
		$"../Player".position.y -= 10
	if Input.is_action_pressed("climb_down"):
		$"../Player".position.y += 10
	if Input.is_action_pressed("move_right"):
		$"../Player".position.x += 10
	if Input.is_action_pressed("move_left"):
		$"../Player".position.x -= 10
