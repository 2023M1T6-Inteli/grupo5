extends Area2D

var canInteract = false
var verticalVelocity = 200


signal inRope
signal outRope


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
		emit_signal('outRope')
		return

	emit_signal('inRope')

	# Interpreta os inputs de movimentação
	if Input.is_action_pressed('climb_up'):
		$'../Player'.position.y -= 10
	if Input.is_action_pressed('climb_down'):
		$'../Player'.position.y += 10
	if Input.is_action_pressed('move_right'):
		$'../Player'.position.x += 10
	if Input.is_action_pressed('move_left'):
		$'../Player'.position.x -= 10
