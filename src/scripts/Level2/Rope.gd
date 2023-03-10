extends Area2D

var canInteract = false
var verticalVelocity = 200
var currentVelocity = Vector2()

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
		$"../Player".paused = false
		return
		
	$"../Player".paused = true
	$"../Player/Animation".play("reset" + Global.characterName)

	if Input.is_action_pressed("climb_up"):
		$"../Player".position.y -= 10
	if Input.is_action_pressed("climb_down"):
		$"../Player".position.y += 10
	if Input.is_action_pressed("move_right"):
		$"../Player".position.x += 10
	if Input.is_action_pressed("move_left"):
		$"../Player".position.x -= 10
