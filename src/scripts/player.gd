extends KinematicBody2D

export (int) var runSpeed = 500
export (int) var jumpSpeed = -1250
export (int) var gravity = 3000
onready var sprite = get_node('Sprite')
onready var animation = get_node('Animation')

var PPEs = []

var velocity = Vector2()


func movePlayer():
	# interpreta os inputs de movimentação e aplica as velocidades	
	velocity.x = 0
	# recebe os inputs de movimentação
	var right = Input.is_action_pressed('move_right')
	var left = Input.is_action_pressed('move_left')
	var jump = Input.is_action_just_pressed('jump')

	# aplica as velocidades de acordo com o movimento desejado
	if jump and is_on_floor():
		velocity.y = jumpSpeed
	if right: 
		velocity.x += runSpeed
		animation.play('run')
		sprite.flip_h = false 
	if left:
		velocity.x -= runSpeed
		animation.play('run')
		sprite.flip_h = true


func _physics_process(delta):
	# realiza a movimentação do player
	movePlayer()
	# calcula a velocidade em y de acordo com a gravidade
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2(0, -1))
