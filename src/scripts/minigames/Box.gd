extends KinematicBody2D

export (int) var gravity = 3000
export (int) var horizontalVelocity = 0
var velocity = Vector2()

var falling = false

func _physics_process(delta):
	if falling:
		velocity.x = 0
		velocity.y += gravity * delta
		velocity = move_and_slide(velocity, Vector2(0, -1))
	else:
		if position.x > 960:
			horizontalVelocity = -50000
		elif position.x < 325:
			horizontalVelocity = 50000

		velocity.x = horizontalVelocity * delta
		velocity = move_and_slide(velocity, Vector2(-11, 0))

func _input(event):
	if event.is_action_pressed('interact'):
		falling = true
