extends KinematicBody2D

export (int) var run_speed = 300 #velocidade da corrida
export (int) var jump_speed = -400 #velocidade do pulo
export (int) var gravity = 1200 #velocidade da gravidade

onready var sprite = get_node("Sprite")

var velocity = Vector2()
var jumping = false

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed("move_right")
	var left = Input.is_action_pressed("move_left")
	var jump = Input.is_action_just_pressed("jump")

	if jump and is_on_floor():
		jumping = true
		velocity.y = jump_speed
	if right:
		velocity.x += run_speed
		sprite.flip_h = false
	if left:
		velocity.x -= run_speed
		sprite.flip_h = true

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	if jumping and is_on_floor():
		jumping = false
	velocity = move_and_slide(velocity, Vector2(0, -1))
